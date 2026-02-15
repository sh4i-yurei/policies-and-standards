---
id: TPL-PRJ-DAILY-REPORT
title: Daily report template
version: 0.1.0
category: template
status: active
approver: sh4i-yurei
reviewer: sh4i-yurei
owner: sh4i-yurei
last_updated: 2026-02-15
extends: [STD-061]
tags: [template, ai, session, reporting, multi-instance]
---

# Daily Report: {project} — {date}

## Header

| Field | Value |
|-------|-------|
| Project | {project name} |
| Date | {YYYY-MM-DD} |
| Session | {session number} |
| Instances | {count of instances that ran} |
| Report author | {who compiled this report} |

## Work Summary

Narrative summary of the day's work across all instances.
Highlight major accomplishments, blockers, and cross-instance
coordination.

## Per-Instance Summary

Summarize each instance's contributions. Pull from individual
session review files (`{date}_{project}_s{N}_i{M}_review.md`).

### Instance {N}: {branch or scope}

| Metric | Value |
|--------|-------|
| Branch | {branch name} |
| Issues addressed | {issue refs} |
| PRs opened | {PR refs} |
| Key deliverables | {brief list} |
| Effectiveness | {1-5} |
| Accuracy | {1-5} |
| Autonomy | {1-5} |

**Highlights:** {1-2 sentence summary}

**Friction:** {any blockers or issues}

<!-- Repeat the Instance section for each instance -->

## Aggregate Metrics

| Metric | Today | Previous | Trend |
|--------|-------|----------|-------|
| Issues closed | {N} | {N} | {up/down/flat} |
| PRs opened | {N} | {N} | {up/down/flat} |
| PRs merged | {N} | {N} | {up/down/flat} |
| Avg effectiveness | {1-5} | {1-5} | {up/down/flat} |
| Avg accuracy | {1-5} | {1-5} | {up/down/flat} |
| Avg autonomy | {1-5} | {1-5} | {up/down/flat} |

Trend column compares to the most recent previous daily report.
Use arrows or text indicators consistently.

## Friction Points

List friction points observed across instances, grouped by type.

### Process Friction

- {description} — {which instances affected} — {severity}

### Tooling Friction

- {description} — {which instances affected} — {severity}

### Coordination Friction

- {description} — {which instances affected} — {severity}

## Coordination Assessment

Evaluate how well multi-instance work was coordinated.

- **Branch isolation**: {did instances stay on their branches?}
- **Work overlap**: {any duplicated effort?}
- **Dependency management**: {did blocking dependencies cause delays?}
- **Communication**: {was inter-instance information flow adequate?}

## Recommendations

### Process

- {recommendation}

### Issues to File

- {issue description} — {target repo}

### Standards Updates

- {standard ID} — {proposed change}

### Tooling

- {tool or script improvement}

## Consolidated Action Items

| Action | Owner | Priority | Source |
|--------|-------|----------|--------|
| {action} | {who} | {high/medium/low} | {instance or friction point} |

## Notes

Additional observations, lessons learned, or context for the next
session.
