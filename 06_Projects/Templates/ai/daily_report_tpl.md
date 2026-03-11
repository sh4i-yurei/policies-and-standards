---
id: TPL-PRJ-DAILY-REPORT
title: Daily report template
version: 0.2.1
category: template
status: active
owner: sh4i-yurei
reviewer: sh4i-yurei
approver: sh4i-yurei
last_updated: 2026-03-10
extends: [STD-001, STD-004, STD-032, STD-061]
tags: [template, ai, session, reporting, multi-instance, operations]
---

# Purpose

Provide a structured template for end-of-day operational roll-up
reports that synthesize per-session reviews, conduct a cross-session
operational interview, and capture strategic direction. The daily
report serves two functions beyond simple aggregation: (1) detecting
cross-session patterns that individual reviews miss, and (2) aligning
on priorities and system health with the user.

# Scope

Use at the end of any AI-assisted work day — single-instance or
multi-instance. Save as
`~/session-reviews/<project>/daily/YYYY-MM-DD_daily_report.md`.
For global sessions:
`~/session-reviews/global/daily/YYYY-MM-DD_daily_report.md`.
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
| Sessions | <session IDs covered, e.g., "Global S14, Global S15"> |
| Session count | <number of sessions covered in this report> |
| Instance count | <total number of AI instances across all sessions> |
| Instance notes | <optional: per-session breakdown, e.g., "S14 single-instance, S15 3-instance"> |
| Report author | <who compiled this report> |

## Work Summary

Narrative summary of the day's work across all sessions. Highlight
major accomplishments, blockers, and cross-session coordination.
Include the overall trajectory — what capability or milestone was
advanced today?

## Per-Session Summary

Summarize each session's contributions. Pull from individual session
review files (`<date>_<project>_s<N>_review.md` or
`<date>_<project>_s<N>_i<M>_review.md` for multi-instance).
For multi-instance sessions, break down per instance within the
session section to satisfy STD-061's per-instance summary requirement.

### <Session ID>: <branch or scope>

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

<!-- Repeat the section above for each session/instance -->

## Per-Session Ratings

Map session review self-ratings (1-10 scale) into a comparison table.
One row per session review artifact — for multi-instance sessions,
include one row per instance review (e.g., S14-I1, S14-I2).
This enables cross-session trend detection at a glance.

| Session | Orchestration and planning | Code and config quality | Communication | Rule adherence | Overall session |
|---------|---------------------------|--------------------------|---------------|----------------|--------------------|
| <session or instance ID> | <1-10> | <1-10> | <1-10> | <1-10> | <1-10> |
| <session or instance ID> | <1-10> | <1-10> | <1-10> | <1-10> | <1-10> |
| **Average** | **<avg>** | **<avg>** | **<avg>** | **<avg>** | **<avg>** |

Trend vs previous daily report averages: <up/down/flat per area>.
Flag any area where the trend is "down" across 2+ daily reports.

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
Use arrows or text indicators consistently. Note any scale
differences between reports (e.g., 1-10 vs 1-5).

## Friction Points

List friction points observed across sessions, grouped by type.

### Process Friction

- <description> — <which sessions affected> — <severity>

### Tooling Friction

- <description> — <which sessions affected> — <severity>

### Coordination Friction

- <description> — <which sessions affected> — <severity>

## Coordination Assessment

Evaluate how well multi-instance/multi-session work was coordinated.
For single-instance sessions, assess cross-session continuity instead.

- **Branch isolation**: <did sessions/instances stay on their branches?>
- **Work overlap**: <any duplicated effort across sessions?>
- **Dependency management**: <did blocking dependencies cause delays?>
- **Communication**: <was information flow between sessions adequate?>
- **Cross-session continuity**: <did handoffs preserve context?>

## Operational Analysis — What Worked

Cross-session view of effective patterns. Focus on:
- Infrastructure or process improvements that paid off today
- Decisions that proved correct
- Behaviors or tools that reduced friction
- Capabilities that matured or reached production readiness

## Operational Analysis — What Needs Improvement

Cross-session view of systemic issues. Focus on:
- Recurring behavioral patterns (not one-off mistakes)
- Gaps in tooling, hooks, or process
- Action items or interventions that haven't produced results
- Structural problems vs behavioral problems

## Recommendations

### Process

- <recommendation>

### Issues to File

- <issue description> — <target repo>

### Standards Updates

- <standard ID> — <proposed change>

### Tooling

- <tool or script improvement, integration to explore>

## Daily Interview Insights

Capture the user's cross-session feedback from the operational
interview. This section records the actual conversation — what the
user observed, patterns they identified, strategic direction they
set, and decisions they made. Structure as:

- **User assessment**: overall read on the day
- **Patterns identified**: recurring issues, behavioral trends
- **Strategic direction**: priorities for next sessions, tool
  decisions, process changes
- **Vision**: longer-term goals or integration plans discussed
- **Agent self-assessment**: what the agent identified as working
  well, needing improvement, and recommended actions

This section is the primary differentiator between the daily report
and a simple aggregation of session reviews. The interview surfaces
insights that no individual session review captures.

## Consolidated Action Items

| Action | Owner | Priority | Source |
|--------|-------|----------|--------|
| <action> | <who> | <high/medium/low> | <session, daily interview, or carry-forward> |

If `tasks.jsonl` is in use, cross-reference with
`bash ~/bin/tasks.sh list` to ensure no items are missed.
`tasks.jsonl` and `tasks.sh` are external session tooling not
governed by this repo; skip this step if the tasks workflow is not
in use. Items from the daily interview that don't appear in session
reviews should be added here and, if the tasks workflow is active,
synced to tasks.jsonl after writing.

### Closed Today

| Action | Source | Resolution |
|--------|--------|------------|
| <action> | <original source> | <how it was resolved> |

Track closure rate across daily reports for trend analysis.

## Notes

Additional observations, lessons learned, or context for the next
session. Include any decisions or priority changes from the daily
interview that affect future work.
```

# Implementation Notes

- The report requires an **operational interview** with the user
  before writing. The interview focuses on cross-session patterns
  and system health, not individual session details (those are
  already captured in session-close reviews). If the user explicitly
  declines or is unavailable, proceed with the report and record
  "Interview declined" in the Daily Interview Insights section
  (the daily report is still required for 3+ instance sessions per
  STD-061, regardless of whether the interview is conducted).
- Read all session reviews for today before starting the interview.
  If the `tasks.jsonl` workflow is active, also pull from it. Present
  a cross-session analysis to the user, then capture their feedback.
- Keep entries concise. Link to PRs and issues rather than duplicating
  details.
- Trend indicators compare to the most recent previous daily report
  for the same project.
- Action items carry forward to subsequent sessions until resolved.
  If the `tasks.jsonl` workflow is active, sync new items after
  writing the report.
- Update the most recent handoff if the interview produces priority
  changes or new strategic direction.
- The daily report is valuable for single-session days too — the
  operational interview and trend tracking provide value beyond
  multi-instance aggregation.

# Continuous Improvement and Compliance Metrics

- Track action item closure rate across daily reports.
- Monitor per-session ratings trends for persistent patterns.
- Monitor coordination assessment trends for persistent friction.
- Flag any quality area trending "down" across 2+ consecutive daily
  reports.

# Compliance

Work days with two or more sessions should produce a daily roll-up.
Multi-instance sessions (three or more instances in the same session)
MUST produce a daily roll-up per STD-061.

# Changelog

- 0.2.1 — Allow proceeding without interview when user declines
  (STD-061 compliance). Record "Interview declined" in insights section.
- 0.2.0 — Major revision. Added operational interview requirement,
  per-session ratings table, operational analysis sections (what
  worked / what needs improvement), daily interview insights section,
  closed-today table, tasks.jsonl integration, work-day boundary
  support. Updated scope to include single-instance days. Updated
  compliance to recommend (not require) for 2+ session days.
- 0.1.0 — Initial draft.
