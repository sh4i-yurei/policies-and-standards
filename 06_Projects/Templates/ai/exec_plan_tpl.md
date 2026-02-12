---
id: TPL-PRJ-EXEC-PLAN
title: ExecPlan template
version: 0.1.3
category: project
status: active
owner: sh4i-yurei
reviewer: sh4i-yurei
approver: sh4i-yurei
last_updated: 2026-02-12
extends: [STD-001, STD-004, STD-032]
tags: [template, ai, execplan, planning]
---
# Purpose

Provide a structured ExecPlan template for complex AI-assisted work.

# Scope

Use when a task meets the ExecPlan criteria in `PLANS.md`. Save as
`plans/exec_plans/<YYYY-MM-DD>_<short_slug>.md`.

# Standard

## ExecPlan template

```md
# <Short, action-oriented description>

This ExecPlan is a living document. Keep Progress, Surprises &
Discoveries, Decision Log, and Outcomes & Retrospective up to date.

## Purpose / Big Picture

Explain the user-visible outcome and how to see it working.

## Progress

- [ ] (YYYY-MM-DD HH:MM TZ) <completed or remaining step>

## Surprises & Discoveries

- Observation: <what changed your approach>
  Evidence: <short snippet or test output>

## Decision Log

- Decision: <what was decided>
  Rationale: <why>
  Date/Author: <YYYY-MM-DD / name>

## Outcomes & Retrospective

Summarize what was achieved, gaps, and lessons learned.

## Context and Orientation

Describe the current state and name key files by repo-relative path.

## Plan of Work

Describe, in prose, the sequence of edits and additions. Name files and
locations explicitly.

## Concrete Steps

List exact commands and expected outcomes.

## Validation and Acceptance

Describe how to verify behavior. Include test commands and expected
results.

## Idempotence and Recovery

Explain how steps can be safely repeated or rolled back.

## Artifacts and Notes

Include concise transcripts, diffs, or evidence snippets.

## Interfaces and Dependencies

List libraries, modules, and interfaces that must exist at completion.
```

# Implementation Notes

- Keep the ExecPlan self-contained; cite governing standards and link
  required artifacts, including short excerpts when needed for clarity.
- Update the Progress section after each work session.

# Continuous Improvement and Compliance Metrics

- Track ExecPlan completion quality and rework rates.

# Compliance

ExecPlans that omit required sections are non-compliant.

# Changelog

- 0.1.3 - Set owner/reviewer/approver values.
- 0.1.2 - Added owner/reviewer/approver frontmatter fields.

- 0.1.1 - Defined storage location and clarified citation guidance.
- 0.1.0 - Initial draft.
