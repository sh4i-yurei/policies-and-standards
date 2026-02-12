---
id: TPL-PRJ-OBS-CHECKLIST
title: Observability checklist template
version: 0.1.3
category: project
status: active
owner: sh4i-yurei
reviewer: sh4i-yurei
approver: sh4i-yurei
last_updated: 2026-02-12
extends: [STD-001, STD-037, STD-043]
tags: [template, observability, checklist, operations]
---
# Purpose

Provide a repeatable observability checklist to validate instrumentation,
alerts, and feedback loops before release.

# Scope

Use for all services and Tier 2 or Tier 3 releases.

# Standard

## Checklist

- SLI and SLO definitions documented with owners and error budgets.
- Critical user journeys identified and mapped to signals.
- Logs are structured (JSON) with trace/span IDs; no sensitive data.
- Metrics include the four golden signals (latency, traffic, errors,
  saturation) and map to SLIs.
- Traces are available for key flows with documented sampling strategy.
- Dashboards exist for SLOs and critical signals.
- Alerts are tied to SLO or error-budget burn where feasible.
- Alert severity, owners, and runbook links are defined.
- Dashboards and alerts are linked from README or runbooks.
- Sampling and retention policies documented.
- Staging validation completed (dashboards load, traces present, alerts
  can be tested).
- Post-release monitoring window defined.
- Feedback issues created for gaps or regressions.
- On-call ownership and escalation paths documented for P1/P2 alerts.

## Evidence and links

- SLI/SLO doc: <link>
- Dashboards: <links>
- Alerts: <links>
- Runbooks: <links>
- Validation evidence: <links or notes>

# Implementation Notes

- Align with [observability_and_feedback](../../../05_Dev_Workflows/observability_and_feedback.md) and [SLI_SLO_Standard](../../../03_Engineering_Standards/SLI_SLO_Standard.md).
- Store completed checklists with release records or readiness reviews.

# Continuous Improvement and Compliance Metrics

- Track checklist completion rate and post-release gaps.

# Compliance

Releases without a completed observability checklist are non-compliant.

# Changelog
- 0.1.3 - Updated links for renamed engineering standards.

- 0.1.2 - Set owner/reviewer/approver values.
- 0.1.1 - Added owner/reviewer/approver frontmatter fields.

- 0.1.0 — Initial draft.
