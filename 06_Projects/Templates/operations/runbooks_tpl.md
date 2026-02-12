---
id: TPL-PRJ-RUNBOOK
title: Runbook template
version: 0.1.2
category: project
status: draft
owner: sh4i-yurei
reviewer: sh4i-yurei
approver: sh4i-yurei
last_updated: 2026-01-13
extends: [STD-006, STD-036, STD-037]
tags: [template, runbook, incident, operations]
---

# Purpose

Provide a deterministic sequence to diagnose and resolve a specific
incident type.

# Scope

Use one runbook per incident scenario.

# Standard

## Runbook template

Keep each runbook focused on one scenario.

## Scenario

- Trigger/symptoms: <what alerts or signals fire>
- Impact: <customer/system impact>
- Related alerts/runbooks: <alert names/IDs, linked runbooks or incident
  templates>

## Owners and contacts

- Primary: <name/contact>
- Backup: <name/contact>
- Escalation criteria and path: <e.g., if unresolved after 15 minutes or
  after step N, escalate to <role/contact>>

## Preconditions

What must be true before running these steps (access, tools, data)?

## Steps

Each step SHOULD include purpose, exact command/UI action, expected
result, and what to do if the result differs. Clearly label stateful vs.
read-only steps.

1. <diagnostic or mitigation - expected result; if not, go to step X or
   escalate>
2. <step>
3. <step>

## Validation

How to confirm the incident is resolved and the system is healthy.

## Rollback and recovery

Safe rollback steps if mitigation fails; data integrity considerations.

## Post-incident actions

- Record findings and timeline.
- Record in incident system: <where/how>.
- Open follow-up issues.
- Update runbook or docs if gaps were found.

## Validation and currency

- Last exercised/tested: <date> (simulation or real incident).

# Implementation Notes

- Validate runbooks quarterly or after major incidents.

# Continuous Improvement and Compliance Metrics

- Track mean time to mitigate and runbook drift.

# Compliance

Incidents without a runbook are non-compliant.

# Changelog

- 0.1.2 - Set owner/reviewer/approver values.
- 0.1.1 - Added owner/reviewer/approver frontmatter fields.

- 0.1.0 - Initial draft.
