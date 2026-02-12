---
id: TPL-PRJ-DESIGN-POSTMORTEM
title: Design postmortem template
version: 0.1.0
category: project
status: draft
owner: sh4i-yurei
reviewer: sh4i-yurei
approver: sh4i-yurei
last_updated: 2026-02-11
extends: [STD-001, STD-032]
tags: [template, design, postmortem, retrospective]
---
# Purpose

Provide a structured format for evaluating design decisions after
release, comparing assumptions against operational reality.

# Scope

Use after Tier 3 releases and Tier 2 releases when material design
decisions were made. This is a design retrospective, not an incident
postmortem (see [incident_postmortem_tpl](incident_postmortem_tpl.md) for incidents).

# Standard

## Summary

- Project: <name>
- Change tier: <Tier 2|Tier 3>
- Design artifacts: <links to system design, module design>
- Specification: <link>
- Release: <link to release notes or PR>
- Post-mortem date: <YYYY-MM-DD>
- Author: <name>

## Design assumptions vs. reality

| Assumption | Expected outcome | Actual outcome | Delta |
| --- | --- | --- | --- |
| <assumption> | <expected> | <actual> | <delta or N/A> |

## SLI/SLO performance

| Metric | Target | Measured | Status |
| --- | --- | --- | --- |
| <SLI/SLO> | <target> | <actual> | <met|missed|N/A> |

## Success metrics assessment

| Metric | Target | Measured | Status |
| --- | --- | --- | --- |
| <metric> | <target> | <actual> | <met|missed|N/A> |

## ADR updates required

List ADRs that need revision based on production learnings.

| ADR | Change needed | Status |
| --- | --- | --- |
| <ADR link> | <description> | <open|updated> |

## Lessons learned

- What worked well: <text>
- What did not work: <text>
- What to change for next design cycle: <text>

## Follow-up actions

| Action | Owner | Due date | Status |
| --- | --- | --- | --- |
| <action> | <owner> | <YYYY-MM-DD> | <open|in progress|done> |

## Evidence and artifacts

- Design artifacts: <links>
- Specifications: <links>
- ADRs: <links>
- Monitoring dashboards: <links>
- Release record: <link>

# Implementation Notes

- Complete within one working session after release stabilizes.
- Record outcomes in the governing issue per [SDLC_With_AI](../../../05_Dev_Workflows/SDLC_With_AI.md).
- Use an ADR when design changes are required for future work.

# Continuous Improvement and Compliance Metrics

Track post-mortem completion rate and design rework driven by findings.

# Compliance

Tier 3 releases without a completed design postmortem are non-compliant.

# Changelog

- 0.1.0 - Initial draft.
