---
id: TPL-PRJ-HANDOFF
title: Session handoff template
version: 0.1.0
category: template
status: active
owner: sh4i-yurei
reviewer: sh4i-yurei
approver: sh4i-yurei
last_updated: 2026-02-14
extends: [STD-001, STD-004, STD-032]
tags: [template, ai, handoff, session, continuity]
---
# Purpose

Provide a structured session handoff artifact so that AI agents resuming
multi-session work can restore context quickly and accurately.

# Scope

Use at the end of any Tier 2+ AI-assisted work session. Save as
`plans/handoffs/<YYYY-MM-DD>_handoff.md`.

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
  before beginning work.
- Keep handoff artifacts concise; link to ExecPlans and design docs
  rather than duplicating content.

# Continuous Improvement and Compliance Metrics

- Track session ramp-up time to measure handoff effectiveness.

# Compliance

Multi-session work resumed without reading an available handoff artifact
is non-compliant per
[SDLC_With_AI](../../../05_Dev_Workflows/SDLC_With_AI.md).

# Changelog

- 0.1.0 - Initial draft.
