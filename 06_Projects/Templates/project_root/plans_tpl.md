---
id: TPL-PRJ-PLANS
title: PLANS.md template
version: 0.2.0
category: project
status: active
owner: sh4i-yurei
reviewer: sh4i-yurei
approver: sh4i-yurei
last_updated: 2026-02-25
extends: [STD-001, STD-004, STD-032]
tags: [template, ai, plans, execplan, milestones]
---
# Purpose

Provide a repo-local PLANS.md file that defines how ExecPlans are
written and maintained for complex AI-assisted work.

# Scope

Use in all governed repositories. Save as `PLANS.md` at the repo root.

# Standard

## PLANS.md template

PLANS.md defines the rules for ExecPlans used in this repository.
ExecPlans are living execution plans for complex tasks and MUST follow
`[exec_plan_tpl](../ai/exec_plan_tpl.md)`.

### When an ExecPlan is required

- Tier 3 work (always).
- Tier 2 work that is cross-module, multi-day, high-risk, or has
  unresolved requirements or unclear technical approach after initial
  scoping.
- Any change introducing new dependencies, data contracts, or critical
  workflows.

### ExecPlan requirements

- ExecPlans MUST be self-contained; a new contributor can implement the
  task using only the ExecPlan and the repo, with links and excerpts for
  required standards and artifacts.
- ExecPlans MUST define the user-visible outcome and how to verify it.
- ExecPlans MUST include and maintain the required sections in
  `[exec_plan_tpl](../ai/exec_plan_tpl.md)`.
- Progress, Surprises & Discoveries, Decision Log, and Outcomes &
  Retrospective MUST be updated as work proceeds.

### Default milestone structure

Use POC → MVP → Polish as the default progression unless the project
warrants a different structure:

- **POC** — Prove the approach works. Minimal scope, throwaway code
  acceptable. Exit when the core hypothesis is validated.
- **MVP** — Deliver a usable, tested implementation of core features.
  Production-quality code, CI passing, docs current.
- **Polish** — Harden edge cases, optimize performance, add secondary
  features, complete documentation.

#### Milestone sections

Each milestone SHOULD include these subsections:

```md
### Milestone: <name>

**Objective**: <one sentence>

#### Deliverables

- <concrete output 1>
- <concrete output 2>

#### Gotchas

Known failure modes, risks, and watch-outs for this milestone:

- <expected difficulty or risk>
- <dependency that could slip>
- <technical assumption to validate early>

#### Exit criteria

Testable conditions that MUST be true before the milestone is complete.
Use WHEN/THEN format:

- WHEN: <condition or action>
  THEN: <observable, verifiable result>
- WHEN: <condition or action>
  THEN: <observable, verifiable result>
```

### Review and optimization

- Review the ExecPlan at each milestone and before handoffs.
- Update PLANS.md if recurring issues or gaps appear in ExecPlans.

### Usage note

Create one ExecPlan file per complex task and keep it up to date
throughout implementation. Store ExecPlans under
`plans/exec_plans/<YYYY-MM-DD>_<short_slug>.md`.

## Deferred items

Track work that is intentionally postponed with explicit activation
triggers. Items without trigger conditions are documentation debt —
they will never activate.

| Item | Trigger Condition | Owner | Created |
|------|-------------------|-------|---------|
| <deferred work item> | <specific, testable condition that activates this item> | <owner> | <YYYY-MM-DD> |

Review deferred items at each milestone boundary. When a trigger
condition is met, convert the item to an issue or ExecPlan task.

# Implementation Notes

- Keep PLANS.md concise; put execution detail in ExecPlans.
- Reference `PLANS.md` from AGENTS.md so agents know when to use it.

# Continuous Improvement and Compliance Metrics

- Track ExecPlan usage and missed-plan incidents in reviews.

# Compliance

Complex tasks executed without an ExecPlan are non-compliant.

# Changelog

- 0.2.0 - Added default milestone structure (POC/MVP/Polish), gotchas and
  exit criteria per milestone, WHEN/THEN format, and deferred items table.
- 0.1.4 - Replaced subjective "ambiguous" criterion with objective scoping language.
- 0.1.3 - Set owner/reviewer/approver values.
- 0.1.2 - Added owner/reviewer/approver frontmatter fields.
- 0.1.1 - Clarified self-contained expectations and storage location.
- 0.1.0 - Initial draft.
