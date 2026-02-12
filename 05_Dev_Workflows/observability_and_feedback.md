---
id: STD-037
title: Observability and Feedback Workflow
version: 0.2.7
category: workflow
status: active
approver: sh4i-yurei
reviewer: sh4i-yurei
owner: sh4i-yurei
last_updated: 2026-02-12
extends: [STD-007, STD-008, STD-020, STD-043]
tags: [observability, feedback, workflow, operations]
---
# Purpose

Define how observability signals are collected, reviewed, and fed back
into design and implementation to prevent drift and regressions.

# Scope

Applies to all systems under governance, covering logging, metrics,
tracing, alerting, and feedback loops into SDLC workflows.

# Standard

## Workflow steps

1. Define critical user journeys and service objectives using
   [SLI_SLO_Standard](../03_Engineering_Standards/SLI_SLO_Standard.md).
2. Identify required signals in the System Design and Module Design.
3. Instrument logging, metrics, and tracing for each critical path using
   the approved telemetry tooling in [Tooling_Inventory](../03_Engineering_Standards/Tooling_Inventory.md).
4. Centralize logs, metrics, and traces in the approved observability
   platform (see [Tooling_Inventory](../03_Engineering_Standards/Tooling_Inventory.md)).
5. Create dashboards and alerts tied to SLOs with runbook links.
6. Validate signals in staging and during release checks (dashboards
   load, traces exist for key flows, alerts can fire in a controlled
   test).
7. Monitor a post-release window and capture feedback as issues or
   incidents per [incident_response](incident_response.md).
8. For Tier 3 (and Tier 2 when material), run a design post-mortem to
   compare success metrics against design assumptions and update ADRs or
   specs as needed. Record outcomes in the governing issue; use an ADR
   when design changes are required.
9. Feed findings back into design, specs, and backlog grooming.

## Signal requirements

- Logging MUST be structured (JSON), include trace and span IDs, and
  avoid secrets or sensitive data per
  [Security_and_Threat_Modeling_Standard](../03_Engineering_Standards/Security_and_Threat_Modeling_Standard.md).
- Metrics MUST include the four golden signals (latency, traffic,
  errors, saturation) for critical paths and map to defined SLIs.
- Tracing MUST be available for distributed flows with sampling rules
  documented.
- Alert thresholds SHOULD be tied to SLOs and error-budget burn rates
  where feasible, not raw infrastructure metrics alone.
- Alert thresholds MUST have owners, severity, and runbook links.
- Signal labels MUST avoid high-cardinality blowups; avoid per-user or
  per-request labels and prefer stable dimensions (service, version,
  region).
- Sampling and retention policies MUST be documented to control cost and
  data volume.

## Required artifacts

- SLI/SLO definitions and owners.
- Dashboards and alert definitions with runbook links, discoverable from
  the service README or runbook.
- Operational notes and runbooks for critical alerts.
- Evidence of validation in staging or release notes (screenshots,
  checklist entries, or synthetic test links).

## Definition of Done

- Observability requirements are captured in design artifacts.
- Critical paths are instrumented and verified.
- Alerts and runbooks are linked and validated.
- On-call ownership and escalation paths are documented for P1 and P2
  alerts.
- Feedback issues are created for gaps or regressions.

# Implementation Notes

- Document tooling choices (e.g., OpenTelemetry, dashboards, alerting
  platform) and naming conventions.
- Use runbooks in [runbooks_tpl](../06_Projects/Templates/operations/runbooks_tpl.md) and operational notes in
  [operational_notes_tpl](../06_Projects/Templates/operations/operational_notes_tpl.md).
- Align post-release monitoring windows with
  [release_workflow](release_workflow.md) and [SDLC_With_AI](SDLC_With_AI.md).
- Coordinate incident follow-ups through [incident_response](incident_response.md).

# Continuous Improvement and Compliance Metrics

Track SLO compliance, alert quality, signal-to-noise ratio, MTTR, and
incident findings; use them to refine instrumentation and thresholds.
Review observability metrics at least quarterly and adjust thresholds
and instrumentation as needed.

# Compliance

Services without defined observability and feedback loops are
non-compliant and must be addressed before release.

# Changelog

- 0.2.7 - Clarified design post-mortem recording location.
- 0.2.6 - Linked tooling inventory location.
- 0.2.5 - Updated links for renamed engineering standards.
- 0.2.4 - Set owner/reviewer/approver values.

- 0.2.3 — Replaced template paths with KB links.
- 0.2.2 — Added design post-mortem step.
- 0.2.1 — Added incident response linkage.
- 0.2.0 — Expanded workflow steps, signal requirements, and artifacts.
- 0.1.0 — Initial draft.
