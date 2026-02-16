---
id: TPL-PRJ-HANDOFF
title: Session handoff template
version: 0.2.0
category: template
status: active
owner: sh4i-yurei
reviewer: sh4i-yurei
approver: sh4i-yurei
last_updated: 2026-02-15
extends: [STD-001, STD-004, STD-032]
tags: [template, ai, handoff, session, continuity]
---
# Purpose

Provide a structured session handoff artifact so that AI agents resuming
multi-session work can restore context quickly and accurately.

# Scope

Use at the end of any Tier 2+ AI-assisted work session.

## Storage and naming

Session handoffs are stored outside project repositories to avoid PR
overhead for routine session-tracking files.

```text
~/session-handoffs/
├── <project>/
│   ├── YYYY-MM-DD_<project>_s<N>_handoff.md
│   └── ...
└── global/
    └── YYYY-MM-DD_global_s<N>_handoff.md
```

- Root folder: `~/session-handoffs/`
- One subfolder per project, matching the project's short name
- File naming: `YYYY-MM-DD_<project>_s<N>_handoff.md`
  - Date first for chronological sort
  - Project name for identification and search
  - Session number (`s<N>`) cross-references PLANS.md

### Multi-instance sessions

When a session uses multiple concurrent AI instances, each instance
produces its own handoff:

`YYYY-MM-DD_<project>_s<N>_i<M>_handoff.md`

The orchestrator (I1) produces the primary handoff summarizing the full
session. Worker instances (I2, I3, ...) produce per-instance handoffs
with their specific context.

### Cross-project sessions

When a session spans balanced work across multiple repos, use the
`global/` subfolder:

`~/session-handoffs/global/YYYY-MM-DD_global_s<N>_handoff.md`

If one project dominates, use that project's subfolder and note the
cross-project scope in the handoff content.

# Standard

## Session handoff template

```md
# Session Handoff — <YYYY-MM-DD>

## Session Summary

- <What was accomplished this session (bullets)>

## Current State

- Milestone: <current milestone>
- Phase: <current SDLC phase>
- Branch: <branch name>
- Working tree: <clean | dirty — list uncommitted files if dirty>

## Next Tasks

- <Specific, actionable task 1>
- <Specific, actionable task 2>

## Open Questions

- <Deferred decisions or unresolved issues>

## Key Files to Read First

1. <Ordered list of files the next session should read for ramp-up>

## Active Issues

- #<number> — <short description> (priority: <high|medium|low>)
```

# Implementation Notes

- Produce a handoff artifact at the end of each working session for
  Tier 2+ work.
- At session start, check for and read the most recent handoff artifact
  before beginning work. Search in this order:
  1. `~/session-handoffs/<project>/` for project-specific handoffs
  2. `~/session-handoffs/global/` for cross-project handoffs
- Keep handoff artifacts concise; link to ExecPlans and design docs
  rather than duplicating content.
- PLANS.md stays in the project repository and is updated in the next
  PR — never as a standalone session-close commit.

# Continuous Improvement and Compliance Metrics

- Track session ramp-up time to measure handoff effectiveness.

# Compliance

Multi-session work resumed without reading an available handoff artifact
is non-compliant per
[SDLC_With_AI](../../../05_Dev_Workflows/SDLC_With_AI.md).

# Changelog

- 0.2.0 — Storage moved from `plans/handoffs/` to
  `~/session-handoffs/<project>/`. Added naming convention, multi-instance
  routing, and cross-project routing rules.
- 0.1.0 — Initial draft.
