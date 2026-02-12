---
id: TPL-PRJ-SKILL-ORIENT
title: Repo orientation skill template
version: 0.1.4
category: project
status: active
owner: sh4i-yurei
reviewer: sh4i-yurei
approver: sh4i-yurei
last_updated: 2026-02-12
extends: [STD-004, STD-058]
tags: [template, ai, skills, orientation]
---
# Purpose

Provide a baseline repo-orientation skill for new projects.

# Scope

Use to create `.claude/skills/repo-orientation/SKILL.md` in governed
repositories.

# Standard

## SKILL.md template

```markdown
---
name: repo-orientation
description: Map repo structure and governing docs; use when starting a new task or repo.
# Optional keys — include only those supported by your target runtime.
# Claude Code: tools, disable-model-invocation, user-invocable, context, agent
# Codex: allowed-tools, metadata
# Both: license
---

# Overview

Provide a read-only orientation to the repository, including required
governance artifacts and ExecPlan requirements.

# Instructions

- Read `AGENTS.md` for repo-specific AI rules and constraints.
- Read `PLANS.md` to determine whether an ExecPlan is required.
- Read `.kb/ai-context.yaml` for KB pointers and required artifacts.
- Locate core project artifacts (README, charter, PRD, designs, specs,
  ADRs, risk register, testing strategy, style guide, release/ops docs).
- Identify primary source, test, docs, config, and script directories.
- Note any repo-local skills in `.claude/skills` and rule packs
  referenced by the KB.
- Output a short orientation summary:
  - ExecPlan required (yes/no + reason).
  - Key docs found (with paths).
  - Repo structure (source/tests/docs/config).
  - Missing artifacts or questions to resolve.

# Resources

- Omit this section if unused.

# Safety / Limits

- Read-only: do not edit files or run commands unless explicitly asked.
- Do not infer missing requirements; ask for clarification.
```

# Implementation Notes

- Keep the skill read-only and focused on discovery.
- Customize the core artifacts list if the project has unique standards.

# Continuous Improvement and Compliance Metrics

- Track orientation gaps that caused rework.

# Compliance

Repo-orientation skills must comply with the Agent Skills Standard
([Codex_Skills_Standard](../../../03_Engineering_Standards/Codex_Skills_Standard.md)).

# Changelog

- 0.1.4 - Normalized paths to Claude Code as primary runtime.
- 0.1.3 - Generalized paths and frontmatter for multi-runtime support (Claude Code + Codex).
- 0.1.2 - Set owner/reviewer/approver values.
- 0.1.1 - Added owner/reviewer/approver frontmatter fields.
- 0.1.0 - Initial draft.
