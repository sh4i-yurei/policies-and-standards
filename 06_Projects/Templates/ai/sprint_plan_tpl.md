---
template_id: TPL-PRJ-SPRINT-PLAN
title: Multi-Instance Sprint Plan
version: 1.0.0
standard_ref: STD-062
category: ai
tags: [sprint, multi-agent, orchestration, planning]
---

<!-- Remove this block before use -->
<!-- INSTRUCTIONS:
  This template is used by the orchestrator instance (I1) when planning
  a multi-instance sprint per STD-062. Fill in all sections. The sprint
  plan is the single source of truth for instance assignments, branch
  ownership, and merge order. All instances reference this plan.

  The /sprint-plan slash command generates this format automatically.
  You can also fill it in manually for ad-hoc sprints.
-->

# Session {N} Sprint Plan

## Overview

| Field | Value |
|-------|-------|
| Session | {N} |
| Date | {YYYY-MM-DD} |
| Instances | {count} |
| Scope | {what this sprint targets} |
| Beads Epic | {epic-id} |

## Instance Assignments

<!-- One row per instance. The orchestrator is always I1. -->

| Instance | Branch | Deliverables | Complexity | Key Files |
|----------|--------|-------------|------------|-----------|
| I1 (orchestrator) | {branch} | {deliverable list} | {Heavy/Medium/Light} | {primary files/dirs} |
| I2 | {branch} | {deliverable list} | {Heavy/Medium/Light} | {primary files/dirs} |
| I3 | {branch} | {deliverable list} | {Heavy/Medium/Light} | {primary files/dirs} |

## File Overlap Map

<!-- Output from sprint-overlap.sh or manual estimation.
     Shows which files/directories are touched by multiple instances. -->

| File/Directory | I1 | I2 | I3 |
|----------------|----|----|-----|
| {path} | X | | X |

## Merge Order

<!-- Ascending by overlap score. Low overlap merges first. -->

1. {branch} — {reason: no overlap / N overlapping files / highest overlap}

## Dependencies

<!-- Cross-instance dependencies from beads. If I3's task depends on
     I2's output, list it here so I3 knows to wait. -->

- {beads-id} (I3) depends on {beads-id} (I2): {reason}

## Instance Launch Instructions

For each worker instance (I2, I3, ...), the human should:

1. Open a new Claude Code terminal in the project directory
2. Tell the instance: "You are Instance {M} for Session {N}.
   Run /session-start"
3. The instance will auto-detect its sprint assignments from beads
   and set up its worktree

## Approval

- [ ] Human approves sprint plan
- [ ] All branches created or will be created by instances
- [ ] File overlap risk assessed
