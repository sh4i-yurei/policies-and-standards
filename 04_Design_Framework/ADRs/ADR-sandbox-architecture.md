# ADR: Docker Sandbox Architecture for Test and Type-Check Execution

## Metadata

- Title: Docker-based sandbox for isolated test and type-check execution
- Status: accepted
- Date: 2026-03-06
- Related issue or spec: STD-030 Gate D, STD-008 s5, STD-057 s5

## Context

AI agent code execution (tests, type checks) runs on the host with full
filesystem and network access. This creates several risks:

- Tests can produce host-side artifacts that affect subsequent runs
- Network access during tests enables unintended external calls
- Stale environment state (cached modules, orphaned processes) produces
  non-deterministic results
- Agent-authored code executes with the user's full permissions

The workspace runs on WSL2 (Ubuntu) with Docker Desktop providing
container support via WSL integration.

## Decision drivers and evaluation criteria

1. Isolation: tests must not affect host state or access the network
2. Dependency fidelity: sandbox must have project dependencies installed
3. Performance: image rebuild only when dependencies change
4. Visibility: execution mode (sandboxed vs in-host) must be unambiguous
5. Fallback: must work when Docker is unavailable, but fallback must be
   loud and logged
6. WSL2 compatibility: must work with Docker Desktop WSL integration

## Options considered

- **Option 1: Custom Docker sandbox** - Per-project Docker images with
  `--network=none`, read-only source mounts, resource limits. Hook
  delegation with visible in-host fallback.
- **Option 2: `@anthropic-ai/sandbox-runtime`** - Anthropic's official
  sandbox runtime for Claude Code. Uses bubblewrap on Linux.
- **Option 3: In-host execution only** - No isolation, rely on venv and
  test configuration for safety.

## Decision

**Option 1: Custom Docker sandbox.**

Option 2 was evaluated in Phase 4 and deferred. The `sandbox-runtime`
package requires Claude Code's `/sandbox` command, which is incompatible
with WSL2 (GitHub issues #10038, #10567). May revisit when WSL2 support
lands.

Option 3 is the status quo and provides no isolation guarantees.

## Architecture

### Components

- **`sandbox-exec.sh`** - Central dispatcher. Detects language, builds
  per-project images (hash-cached via dep file checksums), runs
  containers with `--network=none`, `--memory=2g`, `--cpus=2`,
  read-only source mount. Logs all executions to JSONL.

- **`sentinel.sh`** / **`typecheck.sh`** - PostToolUse hooks that
  delegate to `sandbox-exec.sh`. Fall back to in-host when Docker
  returns exit 127. All results tagged `(sandbox)` or `(in-host)`.

- **`sandbox-test.sh`** - User-facing script that delegates to
  `sandbox-exec.sh`. Exits 1 (not 127) when Docker unavailable,
  forcing callers to handle the failure explicitly.

- **`sandbox-metrics.sh`** / **`sandbox-cleanup.sh`** - Monitoring
  and maintenance. Metrics include fallback frequency.

### Image strategy

- Base images: `claude-sandbox-python:latest`, `claude-sandbox-go:latest`
- Per-project images: `claude-sandbox-<project>:latest` with deps
  pre-installed. Rebuilt when dep file hash changes (stored as Docker
  label `deps-hash`).

### Fallback visibility

Every execution path reports its mode:

- `(sandbox)` - ran in Docker container
- `(in-host)` - Docker unavailable, ran on host

Fallback events are logged to `~/.claude/logs/sandbox/` with
`"event":"fallback"` and a reason field. Session start checks Docker
availability and warns if it's down.

## Consequences

- Positive: Network-isolated test execution, deterministic environments,
  visible execution mode, measurable fallback frequency
- Negative: Docker Desktop must be running for sandbox isolation.
  Per-project image builds add ~30s on first run (cached thereafter).
- Follow-up: Revisit `sandbox-runtime` when WSL2 support is added.
  Consider auto-starting Docker Desktop via session-start hook.
