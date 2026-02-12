---
id: STD-043
title: Service level objectives and indicators standard
version: 0.2.3
category: engineering
status: active
approver: sh4i-yurei
reviewer: sh4i-yurei
owner: sh4i-yurei
last_updated: 2026-02-12
extends: [STD-000, STD-008, STD-037]
tags: [sli, slo, reliability, observability, standards]
---
# Purpose

Define mandatory requirements for service level indicators (SLIs) and
service level objectives (SLOs) so reliability expectations are explicit
and enforced across design, implementation, and operations.

# Scope

Applies to all governed systems and services that expose user-facing or
internal reliability commitments.

# Standard

## 1. Coverage requirements

1.1 Each system MUST define at least one SLI and one SLO per critical
user-facing or operational path.  
1.2 Critical paths MUST be listed in the System Design per
[System_Design_Standard](../04_Design_Framework/System_Design_Standard.md) and aligned to the defined SLIs and SLOs.  
1.3 Batch, offline, or asynchronous workflows MUST define SLIs and SLOs
for timeliness and completeness.

## 2. SLI specification requirements

2.1 Each SLI MUST include name, description, unit, numerator,
denominator, data source, aggregation window, and sampling cadence.  
2.2 SLIs MUST be based on observable signals (metrics, logs, traces)
produced by the system and validated by the
[observability_and_feedback](../05_Dev_Workflows/observability_and_feedback.md) workflow.  
2.3 SLI data quality checks MUST be documented, including known gaps or
collection limitations.

## 3. SLO and error budget requirements

3.1 Each SLO MUST include target threshold, compliance window, and
error budget definition.  
3.2 Error budgets MUST be expressed as a numeric allowance and tied to
the SLO window.  
3.3 When error budget burn exceeds thresholds defined in operational
notes in [operational_notes_tpl](../06_Projects/Templates/operations/operational_notes_tpl.md), feature releases for production or
Tier 3 work MUST pause unless explicitly approved.  
3.4 At the midpoint of the compliance window, alerts MUST fire at
50 percent error budget burn.  
3.5 Release pauses MUST trigger when burn rate exceeds 2x over 24 hours
or exceeds 1x over 7 days.

## 4. Ownership and review

4.1 SLO ownership MUST be assigned to a named role or maintainer.  
4.2 SLOs MUST be reviewed at least quarterly or after any Sev-1 or
Sev-2 incident.  
4.3 Reviews MUST document actions taken, including recalibration or
instrumentation changes.

## 5. Alerting and operational linkage

5.1 Alert thresholds MUST map to SLOs and reference [runbooks_tpl](../06_Projects/Templates/operations/runbooks_tpl.md).  
5.2 Dashboards MUST display SLO compliance and error budget burn rate.  
5.3 Alert routing MUST align with on-call ownership defined in
[operational_notes_tpl](../06_Projects/Templates/operations/operational_notes_tpl.md).

## 6. Documentation requirements

6.1 SLOs MUST be referenced in System Design artifacts per
[System_Design_Standard](../04_Design_Framework/System_Design_Standard.md) and in [operational_notes_tpl](../06_Projects/Templates/operations/operational_notes_tpl.md) or
[runbooks_tpl](../06_Projects/Templates/operations/runbooks_tpl.md).  
6.2 Changes to SLOs MUST be recorded in
[Technical_Specification_Standard](../04_Design_Framework/Technical_Specification_Standard.md) or [adr_tpl](../06_Projects/Templates/architecture/adr_tpl.md) when they affect
architecture or reliability commitments.

## 7. Exceptions

7.1 Exceptions require documented rationale and approval in the change
management workflow per [Issue_and_Change_Management_Policy](../01_Governance/Issue_and_Change_Management_Policy.md) and MUST
be recorded in [operational_notes_tpl](../06_Projects/Templates/operations/operational_notes_tpl.md) or [adr_tpl](../06_Projects/Templates/architecture/adr_tpl.md).  
7.2 Exceptions MUST include a time-bound remediation plan.

# Implementation Notes

- Use [observability_and_feedback](../05_Dev_Workflows/observability_and_feedback.md) and
  [observability_checklist_tpl](../06_Projects/Templates/operations/observability_checklist_tpl.md) to define instrumentation and
  dashboards.  
- Capture SLI and SLO definitions in [operational_notes_tpl](../06_Projects/Templates/operations/operational_notes_tpl.md) or a
  dedicated reliability appendix.

# Continuous Improvement and Compliance Metrics

- Track SLO compliance and error budget burn rate trends.
- Record how often SLO definitions are updated and why.

# Compliance

Systems without defined SLIs and SLOs are non-compliant and may not
release to production.

# Changelog
- 0.2.3 - Added traceability links and exception record locations.
- 0.2.2 - Set owner/reviewer/approver values.

- 0.2.1 - Added balanced error budget thresholds and pause rules.
- 0.2.0 - Expanded SLI/SLO requirements, ownership, and alerting rules.
- 0.1.0 - Initial draft.
