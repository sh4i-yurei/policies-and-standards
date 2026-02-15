---
id: TPL-PRJ-SPRINT-PLAN
title: Multi-Instance Sprint Plan
version: 1.0.1
category: template
status: active
owner: sh4i-yurei
reviewer: sh4i-yurei
approver: sh4i-yurei
last_updated: 2026-02-15
extends: [STD-001, STD-062]
tags: [template, ai, sprint, multi-agent, orchestration, planning]
---

# Purpose

Provide a structured sprint plan template for multi-instance AI agent
sessions per [STD-062](../../05_Dev_Workflows/Multi_Agent_Orchestration.md).
The sprint plan is the single source of truth for instance assignments,
branch ownership, and merge order.

# Scope

Use when planning a sprint with three or more concurrent AI agent
instances (STD-062 section "Sprint planning"). For two-instance
sessions, a sprint plan section in the session handoff is sufficient.

# Standard

## Sprint plan template

<!-- Remove instruction comments before use -->

```md
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
```

# Implementation Notes

- The `/sprint-plan` slash command (a user-level agent command, not
  shipped in this repository) generates this format automatically.
- The template can also be filled in manually for ad-hoc sprints.
- Store completed sprint plans in the project's `plans/` directory or
  as a section in the session handoff.

# Continuous Improvement and Compliance Metrics

- Track sprint plan completeness (all required elements present before
  instance launch).
- Track file-overlap prediction accuracy (planned vs actual conflicts).
- Review these metrics in the session review per
  [STD-061](../../05_Dev_Workflows/session_review_standard.md).

# Compliance

Sprint plans are verified as part of the multi-instance coordination
assessment in [STD-061](../../05_Dev_Workflows/session_review_standard.md).

# Changelog

| Version | Date | Description |
|---------|------|-------------|
| 1.0.1 | 2026-02-15 | Add missing Continuous Improvement and Compliance Metrics section per STD-001. |
| 1.0.0 | 2026-02-15 | Initial release. |
