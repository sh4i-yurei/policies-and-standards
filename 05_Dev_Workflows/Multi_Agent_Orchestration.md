---
id: STD-062
title: Multi-Agent Orchestration and Coordination
version: 1.2.0
category: workflow
status: draft
owner: sh4i-yurei
reviewer: sh4i-yurei
approver: sh4i-yurei
last_updated: 2026-02-15
review_date: 2026-05-15
extends: [STD-032, STD-004]
tags: [multi-agent, orchestration, sprint, parallel, coordination]
---

# Purpose

Define coordination requirements for multi-instance AI agent sprints to
prevent branch collisions, merge conflicts, and wasted effort. This
standard prescribes how concurrent agents coordinate; outcome measurement
is covered by the multi-instance coordination assessment in
[Session Review](session_review_standard.md) (STD-061).

# Scope

Applies when two or more concurrent AI agent instances work on related
changes in the same repository within a single session.

Does NOT apply to:

- Single-instance sessions ([SDLC with AI](SDLC_With_AI.md) STD-032 is
  sufficient)
- Agents working in separate repositories with no shared state
- Human-only pair programming or mob programming

# Standard

## Worktree isolation

Each instance MUST operate in its own git worktree. Before starting
work, check out an existing branch or create a new one:

```bash
# Existing branch
git worktree add /tmp/i<N>-<branch> <branch>

# New branch (creates and checks out in one step)
git worktree add /tmp/i<N>-<branch> -b <branch>
```

Instances MUST NOT share a working directory. Shared directories cause
branch collisions, dirty index conflicts, and accidental cross-instance
staging.

Worktrees SHOULD be cleaned up at session end:

```bash
git worktree remove /tmp/i<N>-<branch>
```

## Sprint planning

Before launching instances, the sprint plan MUST include:

- Session number (e.g., "Session 12 — Sprint Plan")
- Instance count and identifiers (I1, I2, ...)
- Branch assignment per instance
- Deliverable assignment per instance with complexity estimates
- File overlap map identifying which deliverables touch the same files

For sprints with three or more instances, use
[TPL-PRJ-SPRINT-PLAN](../06_Projects/Templates/ai/sprint_plan_tpl.md)
as the plan format. For two-instance sessions, a sprint plan section in
the session handoff is sufficient.

Projects MAY provide a `/sprint-plan` agent command to automate plan
creation (selecting work items, distributing across instances, creating
a tracking epic, and computing the file-overlap map). Supporting scripts
such as `sprint-overlap.sh` are user-level tools maintained outside
this repository.

## Workload balancing

Work SHOULD be distributed by estimated complexity, not issue count.
Each instance SHOULD be capped at two complex deliverables. A schema
definition is heavier than a configuration fix — balance accordingly.

## Branch discipline

- Each instance owns its assigned branches exclusively.
- No instance may checkout, read, write, or stage files on another
  instance's branch.
- Instances MUST chain `git checkout <branch> && <command>` at the start
  of every shell call because shell state does not persist between tool
  calls.
- Instances MUST stage specific files by name. `git add .` and
  `git add -A` are prohibited in multi-instance sessions because they
  risk staging files left by other instances.

## Merge management

After all instance PRs pass CI and review, a designated merge manager
(one instance or the human) handles merges as a planned phase:

1. Map file overlap across all open PRs (`git diff --stat` each branch
   against main).
2. Batch-merge PRs with no file overlap first (parallel-safe).
3. Merge PRs with the highest file overlap last (most likely to
   conflict).
4. Rebase remaining PRs against updated main between each merge.

This is a planned phase budgeted in the sprint plan, not a reactive
response to conflicts. Each merge invalidates remaining PRs, so order
matters.

Projects MAY provide a `/sprint-merge` agent command to automate this
sequence: computing the file-overlap matrix, presenting the recommended
merge order, and walking the human through each merge with rebase checks
between steps.

## Review flow

Multi-instance PRs follow the same review process as single-instance
PRs: automated CI gates, automated reviewer (e.g., Copilot), and human
review. Cross-instance review — where one AI instance reviews another's
PR — SHOULD NOT be added because it creates context-switching overhead
for marginal value over existing review layers.

## Worker completion protocol

Each worker instance MUST complete these steps after finishing all
assigned tasks, without waiting for orchestrator prompting:

1. Run local CI gates on the branch (see
   [CI/CD Pipeline Model](../03_Engineering_Standards/CI_CD_Pipeline_Model.md)
   STD-030).
2. Commit and push the branch.
3. Create a pull request targeting main.
4. Verify CI gates pass on the PR.
5. Notify the orchestrator or human that the PR is ready.

The orchestrator owns merge sequencing (section "Merge management"),
but each instance owns its PR through creation. Worker instances
SHOULD NOT delegate PR creation to the orchestrator.

After pushing fixes for review comments, worker instances MUST resolve
addressed review threads via the GitHub `resolveReviewThread` GraphQL
mutation. Replying to a comment is not sufficient — the thread must be
explicitly resolved.

## Subagent verification

Subagent-generated content that references data models, field names, API
contracts, or schema definitions MUST be verified against source design
documents before committing. Subagent output that invents names not
present in design artifacts MUST be corrected.

# Implementation Notes

- Projects adopt this standard by adding a multi-instance section to
  their AGENTS.md that references STD-062.
- The sprint plan format is intentionally lightweight — a markdown
  section with the required elements is sufficient.
- When only two instances are involved and their deliverables have zero
  file overlap, the merge management phase can be simplified to
  sequential merges in any order.
- Worktree paths under `/tmp/` are ephemeral by design. Agents should
  not store persistent state in worktrees.

# Continuous Improvement and Compliance Metrics

- **Merge conflict count**: target zero file-overlap conflicts per
  multi-instance sprint.
- **Branch collision incidents**: target zero per sprint (an instance
  touching another instance's branch).
- **Sprint plan completeness**: all required elements from section
  "Sprint planning" are present before instances launch.
- Review these metrics via the multi-instance coordination assessment
  defined in [Session Review](session_review_standard.md) (STD-061).

# Compliance

## Verification

- Sprint plan includes all required elements (section "Sprint
  planning").
- Each instance uses its own worktree (section "Worktree isolation").
- No cross-instance branch access visible in git log (section "Branch
  discipline").
- Merge management follows the prescribed sequence (section "Merge
  management").

## Non-compliance

Non-compliance is treated as a process defect:

- The incident is logged in the session review
  ([STD-061](session_review_standard.md)).
- Corrective action is defined and tracked to the next sprint.
- Repeated non-compliance SHOULD trigger a process audit per
  [Governance Process Audit](governance-process-audit-checklist.md)
  (STD-059).

# Changelog

| Version | Date | Description |
|---------|------|-------------|
| 1.2.0 | 2026-02-15 | Add worker completion protocol and review thread resolution requirement. |
| 1.1.0 | 2026-02-15 | Add sprint plan template (TPL-PRJ-SPRINT-PLAN) and optional agent command references. |
| 1.0.0 | 2026-02-15 | Initial release. Promotes multi-instance sprint protocol from project-local AGENTS.md to KB authority. |
