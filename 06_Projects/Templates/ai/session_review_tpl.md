---
id: TPL-PRJ-SESSION-REVIEW
title: Session review template
version: 0.1.0
category: template
status: active
owner: sh4i-yurei
reviewer: sh4i-yurei
approver: sh4i-yurei
last_updated: 2026-02-14
extends: [STD-001, STD-004, STD-032, STD-061]
tags: [template, ai, session, review, retrospective]
---

# Purpose

Provide a structured template for end-of-session retrospective reviews
so that lessons learned, mistakes, and process improvements are captured
consistently across projects and sessions.

# Scope

Use at the end of any Tier 2+ AI-assisted work session per
[session_review_standard](../../../05_Dev_Workflows/session_review_standard.md)
(STD-061). Save as
`~/session-reviews/<project>/YYYY-MM-DD_<project>_s<N>_review.md`.

# Standard

## Session review template

```md
# Session <N> Review — <project>

| Field | Value |
|-------|-------|
| Date | <YYYY-MM-DD> |
| Project | <project name> |
| Session | <N> |
| Instances | <count and roles, e.g., "3 (I1 orchestrator, I2 specs, I3 tests)"> |
| Duration | <approximate duration> |

## Accomplishments

### Issues resolved

- #<number> — <short description> (<instance>, <PR reference>)

### Milestones

- <milestone or phase transition reached>

## Failures

### <N>. <failure title> (severity: <high|medium|low>)

**What happened**: <factual description>

**Impact**: <consequences>

**Root cause**: <why it happened>

**Fix**: <corrective action taken or planned>

## Self-rating

| Area | Score | Notes |
|------|-------|-------|
| Orchestration and planning | <1-10> | <brief justification> |
| Code and config quality | <1-10> | <brief justification> |
| Communication | <1-10> | <brief justification> |
| Rule adherence | <1-10> | <brief justification> |
| Overall session | <1-10> | <brief justification> |

## Lessons learned

1. <Actionable takeaway>
2. <Actionable takeaway>

## Action items

- [ ] <action item with owner if applicable>
- [ ] <action item with owner if applicable>
```

## Multi-instance coordination addendum

For sessions using two or more concurrent AI instances, append the
following section after "Action items":

```md
## Coordination assessment

| Area | Rating | Notes |
|------|--------|-------|
| Branch discipline | <good/fair/poor> | <details> |
| File overlap prevention | <good/fair/poor> | <details> |
| Communication | <good/fair/poor> | <details> |
| Work distribution | <good/fair/poor> | <details> |
```

# Implementation Notes

- The review is produced through a conversational interview between the
  agent and user, not generated silently.
- Keep entries concise. Link to PRs and issues rather than duplicating
  details.
- Self-ratings should be honest and calibrated to session complexity.
- Action items carry forward to subsequent sessions until resolved.

# Continuous Improvement and Compliance Metrics

- Track action item closure rate across sessions.
- Monitor self-rating trends for persistent patterns.

# Compliance

Tier 2+ sessions completed without a review artifact are non-compliant
per [session_review_standard](../../../05_Dev_Workflows/session_review_standard.md)
(STD-061).

# Changelog

- 0.1.0 — Initial draft. Structure based on Session 7 prototype.
