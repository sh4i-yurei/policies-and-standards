---
id: STD-045
title: Operational readiness review checklist
version: 0.1.3
category: workflow
status: active
approver: sh4i-yurei
reviewer: sh4i-yurei
owner: sh4i-yurei
last_updated: 2026-02-12
extends: [STD-006, STD-030, STD-035, STD-037, STD-043]
tags: [operations, readiness, checklist, release]
---
# Purpose

Provide a pre-production readiness checklist to confirm a system is
operationally safe to release.

# Scope

Applies to all Tier 2 and Tier 3 releases before production promotion.

# Standard

## Readiness checklist

- Service ownership and on-call contacts documented.
- SLI and SLO definitions recorded and reviewed per [SLI_SLO_Standard](../03_Engineering_Standards/SLI_SLO_Standard.md).
- Alerts mapped to SLO thresholds with [runbooks_tpl](../06_Projects/Templates/operations/runbooks_tpl.md) links.
- Operational notes updated per [operational_notes_tpl](../06_Projects/Templates/operations/operational_notes_tpl.md).
- Logging, metrics, and tracing instrumentation validated in staging.
- Deployment and rollback steps documented and tested.
- Data backup and recovery plans documented with RPO/RTO.
- Security review completed and outstanding risks accepted.
- Capacity and scaling assumptions reviewed.
- CI gates and release checklist complete.

## Definition of done

- Checklist completed and recorded in release notes or an issue.
- Any gaps tracked with follow-up issues and owners.

# Implementation Notes

- Use [runbooks_tpl](../06_Projects/Templates/operations/runbooks_tpl.md) and [operational_notes_tpl](../06_Projects/Templates/operations/operational_notes_tpl.md) to capture details.
- Store checklist evidence with the release record or Quint artifacts.

# Continuous Improvement and Compliance Metrics

- Track readiness review findings and release regressions.
- Review checklist completion rate per release.

# Compliance

Releases without a completed readiness review are non-compliant.

# Changelog
- 0.1.3 - Linked readiness checklist references to SLOs and ops docs.
- 0.1.2 - Set owner/reviewer/approver values.

- 0.1.1 - Promoted to review status.
- 0.1.0 — Initial draft.
