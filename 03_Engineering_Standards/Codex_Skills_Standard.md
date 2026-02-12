---
id: STD-058
title: Agent Skills Standard
version: 0.2.0
category: engineering
status: active
approver: sh4i-yurei
reviewer: sh4i-yurei
owner: sh4i-yurei
last_updated: 2026-02-12
extends: [STD-004, STD-056]
tags: [ai, skills, tooling, claude-code, codex]
---

# Purpose

Define how agent skills are authored, stored, and governed so they
remain discoverable, safe, and reusable across supported AI CLI tools.

# Scope

Applies to all agent skills used in governed repositories and shared
skill libraries. Currently supports Claude Code and Codex CLI runtimes.

# Standard

## 1. Skill definition

1.1 A skill is a folder containing a required `SKILL.md` and optional
`/scripts`, `/references`, and `/assets` resources.

1.2 The skill folder name MUST match the `name` field in `SKILL.md`.

## 2. Storage and precedence

Skills are stored under runtime-specific directories. Both runtimes
use the same `SKILL.md` format and folder structure.

### 2.1 Claude Code precedence (descending)

- `$REPO_ROOT/.claude/skills`
- `~/.claude/skills`
- installed plugins (`~/.claude/plugins/`)

### 2.2 Codex CLI precedence (descending)

- `$CWD/.codex/skills`
- `$REPO_ROOT/.codex/skills`
- `$CODEX_HOME/skills` (default `~/.codex/skills`)
- `/etc/codex/skills`
- bundled system skills

### 2.3 General rules

Higher-precedence skills override lower-precedence skills with the
same name. Duplicate names SHOULD be avoided unless an intentional
override is documented in the skill.

Repository-specific skills SHOULD live in
`$REPO_ROOT/.claude/skills` (Claude Code) or
`$REPO_ROOT/.codex/skills` (Codex). Shared skills SHOULD live in
the user-level directory for the active runtime.

When maintaining skills for both runtimes, skill content SHOULD be
identical. Symlinks or a build step MAY be used to avoid duplication.

## 3. SKILL.md format

3.1 `SKILL.md` MUST use YAML frontmatter that includes `name` and
`description`.

3.2 `description` MUST include clear trigger conditions ("use when")
since only name and description are loaded by default (progressive
disclosure).

3.3 The body MUST be concise, imperative, and limited to instructions
and resource pointers. "When to use" guidance MUST NOT be placed in the
body.

3.4 The body SHOULD remain under 500 lines as a performance guideline;
move large material to `/references`.

### 3.5 Optional frontmatter fields

The following fields are supported by one or both runtimes:

| Field | Claude Code | Codex | Purpose |
|-------|-------------|-------|---------|
| `name` | required | required | Skill identifier (kebab-case) |
| `description` | required | required | Trigger conditions and summary |
| `tools` | supported | — | Comma-separated tool whitelist |
| `allowed-tools` | — | supported | Tool whitelist (Codex format) |
| `disable-model-invocation` | supported | — | User-only invocation (for side effects) |
| `user-invocable` | supported | — | Set `false` for background knowledge |
| `context` | supported | — | Set `fork` for isolated subagent execution |
| `agent` | supported | — | Agent type for forked execution |
| `metadata` | — | supported | Freeform object |
| `license` | supported | supported | License identifier |

When authoring dual-runtime skills, include only the fields supported
by both (`name`, `description`, `license`). Runtime-specific fields MAY
be added when the skill targets a single runtime.

## 4. Bundled resources

4.1 `/scripts` contains executable helpers for deterministic tasks.
Scripts MUST be tested after changes.

4.2 `/references` contains documentation loaded on demand. Reference
files MUST be linked from `SKILL.md` and kept one level deep.

4.3 `/assets` contains templates or files used in outputs.

4.4 Internal skills SHOULD NOT include extraneous docs (for example,
README or CHANGELOG). Third-party skills MAY include additional docs;
retain them only when required by upstream.

## 5. Governance and safety

5.1 Skills MUST comply with repo-level AGENTS.md and KB standards per
[KB_Integration_Standard](KB_Integration_Standard.md).
Skills MUST NOT instruct bypassing approvals or privileged access
controls.

5.2 When a skill is used in a governed repo, changes to the skill MUST
follow the applicable change management workflow per
[Issue_and_Change_Management_Policy](../01_Governance/Issue_and_Change_Management_Policy.md).

## 6. Template use

6.1 New skills MUST start from [skill_tpl](../06_Projects/Templates/ai/skill_tpl.md).

# Implementation Notes

- Keep skills small and task-specific.
- Use resource folders to minimize context load.
- When supporting both runtimes, keep a single source of truth for
  skill content and mirror to the other runtime directory.

# Continuous Improvement and Compliance Metrics

- Track skill reuse, failure rates, and time saved.
- Track overrides or conflicts from duplicate skill names.

# Compliance

Skills that omit required frontmatter, violate naming rules, or bypass
governance controls are non-compliant.

# Changelog

- 0.2.0 - Generalized from Codex-only to multi-runtime (Claude Code + Codex). Added Claude Code storage paths, precedence, and frontmatter fields. Renamed title from "Codex Skills Standard" to "Agent Skills Standard".
- 0.1.2 - Added traceability links for KB integration and change control.
- 0.1.1 - Set owner/reviewer/approver values.
- 0.1.0 - Initial draft.
