---
id: TPL-PRJ-WEEKLY-REPORT
title: Weekly report template
version: 0.1.0
category: template
status: active
owner: sh4i-yurei
reviewer: sh4i-yurei
approver: sh4i-yurei
last_updated: 2026-03-11
extends: [STD-001, STD-004, STD-032, STD-061]
tags: [template, ai, session, reporting, weekly, metrics, automated]
---

# Purpose

Provide a structured template for automated weekly roll-up reports that
synthesize session reviews and preprocessed metrics into cross-project
trend analysis, DORA-adapted quality metrics, and threshold-based
alerts. The weekly report is fully automated infrastructure — it runs
unattended on a schedule, determines its own reporting period, and
catches up on missed runs without human intervention.

This is not an aggregated daily report. It is a higher-level strategic
view: velocity, quality trajectory, efficiency, and stability computed
from structured session data across all projects.

# Scope

Generated automatically every Sunday at 22:00 via systemd timer or
cron. Also triggered manually via
`python3 ~/scripts/weekly_report.py [--week YYYY-WNN]`.

Save as
`~/session-reviews/global/weekly/YYYY-WNN_weekly_report.md` with a
JSON sidecar at `YYYY-WNN_weekly_metrics.json` and charts in `charts/`.

Extends
[session_review_standard](../../../05_Dev_Workflows/session_review_standard.md)
(STD-061).

# Standard

## Weekly report template

````md
# Weekly Report: YYYY-WNN

## Header

| Field | Value |
|-------|-------|
| Period | YYYY-MM-DD (Mon) through YYYY-MM-DD (Sun) |
| ISO Week | YYYY-WNN |
| Projects covered | <comma-separated project names> |
| Session count | <total sessions this week> |
| Instance count | <total AI instances across all sessions> |
| Generation mode | auto / manual |
| Generated at | <ISO 8601 timestamp> |

## Executive Summary

Auto-generated narrative summarizing the week's trajectory. Include:
key accomplishments, quality direction (improving/stable/degrading),
notable alerts, and the single most important thing that happened.

## Velocity

| Metric | This week | Previous week | Trend |
|--------|-----------|---------------|-------|
| Sessions | <N> | <N> | <up/down/flat> |
| Accomplishments | <N> | <N> | <up/down/flat> |
| Accomplishments per session | <N.N> | <N.N> | <up/down/flat> |
| Milestones reached | <N> | <N> | <up/down/flat> |

## Quality Trajectory

### Rating trends (trailing 8 weeks)

| Week | Orchestration | Code quality | Communication | Rule adherence | Overall |
|------|---------------|--------------|---------------|----------------|---------|
| <W-7> | <N.N> | <N.N> | <N.N> | <N.N> | <N.N> |
| ... | ... | ... | ... | ... | ... |
| <current> | <N.N> | <N.N> | <N.N> | <N.N> | <N.N> |

![Rating trends](charts/YYYY-WNN_rating_trends.png)

### Failure rate evolution

| Week | Total failures | High severity | Failures per session |
|------|----------------|---------------|----------------------|
| <trailing weeks> | <N> | <N> | <N.N> |

### Recurring failures

Failures appearing in 2+ sessions this week:

- <failure title> — seen in <session list>

## Efficiency

| Metric | This week | Previous week | Trend |
|--------|-----------|---------------|-------|
| Total input tokens | <N> | <N> | <up/down/flat> |
| Total output tokens | <N> | <N> | <up/down/flat> |
| Cache read tokens | <N> | <N> | <up/down/flat> |
| Cache hit ratio | <N.N%> | <N.N%> | <up/down/flat> |
| Avg tool calls per session | <N.N> | <N.N> | <up/down/flat> |
| Error rate | <N.N%> | <N.N%> | <up/down/flat> |

![Token usage](charts/YYYY-WNN_token_usage.png)

### Tool usage distribution

| Tool | Count | Percentage |
|------|-------|------------|
| <tool name> | <N> | <N.N%> |

## Stability

| Metric | This week | Previous week | Trend |
|--------|-----------|---------------|-------|
| Stall events | <N> | <N> | <up/down/flat> |
| Action item age (avg days) | <N.N> | <N.N> | <up/down/flat> |
| Carryover items (> 7 days) | <N> | <N> | <up/down/flat> |

## Cross-Project Comparison

| Project | Sessions | Avg overall | Failures | Trend |
|---------|----------|-------------|----------|-------|
| <project> | <N> | <N.N> | <N> | <up/down/flat> |

![Cross-project comparison](charts/YYYY-WNN_cross_project.png)

## Failure Analysis

### Severity breakdown

| Severity | Count |
|----------|-------|
| High | <N> |
| Medium | <N> |
| Low | <N> |

### Failure clusters (TF-IDF)

Top failure patterns by keyword clustering:

1. **<cluster label>** — <N> failures
2. **<cluster label>** — <N> failures
3. **<cluster label>** — <N> failures

![Failure distribution](charts/YYYY-WNN_failure_distribution.png)

## Instinct Effectiveness

| Instinct | Created | Trigger | Targeted pattern recurred? |
|----------|---------|---------|---------------------------|
| <filename> | <date> | <trigger summary> | yes/no |

Active instincts: <N>
Patterns still recurring after instinct: <N>

## Alerts

Threshold violations for this week per STD-061:

| Metric | Value | Threshold | Status |
|--------|-------|-----------|--------|
| avg_overall | <N.N> | GREEN >= 7.0, YELLOW >= 5.0 | <GREEN/YELLOW/RED> |
| high_severity_failures | <N> | GREEN = 0, YELLOW <= 2 | <GREEN/YELLOW/RED> |
| closure_rate | <N.N%> | GREEN >= 70%, YELLOW >= 40% | <GREEN/YELLOW/RED> |
| failure_rate | <N.N> | GREEN <= 0.5, YELLOW <= 1.0 | <GREEN/YELLOW/RED> |
| error_rate | <N.N%> | GREEN <= 5%, YELLOW <= 15% | <GREEN/YELLOW/RED> |

## Action Item Velocity

| Metric | This week | Previous week | Trend |
|--------|-----------|---------------|-------|
| Total items | <N> | <N> | <up/down/flat> |
| Opened | <N> | <N> | <up/down/flat> |
| Closed | <N> | <N> | <up/down/flat> |
| Closure rate | <N.N%> | <N.N%> | <up/down/flat> |
| Carryover (> 7 days) | <N> | <N> | <up/down/flat> |

### Aging distribution

| Age | Count |
|-----|-------|
| < 3 days | <N> |
| 3-7 days | <N> |
| 7-14 days | <N> |
| > 14 days | <N> |

## Notes

Additional context, anomalies, or observations from the automated
analysis. Include any data gaps (missing reviews, missing preprocessed
files) that may affect metric accuracy.
````

# Implementation Notes

- The weekly report is generated by `~/scripts/weekly_report.py` — a
  standalone Python script that imports from `review_parser.py`.
- The script is fully automated and requires no human interaction. It
  determines its own reporting period by scanning for missing completed
  ISO weeks.
- Work week boundary is strict: Monday 00:00 through Sunday 23:59.
  Reports never include data from incomplete weeks.
- If the scheduled run is missed (machine off, cron failure), the
  script generates separate reports for each missed week on next run.
  Reports are never consolidated across weeks.
- Charts are generated as PNGs using `matplotlib` (Agg backend) and
  saved to a `charts/` subdirectory alongside the report.
- A JSON sidecar (`YYYY-WNN_weekly_metrics.json`) is emitted alongside
  each report for machine-readable trend data. Trend charts read from
  these sidecars rather than re-parsing markdown.
- Notion sync pushes weekly data to a dedicated Weekly Reports database
  (separate from Sessions DB) after each report is generated.
- The report is idempotent — existing reports are not overwritten.

# Continuous Improvement and Compliance Metrics

- Track alert threshold violations across weeks to identify persistent
  quality issues.
- Monitor closure rate trends to detect action item backlog growth.
- Compare instinct creation dates against failure recurrence to measure
  instinct effectiveness over time.
- Flag any week with zero sessions (no work performed).

# Compliance

Weekly reports are generated automatically. A missing weekly report
indicates a scheduling failure (timer/cron issue) rather than a process
violation. The script's backlog recovery logic ensures reports are
generated retroactively when the scheduler recovers.

# Changelog

- 0.1.0 — Initial draft. Automated weekly report with DORA-adapted
  metrics, cross-project comparison, failure clustering, instinct
  effectiveness tracking, and threshold-based alerts.
