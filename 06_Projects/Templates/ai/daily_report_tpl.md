---
id: TPL-PRJ-DAILY-REPORT
title: Daily report template
version: 0.1.0
category: template
status: active
owner: sh4i-yurei
reviewer: sh4i-yurei
approver: sh4i-yurei
last_updated: 2026-02-15
extends: [STD-001, STD-004, STD-032, STD-061]
tags: [template, ai, session, reporting, multi-instance]
---

# Purpose

Provide a structured template for aggregating per-instance session
reviews into a daily roll-up report so that cross-instance coordination,
friction points, and trends are captured consistently.

# Scope

Use at the end of any multi-instance AI-assisted work day. Save as
`~/session-reviews/<project>/YYYY-MM-DD_<project>_daily_report.md`.
Extends [session_review_standard](../../../05_Dev_Workflows/session_review_standard.md)
(STD-061).

# Standard

## Daily report template

```md
# Daily Report: <project> — <date>

## Header

| Field | Value |
|-------|-------|
| Project | <project name> |
| Date | <YYYY-MM-DD> |
| Session | <session number> |
| Instances | <count of instances that ran> |
| Report author | <who compiled this report> |

## Work Summary

Narrative summary of the day's work across all instances.
Highlight major accomplishments, blockers, and cross-instance
coordination.

## Per-Instance Summary

Summarize each instance's contributions. Pull from individual
session review files (`<date>_<project>_s<N>_i<M>_review.md`).

### Instance <N>: <branch or scope>

| Metric | Value |
|--------|-------|
| Branch | <branch name> |
| Issues addressed | <issue refs> |
| PRs opened | <PR refs> |
| Key deliverables | <brief list> |
| Effectiveness | <1-5> |
| Accuracy | <1-5> |
| Autonomy | <1-5> |

**Highlights:** <1-2 sentence summary>

**Friction:** <any blockers or issues>

<!-- Repeat the Instance section for each instance -->

## Aggregate Metrics

| Metric | Today | Previous | Trend |
|--------|-------|----------|-------|
| Issues closed | <N> | <N> | <up/down/flat> |
| PRs opened | <N> | <N> | <up/down/flat> |
| PRs merged | <N> | <N> | <up/down/flat> |
| Avg effectiveness | <1-5> | <1-5> | <up/down/flat> |
| Avg accuracy | <1-5> | <1-5> | <up/down/flat> |
| Avg autonomy | <1-5> | <1-5> | <up/down/flat> |

Trend column compares to the most recent previous daily report.
Use arrows or text indicators consistently.

## Friction Points

List friction points observed across instances, grouped by type.

### Process Friction

- <description> — <which instances affected> — <severity>

### Tooling Friction

- <description> — <which instances affected> — <severity>

### Coordination Friction

- <description> — <which instances affected> — <severity>

## Coordination Assessment

Evaluate how well multi-instance work was coordinated.

- **Branch isolation**: <did instances stay on their branches?>
- **Work overlap**: <any duplicated effort?>
- **Dependency management**: <did blocking dependencies cause delays?>
- **Communication**: <was inter-instance information flow adequate?>

## Recommendations

### Process

- <recommendation>

### Issues to File

- <issue description> — <target repo>

### Standards Updates

- <standard ID> — <proposed change>

### Tooling

- <tool or script improvement>

## Consolidated Action Items

| Action | Owner | Priority | Source |
|--------|-------|----------|--------|
| <action> | <who> | <high/medium/low> | <instance or friction point> |

## Notes

Additional observations, lessons learned, or context for the next
session.
```

# Implementation Notes

- The report is compiled from individual instance session reviews, not
  generated independently. Read all instance reviews before writing.
- Keep entries concise. Link to PRs and issues rather than duplicating
  details.
- Trend indicators compare to the most recent previous daily report for
  the same project.
- Action items carry forward to subsequent sessions until resolved.

# Continuous Improvement and Compliance Metrics

- Track action item closure rate across daily reports.
- Monitor coordination assessment trends for persistent friction.

# Compliance

Multi-instance sessions completed without a daily roll-up are
non-compliant when three or more instances operated in the same session.

# Changelog

- 0.1.0 — Initial draft.
