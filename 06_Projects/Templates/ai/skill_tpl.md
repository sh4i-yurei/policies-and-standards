---
id: TPL-PRJ-SKILL
title: Agent skill template
version: 0.1.4
category: project
status: draft
owner: sh4i-yurei
reviewer: sh4i-yurei
approver: sh4i-yurei
last_updated: 2026-02-11
extends: [STD-004, STD-058]
tags: [template, ai, skills]
---

# Purpose

Provide a standard SKILL.md template for agent skills across supported
runtimes (Claude Code, Codex).

# Scope

Use when creating a new agent skill in
`.claude/skills/<skill-name>/`.

# Standard

## SKILL.md template

```markdown
---
name: <skill-name>
description: <what it does + when to use it>
# Optional keys — include only those supported by your target runtime.
# See Agent Skills Standard (STD-058) for the full compatibility table.
# Claude Code: tools, disable-model-invocation, user-invocable, context, agent
# Codex: allowed-tools, metadata
# Both: license
---

# Overview

<1-2 sentence summary of the skill's purpose.>

# Instructions

- <Step-by-step instructions in imperative form.>
- <Safety/limits: what the skill must not do.>
- <Reference bundled resources like scripts/, references/, assets/.>

# Resources

- `scripts/<script-name>`: <what it does and when to run it>
- `references/<doc-name>`: <when to read it>
- `assets/<asset-path>`: <when to use it>
```

## Notes

- Keep `description` specific and actionable; it is the trigger.
- Keep the body concise; move details to `references/`.
- Do not add extra files like README or CHANGELOG.
- Omit resource entries (or the entire Resources section) when unused.

# Implementation Notes

- Name the skill folder to match `name`.
- Only create resource folders that the skill needs.

# Continuous Improvement and Compliance Metrics

- Track skill usage and update instructions when friction appears.

# Compliance

Skills must follow the Agent Skills Standard ([Codex_Skills_Standard](../../../03_Engineering_Standards/Codex_Skills_Standard.md)).

# Changelog

- 0.1.4 - Normalized paths to Claude Code as primary runtime.
- 0.1.3 - Generalized from Codex-only to multi-runtime (Claude Code + Codex). Updated frontmatter comments and paths.
- 0.1.2 - Set owner/reviewer/approver values.
- 0.1.1 - Added owner/reviewer/approver frontmatter fields.
- 0.1.0 - Initial draft.
