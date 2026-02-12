---
id: TPL-PRJ-PROMPTS
title: Prompt patterns template
version: 0.2.3
category: project
status: active
owner: sh4i-yurei
reviewer: sh4i-yurei
approver: sh4i-yurei
last_updated: 2026-02-12
extends: [STD-001, STD-004, STD-032]
tags: [template, prompts, ai, context]
---
# Purpose

Provide a reusable prompt patterns template for AI-assisted work.

# Scope

Use for projects that maintain standardized prompts or context packs.

# Standard

## Template

### Prompt patterns

Capture reusable prompts and context packs for AI-assisted work. Keep
examples minimal and tested.

#### Global context

Short intro to paste into sessions (mission, standards, key links).

#### Prompt hygiene

- State goal, constraints, and acceptance criteria.
- Link the approved spec and tests.
- Ask for uncertainties instead of inference.
- Convert prompts used more than twice into a
  reusable command and record them in
  [command-catalog_tpl](command-catalog_tpl.md).

#### Modular rules

Reference only the global rules plus the
task-specific rule packs required for the
change. Keep unused rules out of execution
context to preserve reasoning capacity.

#### Commands catalog

List command-style prompts with inputs,
outputs, and expected validation steps. Link
to the project command catalog.

#### Architecture prompts

- <link or paste pattern>
- Inputs required: <design docs, ADRs>
- Expected outputs: <options, trade-offs, risks>

#### Implementation prompts

- <pattern for scoped change>
- Inputs: <spec section, file list, standards>
- Guardrails: no new deps, follow tests, keep diffs small.

#### Refactor prompts

- <pattern>
- Constraints: preserve behavior, add tests, note risks.

#### Testing prompts

- <pattern>
- Inputs: spec behaviors, edge cases, fixtures.

#### Doc-sync prompts

- <pattern>
- Inputs: git diff summary, spec or test updates.

#### Experiments and notes

Record evaluated variants and which performed best.

# Implementation Notes

- Keep prompts aligned with current standards and specs.
- Remove stale or untested variants.

# Continuous Improvement and Compliance Metrics

Track prompt effectiveness and revision frequency.

# Compliance

Prompt libraries without standards alignment are non-compliant.

# Changelog

- 0.2.3 - Set owner/reviewer/approver values.
- 0.2.2 - Added owner/reviewer/approver frontmatter fields.

- 0.2.1 — Replaced template path with KB link.
- 0.2.0 — Added modular rules and command
  catalog guidance.
- 0.1.0 — Initial draft.
