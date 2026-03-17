---
id: STD-067
title: Agent Process Discipline
version: 1.0.9
category: workflow
status: draft
approver: sh4i-yurei
reviewer: sh4i-yurei
owner: sh4i-yurei
last_updated: 2026-03-17
review_date: 2026-06-14
extends:
  - STD-000
  - STD-005
  - STD-030
  - STD-032
  - STD-031
tags:
  - process
  - discipline
  - interlocks
  - hooks
  - enforcement
  - TDD
  - ai-assisted
  - workflow
---

# Purpose

Define forcing functions and interlocks that prevent AI coding agents
from skipping development process steps under task pressure.

Context-window rules are voluntary: the agent can ignore them when
focused on task completion, and context compression can drop them
entirely. This standard establishes involuntary enforcement mechanisms
that execute regardless of what the agent remembers or prioritizes.

The design draws on three proven disciplines:

- **Read-Do checklists** (Gawande, 2009): step-by-step forced execution
  prevents omission errors far more effectively than Do-Confirm
  (work-from-memory-then-check) approaches. Surgical checklist
  adoption reduced deaths 47% and ICU infections 66%.
- **Forcing functions** (Norman, 2013; NSF PAR 10344838): interlocks
  enforce sequential completion — downstream actions are physically
  impossible until upstream prerequisites are verified.
- **Defense in depth** (safety engineering): no single enforcement layer
  is sufficient. Layering rules, state tracking, advisory hooks,
  blocking hooks, and CI gates ensures no single failure allows a step
  to be skipped.

# Scope

This standard applies to all AI-assisted development sessions in
governed projects (Tier 2 and above per
[SDLC_With_AI](SDLC_With_AI.md)).

It supplements [SDLC_With_AI](SDLC_With_AI.md) (STD-032) with
enforcement mechanisms specific to AI agent tool use. It does not
replace human judgment or override explicit human instructions.

Out of scope: human-only development workflows without AI agent
involvement. CI/CD gate definitions (covered by
[CI_CD_Pipeline_Model](CI_CD_Pipeline_Model.md) STD-030). Git
workflow mechanics (covered by
[git_and_branching_workflow](git_and_branching_workflow.md) STD-031).

# Standard

## 1. The 12-Step Development Process

Every task that modifies source files MUST follow this process. Each
step has defined entry criteria, exit criteria, artifacts produced, and
an enforcement mechanism.

| Step | Name | Entry Criteria | Exit Criteria | Artifact | Enforcement |
|------|------|----------------|---------------|----------|-------------|
| 1 | Research | Task received | Problem understood, existing code read | Notes (mental or written) | None (cognitive) |
| 2 | Plan | Research complete | Approach designed, human approval for multi-file changes | Plan file or mental model | Plan mode for >1 file or >1 hour |
| 3 | Write tests | Plan approved | Test cases exist covering requirements | Test file(s) with failing assertions | TDD mandate (§2) |
| 4 | Run tests | Tests written | Tests FAIL (confirms tests are meaningful) | Test output showing failures | Sandbox execution (§3) |
| 5 | Implement | Tests failing | Minimum code to pass tests | Source file(s) | TDD mandate (§2) |
| 6 | Run tests | Implementation complete | Tests PASS | Test output showing passes | Sandbox execution (§3), sentinel.sh updates process-state |
| 7 | Audit | Tests passing | Diffs reviewed, no unintended changes | Audit breadcrumb | enforce-audit.sh (§4) |
| 8 | Adjust | Audit findings | Issues from audit fixed | Updated source/test files | Re-run steps 6-7 if changes made |
| 9 | Code review | Audit clean | Static analysis passes | CodeRabbit output | /pr-ready skill |
| 10 | Adjust | Review findings | Issues from review fixed | Updated source/test files | Re-run steps 6-7 if changes made |
| 11 | Commit | All prior gates green | Clean commit with conventional message | Git commit SHA | pre-commit-gate.sh (§5) |
| 12 | Push | Commit created | All applicable checks per tier clean; Hotfix: no gate (§5.5) | Remote ref updated | pre-push-gate.sh (§6) |

Steps 8 and 10 loop back to step 6 when changes are made: any code
modification requires re-running tests and re-auditing before commit.

## 2. TDD Requirements

These requirements are normative, not advisory.

2.1 Tests MUST be written BEFORE implementation code (steps 3-4 before
step 5). The agent MUST NOT write implementation code for any function
or module until a corresponding test exists.

2.2 Tests MUST fail on first run (step 4). A test that passes before
implementation is written is not testing the right thing. It MUST be
fixed or the implementation approach reconsidered.

2.3 Implementation MUST be the minimum code to make tests pass (step 5).
No speculative features, no "while I'm here" additions. The tests
define the scope of implementation.

2.4 Tests MUST pass after implementation (step 6). If they do not, the
implementation is wrong. Fix the code, not the test (unless the test
itself has a defect, which MUST be documented in the commit message).

2.5 TDD applies to feature and bugfix tiers (§5). Config/docs and
hotfix tiers are exempt from steps 3-6.

2.6 Within feature and bugfix tiers, narrow exceptions to TDD are
permitted: an urgent fix where the fix is obvious and a test is added
immediately after. Each exception MUST be justified in the commit
message. Config/docs and hotfix tiers are fully exempt per §2.5.

## 3. Sandbox-Mandatory Testing

3.1 All test execution MUST run inside Docker sandbox containers via
`sandbox-exec.sh`. In-host execution is NOT acceptable when Docker is
available.

3.2 Sandbox containers provide: network isolation (`--network=none`),
read-only source mounts, per-project dependency images, and timeout
enforcement. These constraints ensure tests verify behavior in a clean
environment, not against accumulated host state.

3.3 If Docker is unavailable, test execution MUST be flagged as
"(in-host)" and treated as degraded. When Docker is genuinely
unavailable (not running), in-host results satisfy gate prerequisites
in degraded mode — gates accept them but log the degraded status per
STD-008 §5.2–§5.3. When Docker IS running but sandbox-exec.sh fails,
in-host fallback is not acceptable (see §3.4).

3.4 If `sandbox-exec.sh` returns exit 127 while Docker is running, that
is a sandbox bug. It MUST be fixed before proceeding. The agent MUST
NOT fall back to in-host execution as a workaround.

3.5 Test results (pass/fail, timestamp) are recorded in
`process-state.json` by sentinel.sh after each execution. Runner type
(sandbox or in-host) is recorded in chronicle event logs for
compliance tracking. The process-state record is read by
pre-commit-gate.sh to verify test prerequisites.

## 4. Audit Requirements

4.1 After tests pass (step 6), the agent MUST audit its work (step 7)
by reading its own staged changes (`git diff --cached` or equivalent).

4.2 The audit MUST verify:

  a. Changes match the plan from step 2.
  b. No unintended side effects (files changed that should not be).
  c. Cross-references are valid (imports, function calls, documentation
     links).
  d. Same class of bug is not repeated. If bug A was fixed in file X,
     files Y and Z that use the same pattern MUST be checked.

4.3 Audit completion is tracked via a breadcrumb file
(`/tmp/.audit-evidence-<branch>`) consumed by enforce-audit.sh, and
recorded in `process-state.json`. pre-commit-gate.sh blocks commits
without a completed audit. The branch name in the breadcrumb path is
sanitized (slashes replaced with double underscores) to produce a
valid filename for branch prefixes like `feature/` and `fix/`.

4.4 Audit is mandatory for ALL strictness tiers, including hotfix.
Even emergency changes must be reviewed before committing.

## 5. Strictness Tiers

Task type determines which steps are mandatory. Tier is detected from
the git branch prefix, with an environment variable override.

| Tier | Branch Prefix | Mandatory Steps | Skipped Steps |
|------|---------------|-----------------|---------------|
| Feature | `feature/*` (default) | All 12 | None |
| Bugfix | `fix/*` | 1 (light), 2 (light), 3-12 | None (steps 1-2 are lighter) |
| Config/Docs | `docs/*`, `chore/*` | 1, 2, 7-12 | 3-6 (TDD) |
| Hotfix | N/A (see §5.4) | 7, 11, 12 | 1-6, 8-10 |

5.1 Tier detection: branch name prefix maps to tier per the table
above. If the branch name does not match a known prefix, the feature
tier applies (most restrictive).

5.2 Override: `PROCESS_TIER=<tier>` environment variable overrides
branch-based detection. Valid values: `feature`, `bugfix`,
`config-docs`, `hotfix`.

5.3 Tier assignment SHOULD be confirmed at branch creation. Incorrect
tier assignment (e.g., using `docs/` prefix for a feature change)
undermines enforcement and is a compliance violation.

5.4 Hotfix tier is activated exclusively via `PROCESS_TIER=hotfix`
environment variable. Use a `fix/` branch per
[git_and_branching_workflow](git_and_branching_workflow.md) (STD-031)
and set the environment variable to override tier detection.

5.5 Both pre-commit-gate and pre-push-gate are tier-aware. They only
enforce checks applicable to the current tier:

| Tier | pre-commit-gate checks | pre-push-gate checks |
|------|------------------------|----------------------|
| Feature | tests, lint, typecheck, audit | tests, lint, typecheck |
| Bugfix | tests, lint, typecheck, audit | tests, lint, typecheck |
| Config/Docs | lint, audit | lint (cspell, markdownlint) |
| Hotfix | audit only | skipped (does not block) |

For Hotfix tier, step 12 (Push) is still performed but
`pre-push-gate.sh` does not block it.

## 6. Process State Tracking

6.1 Hooks coordinate through a shared state file at
`~/.claude/sessions/$SESSION_ID/process-state.json`. This file acts as
a workpiece token (analogous to MES state tracking in manufacturing):
each hook stamps its results, and downstream hooks verify upstream
completion.

6.2 Schema:

```json
{
  "session_id": "string (UUID)",
  "branch": "string (current git branch)",
  "tier": "feature | bugfix | config-docs | hotfix",
  "tests": {
    "status": "pass | fail | skipped | unknown",
    "updated_at": "ISO 8601 timestamp or null"
  },
  "lint": {
    "status": "pass | warn | fail | skipped | unknown",
    "updated_at": "ISO 8601 timestamp or null"
  },
  "typecheck": {
    "status": "pass | fail | skipped | unknown",
    "updated_at": "ISO 8601 timestamp or null"
  },
  "audit": {
    "status": "done | pending",
    "updated_at": "ISO 8601 timestamp or null"
  },
  "updated_at": "ISO 8601 timestamp"
}
```

6.3 Writers and readers:

| Field | Writer | Reader |
|-------|--------|--------|
| tests | sentinel.sh (PostToolUse) | pre-commit-gate.sh, pre-push-gate.sh |
| lint | forge.sh (PostToolUse) | pre-commit-gate.sh, pre-push-gate.sh |
| typecheck | typecheck.sh (PostToolUse) | pre-commit-gate.sh, pre-push-gate.sh |
| audit | enforce-audit.sh (PreToolUse) | pre-commit-gate.sh |

6.4 Lifecycle: the state file is session-scoped. It is created on first
hook write and reset when a new session starts. This forces
re-verification of all prerequisites at session boundaries, which is
correct because session state may have drifted.

6.5 Writes MUST use advisory file locking (flock) to prevent corruption
from concurrent hook execution. The `hook-lock.sh` library provides
`_locked_write_json` for atomic updates.

6.6 If the branch in `process-state.json` does not match the current
git branch, the state MUST be treated as stale. Hooks MUST enforce
based on the tier as if no state exists (unknown status for all fields).

## 7. Defense in Depth

Process compliance is enforced through five independent layers. No
single layer is sufficient; the combination ensures no single failure
allows a step to be skipped.

| Layer | Mechanism | Type | Failure Mode |
|-------|-----------|------|--------------|
| 1. Rules | CLAUDE.md, rules/*.md, instincts | Cognitive guidance | Agent ignores under task pressure; context compression drops rules |
| 2. State | process-state.json | Shared observability | File corruption, stale data, missing writes |
| 3. Advisory hooks | sentinel.sh, forge.sh, typecheck.sh | Feedback (PostToolUse, async) | Agent sees warning after already moving on |
| 4. Blocking hooks | pre-commit-gate.sh, pre-push-gate.sh, enforce-audit.sh | Interlocks (PreToolUse, sync) | Hook bugs, misconfiguration, bypass |
| 5. CI gates | GitHub Actions (Gates A-G) | Final verification | Post-push only; catch-late, fix-push cycle |

Layer 4 (blocking hooks) is the primary enforcement mechanism. Layers
1-3 provide feedback and state that Layer 4 reads. Layer 5 is the
safety net for anything Layers 1-4 miss.

## 8. Hook Classification

All hooks below are defined in the agent-ops repository (`hooks/`
directory) and deployed to `~/bin/hooks/` at install time.

| Hook | Type | Event | Enforces |
|------|------|-------|----------|
| pre-commit-gate.sh | Blocking | PreToolUse (Bash: git commit) | Tests passed, lint clean, typecheck clean, audit done (per tier) |
| pre-push-gate.sh | Blocking | PreToolUse (Bash: git push) | Applicable test suite, linters, type checkers per tier (§5.5) |
| enforce-audit.sh | Blocking | PreToolUse (Bash: git commit) | Diff reviewed before commit |
| enforce-issue.sh | Blocking | PreToolUse (Bash: git checkout -b) | Issue exists before branch creation |
| pr-gate.sh | Blocking | PreToolUse (Bash: gh pr create) | /pr-ready run, issue linked |
| tollgate.sh | Blocking | PreToolUse (create_pull_request) | Clean working tree before PR |
| sentinel.sh | Advisory | PostToolUse (Write, Edit, async) | Tests run after source edits |
| forge.sh | Advisory | PostToolUse (Write, Edit, sync) | Format + lint after edits |
| typecheck.sh | Advisory | PostToolUse (Write, Edit, async) | Type checking after edits |

Blocking hooks MUST use exit code 2 to prevent tool execution. Advisory
hooks provide feedback via `systemMessage` in their JSON output.

## 9. Bypass Policy

9.1 `PROCESS_BYPASS=1` environment variable skips all process-state
checks in pre-commit-gate.sh and pre-push-gate.sh. This is the
emergency escape hatch.

9.2 `PROCESS_TIER=hotfix` environment variable overrides branch-based
tier detection, reducing enforcement to minimum.

9.3 All bypasses MUST be logged to the chronicle event log
(`chronicle.sh` — a PostToolUse hook that writes append-only JSONL
events to `~/.claude/sessions/$SESSION_ID/events.jsonl`). Bypass
events are visible in session reviews and compliance metrics.

9.4 Bypass does NOT exempt from audit (§4). Even bypassed commits MUST
have their diffs reviewed. enforce-audit.sh is not affected by
PROCESS_BYPASS.

9.5 Bypass frequency is a compliance metric (see Continuous Improvement
section). Target: less than 5% of commits use bypass.

# Implementation Notes

- `process-state.json` is session-scoped, located at
  `~/.claude/sessions/$SESSION_ID/process-state.json`. It is not
  persisted across sessions.
- All hooks source `hooks/lib/hook-lock.sh` for atomic state file
  updates via `_locked_write_json`. Hook libraries are defined in the
  agent-ops repository and symlinked to `~/bin/hooks/lib/` at install
  time.
- All PreToolUse Bash hooks source `hooks/lib/resolve-worktree.sh` for
  consistent CWD resolution across direct git context, cd targets in
  commands, and `-C` flag parsing.
- pre-commit-gate.sh runs AFTER enforce-audit.sh in the PreToolUse
  hook chain. enforce-audit.sh sets the audit breadcrumb;
  pre-commit-gate reads the process state including audit status.
- Hook timeout default is 600 seconds (10 minutes), sufficient for
  pre-push-gate running full test suites.
- For lint status: "warn" (e.g., cspell unknown words) is allowed at
  commit time. Only "fail" (actual errors) blocks. pre-push-gate
  re-runs lint fresh and may be stricter.

# Continuous Improvement and Compliance Metrics

| Metric | Source | Target |
|--------|--------|--------|
| Process bypass frequency | Chronicle event log | < 5% of commits |
| Pre-commit gate block rate | Hook exit code logs | Decreasing trend |
| CI-failure-on-first-push rate | GitHub Actions | < 10% |
| Review rounds per PR | GitHub API | <= 2 |
| Commit cycles per PR | git log | <= 3 |
| Sandbox usage rate | Sentinel logs | > 95% |

These metrics are collected from chronicle.sh event logs and
process-state.json snapshots. Session reviews SHOULD include a
compliance summary referencing these metrics.

## Process Discipline Maturity Model

| Level | Name | Description | Current |
|-------|------|-------------|---------|
| 1 | Ad Hoc | Rules in context window, no hooks | - |
| 2 | Advisory | Sentinel/forge warn on issues (async) | Current state |
| 3 | Gated | Pre-commit blocks without tests/lint | Target (this standard) |
| 4 | Pipeline | Pre-push runs full gate suite locally | Near-term |
| 5 | Adaptive | Process score auto-tightens enforcement | Future |
| 6 | Self-Healing | Analyst auto-generates enforcement rules | Future |

This standard establishes Level 3. Level 4 is achieved when
pre-push-gate.sh is deployed and operational.

# Compliance

Non-compliance with this standard during AI-assisted development
sessions is tracked through:

- Session review retrospectives (per
  [session_review_standard](session_review_standard.md) STD-061)
- Bypass frequency metrics (§9.5)
- CI failure patterns attributable to skipped local verification

Persistent non-compliance (same violation in 3+ consecutive sessions)
triggers review of enforcement hook configuration and may warrant
escalation to stricter enforcement levels.

# Changelog

| Version | Date | Changes |
|---------|------|---------|
| 1.0.9 | 2026-03-17 | Round 9: replace "a hotfix" with "an urgent fix" in §2.6 to avoid overloading the Hotfix tier name. |
| 1.0.8 | 2026-03-17 | Round 8: clarify §2.6 applies to feature/bugfix tier TDD deviations only (§2.5 exempts config/docs and hotfix). |
| 1.0.7 | 2026-03-17 | Comprehensive consistency pass: fix tier table column (Hotfix N/A), expand §5.5 with per-tier gate enforcement table for both pre-commit and pre-push, move runner type from process-state schema to chronicle events (§3.5). |
| 1.0.6 | 2026-03-17 | Round 6 review: remove hotfix/* branch prefix from tier table (use PROCESS_TIER=hotfix only), clarify Step 12 Hotfix has no gate, rewrite §5.4 for env-var-only activation. |
| 1.0.5 | 2026-03-17 | Round 5 review: align last_updated with changelog date, add footnote to hotfix tier table row referencing §5.4 STD-031 reconciliation. |
| 1.0.4 | 2026-03-17 | Round 4 review: reconcile §3.3 in-host gate behavior with STD-008/STD-030 degraded mode, sanitize branch name in §4.3 audit breadcrumb path. |
| 1.0.3 | 2026-03-16 | Round 3 review: tier-scope Step 12 exit criteria, reconcile hotfix pre-push (push without gate), add hook source note at §8, scope pre-push-gate enforcement to tier. Scope STD-005 §7.5 and STD-008 §5.4/§7.4 tier qualifiers. |
| 1.0.2 | 2026-03-16 | Round 2 review: fix §4.1 step reference (6+7 not 7), add §5.5 tier-aware gate behavior, update §8 pre-commit-gate to include typecheck, align STD-030 pre-push with gate matrix scoping. |
| 1.0.1 | 2026-03-16 | Address review: clarify hook library paths (agent-ops repo), add chronicle.sh description, add §5.4 hotfix/STD-031 reconciliation note. |
| 1.0.0 | 2026-03-16 | Initial release. Defines 12-step process, TDD requirements, sandbox-mandatory testing, audit requirements, strictness tiers, process-state.json schema, defense in depth layers, hook classification, and bypass policy. |
