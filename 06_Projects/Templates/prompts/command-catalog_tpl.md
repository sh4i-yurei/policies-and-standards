---
id: TPL-PRJ-COMMAND-CATALOG
title: Command catalog template
version: 0.1.2
category: project
status: active
owner: sh4i-yurei
reviewer: sh4i-yurei
approver: sh4i-yurei
last_updated: 2026-02-12
extends: [STD-001, STD-004, STD-032]
tags: [template, commands, prompts, ai]
---
# Purpose

Provide a standard catalog for reusable AI commands and workflows.

# Scope

Use for any project that defines repeatable AI prompts or workflows.

# Standard

## Template

### Command catalog

Record commands that are used more than twice. Each command should be
small, scoped, and validated.

#### Command entry

- Name: <short name>
- Trigger phrase: <command or alias>
- Purpose: <one sentence>
- When to use: <scenario>
- Inputs required: <docs, files, links>
- Constraints: <rules, guardrails, scope>
- Output expectations: <deliverables>
- Validation steps: <tests, checks, review>
- Owner: <name>
- Last reviewed: <YYYY-MM-DD>

# Implementation Notes

- Keep commands aligned with the rules index in [rules-index](../../../03_Engineering_Standards/AI_Rules/rules-index.md).
- Link command usage to issues or specs when used in delivery workflows.

# Continuous Improvement and Compliance Metrics

Track command reuse, defect rates after command usage, and update
frequency.

# Compliance

Projects using AI commands without a catalog are non-compliant.

# Changelog

- 0.1.2 - Set owner/reviewer/approver values.
- 0.1.1 - Added owner/reviewer/approver frontmatter fields.

- 0.1.0 — Initial draft.
