---
id: STD-061
title: Session Review and Retrospective Standard
version: 0.2.0
category: workflow
status: draft
owner: sh4i-yurei
reviewer: sh4i-yurei
approver: sh4i-yurei
last_updated: 2026-02-15
review_date: 2026-05-14
extends: [STD-000, STD-004, STD-032]
tags: [session, review, retrospective, ai, process-improvement]
---

# Purpose

Define a structured retrospective practice for AI-assisted development
sessions. Session handoffs
([SDLC_With_AI](SDLC_With_AI.md), [session_handoff_tpl](../06_Projects/Templates/ai/session_handoff_tpl.md))
preserve continuity between sessions but do not capture what was
learned. This standard ensures that mistakes, process improvements, and
team coordination insights are recorded and acted upon.

# Scope

Applies to all AI-assisted work sessions governed by
[SDLC_With_AI](SDLC_With_AI.md) (STD-032).

Excludes:

- Session handoff artifacts (covered by TPL-PRJ-HANDOFF)
- Incident postmortems (covered by the incident postmortem template)
- Design postmortems (covered by the design postmortem template)

# Standard

## When to produce a session review

- Agents MUST produce a session review at the end of every Tier 2+ work
  session.
- Agents SHOULD produce a session review for Tier 1 sessions that
  reveal process issues or coordination failures.
- Multi-instance sessions (two or more concurrent AI agents) MUST
  include a coordination assessment in the review.

## Storage and naming

Session reviews are stored outside project repositories so they persist
across repos and provide a unified view of agent performance.

```text
~/session-reviews/
├── <project>/
│   ├── YYYY-MM-DD_<project>_s<N>_review.md
│   └── ...
└── <other-project>/
    └── ...
```

- Root folder: `~/session-reviews/`
- One subfolder per project, matching the project's short name
- File naming: `YYYY-MM-DD_<project>_s<N>_review.md`
  - Date first for chronological sort
  - Project name for identification and search
  - Session number (`s<N>`) cross-references PLANS.md

## Required content

Every session review MUST contain the sections defined in
[session_review_tpl](../06_Projects/Templates/ai/session_review_tpl.md)
(TPL-PRJ-SESSION-REVIEW):

1. **Session metadata** — date, project, session number, instances
   used, approximate duration
2. **Accomplishments** — issues resolved, PRs merged, milestones
   reached
3. **Failures** — what happened, severity (high/medium/low), root
   cause, corrective action
4. **Self-rating** — scored table (1-10) covering at minimum:
   orchestration, code quality, communication, rule adherence
5. **Lessons learned** — actionable takeaways, not vague observations
6. **Action items** — checklist with owners where applicable

## Review interview process

The session review MUST be conducted as a conversational interview:

1. The agent initiates the review by presenting a self-evaluation
   covering accomplishments, failures, and a candid self-rating.
2. The user provides feedback, corrections, and additional observations.
3. The agent incorporates user feedback into the final review document.

The review captures both perspectives. The agent MUST NOT produce a
review without user input unless the user explicitly declines the
interview.

## Action item tracking

- Action items from the review MUST be referenced in the next session's
  handoff artifact or in the project's PLANS.md.
- Unresolved action items carry forward to subsequent reviews until
  closed.
- If an action item results in a process change, it SHOULD be captured
  as an update to the relevant standard or to the agent's MEMORY.md.

## Daily report for multi-instance sessions

Multi-instance sessions with three or more concurrent AI instances MUST
produce a daily report that synthesizes individual instance reviews into
a consolidated view.

- The daily report follows
  [daily_report_tpl](../06_Projects/Templates/ai/daily_report_tpl.md)
  (TPL-PRJ-DAILY-REPORT).
- Storage: `~/session-reviews/<project>/YYYY-MM-DD_<project>_daily_report.md`
- The daily report is produced after all instances have completed their
  individual reviews.
- Content MUST include: per-instance summaries, aggregate metrics,
  friction points with root cause analysis, coordination assessment,
  and consolidated action items.
- Sessions with two instances SHOULD produce a daily report if
  significant coordination issues occurred.

## Multi-instance coordination assessment

When a session uses two or more concurrent AI instances, the review MUST
additionally assess:

- Branch ownership discipline (were branches respected?)
- File overlap prevention (were conflicts avoided?)
- Communication effectiveness (were handoffs clear?)
- Orchestration quality (was work distributed efficiently?)

# Implementation Notes

- The session review complements but does not replace the session
  handoff artifact. Handoffs cover what to do next; reviews cover what
  was learned.
- Keep reviews concise. Link to PRs, issues, and design docs rather
  than duplicating content.
- Self-ratings should be honest. Inflated ratings defeat the purpose of
  the retrospective. Rate relative to the session's complexity and the
  agent's own standards.
- The `~/session-reviews/` folder is not a git repository. Reviews are
  local artifacts for the user and agent to reference across sessions.

# Continuous Improvement and Compliance Metrics

- Track whether action items from previous reviews are addressed in
  subsequent sessions.
- Monitor self-rating trends across sessions to identify persistent
  weaknesses.
- Review frequency: at minimum, verify that every Tier 2+ session
  produces a review artifact.

# Compliance

A Tier 2+ session completed without a review artifact is non-compliant
with this standard. Agents resuming work SHOULD check for a review from
the previous session and reference any open action items.

# Changelog

- 0.2.0 — Added daily report requirement for multi-instance sessions
  (3+ instances). References TPL-PRJ-DAILY-REPORT.
- 0.1.0 — Initial draft. Based on Session 7 prototype review.
