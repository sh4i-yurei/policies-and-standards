---
id: TPL-PRJ-INCIDENT-POSTMORTEM
title: Incident postmortem template
version: 0.1.2
category: project
status: active
owner: sh4i-yurei
reviewer: sh4i-yurei
approver: sh4i-yurei
last_updated: 2026-02-12
extends: [STD-001, STD-036]
tags: [template, incident, postmortem, operations]
---

# Purpose

Provide a consistent incident postmortem format for Sev-1 and Sev-2
events.

# Scope

Use after incidents captured in [incident_response](../../../05_Dev_Workflows/incident_response.md).

# Standard

## Postmortem summary

- Incident ID: <issue or ticket>
- Title: <short name>
- Severity: <Sev-1|Sev-2|Sev-3>
- Status: <draft|approved>
- Start time: <YYYY-MM-DD HH:MM TZ>
- End time: <YYYY-MM-DD HH:MM TZ>
- Duration: <minutes/hours>
- Incident lead: <name>

## Impact assessment

- Impacted services or customers: <text>
- User impact: <text>
- Data impact: <none|suspected|confirmed>
- Business impact: <text>

## Timeline

| Time (TZ) | Event | Notes |
| --- | --- | --- |
| <HH:MM> | <event> | <details> |

## Root cause

Describe the primary cause and where the failure originated.

## Contributing factors

List secondary causes, gaps, or conditions that worsened impact.

## Detection and response

- Detection method: <monitoring|user report|manual>
- Detection gap: <text>
- Response actions: <text>

## Resolution

Describe the fix, verification steps, and recovery confirmation.

## Corrective and preventive actions

| Action | Owner | Due date | Status |
| --- | --- | --- | --- |
| <action> | <owner> | <YYYY-MM-DD> | <open|in progress|done> |

## Follow-up updates

List runbook, spec, or monitoring changes required.

## Communications

Summarize stakeholder updates, external disclosures, or status posts.

## Evidence and artifacts

- Logs/metrics: <links>
- Dashboards: <links>
- PRs/issues: <links>
- Quint records: <links>

# Implementation Notes

- Keep timelines factual and timestamped.
- Capture evidence links before closing the incident issue.

# Continuous Improvement and Compliance Metrics

- Track recurrence rate and time-to-detection improvements.

# Compliance

Sev-1 and Sev-2 incidents require a completed postmortem.

# Changelog

- 0.1.2 - Set owner/reviewer/approver values.
- 0.1.1 - Added owner/reviewer/approver frontmatter fields.

- 0.1.0 - Initial draft.
