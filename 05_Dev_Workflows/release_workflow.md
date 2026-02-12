---
id: STD-035
title: Release workflow
version: 1.0.4
category: workflow
status: draft
approver: sh4i-yurei
reviewer: sh4i-yurei
owner: sh4i-yurei
last_updated: 2026-01-13
extends: [STD-006, STD-010]
tags: [release, workflow, governance]
---

# Purpose

Define the operational release workflow that applies the release policy
and CI/CD requirements in practice.

# Scope

Applies to all releases in governed repositories.

# Standard

## 1. Preconditions and required artifacts

- Approved spec or design artifacts (Tier 2 and Tier 3).
- CI green for required gates (see [CI_CD_Pipeline_Model](CI_CD_Pipeline_Model.md)).
- Release checklist completed using
  [release_checklist_tpl](../06_Projects/Templates/release/release_checklist_tpl.md).
- Release notes drafted using
  [release-notes_tpl](../06_Projects/Templates/release/release-notes_tpl.md).
- Operational readiness review completed for Tier 2 and Tier 3 using
  [operational-readiness-review-checklist](operational-readiness-review-checklist.md).
- If the release remediates a vulnerability, follow
  [vulnerability-management-workflow](vulnerability-management-workflow.md) and link evidence.
- Rollback strategy documented and validated where feasible.
- Operational notes and runbooks updated for new behavior.
- Monitoring and alerting dashboards linked for verification.

## 2. Release classification

2.1 Classify the release type (patch, minor, major) per
[Release_Management_Policy](../01_Governance/Release_Management_Policy.md).  
2.2 Classify release risk (low, medium, high) and document mitigation
steps.  
2.3 Major or high-risk releases MUST include a staged rollout plan.

## 3. Workflow steps

1. Plan the release objective, scope, and success criteria.
2. Prepare artifacts: version bump, changelog, release notes, and tags.
3. Verify traceability links (issues, specs, and Quint records).
4. Run required validation gates (CI, tests, security, config).
5. Record explicit approval and evidence of readiness.
6. Promote through defined environments using repeatable procedures.
7. Verify post-release signals and rollback readiness.
8. Record outcomes and open follow-up issues as needed.

## 4. Rollback and recovery

4.1 Rollback triggers MUST be defined before promotion to production.  
4.2 Rollback procedures MUST be documented and executable.  
4.3 Post-rollback validation MUST confirm system recovery and data
integrity.

## 5. Communication

5.1 Release status MUST be communicated to stakeholders for Tier 2 and
Tier 3 changes.  
5.2 For customer-impacting releases, provide a summary of changes,
expected impact, and rollback plans.  
5.3 Communication artifacts MUST be linked from release notes where
applicable.

## Definition of done

- Release approved and recorded.
- Release artifacts published and traceable.
- Rollback plan documented and validated.
- Post-release verification completed and recorded.
- Success criteria evaluated or time-boxed for review.

## Links

- [Release_Management_Policy](../01_Governance/Release_Management_Policy.md)
- [CI_CD_Pipeline_Model](CI_CD_Pipeline_Model.md)
- [SDLC_With_AI](SDLC_With_AI.md)
- [operational-readiness-review-checklist](operational-readiness-review-checklist.md)
- [vulnerability-management-workflow](vulnerability-management-workflow.md)

# Implementation Notes

- Use semantic versioning unless superseded by governance.
- Record approvals and evidence in release notes.
- In solo practice, approvals may be time-shifted but MUST be explicit.
- Promotion steps MUST be repeatable; automation MAY be used where approved.
- Release artifacts MUST link to validation evidence and Quint records.

# Continuous Improvement and Compliance Metrics

- Track release lead time, rollback frequency, and post-release defects.
- Use findings to refine the release checklist.

# Compliance

Releases that bypass required checks or approvals are non-compliant.

# Changelog
- 1.0.4 - Set owner/reviewer/approver values.

- 1.0.3 - Replaced workflow path with KB link.
- 1.0.2 - Replaced template paths with KB links.
- 1.0.1 - Marked draft pending readiness and vulnerability workflow maturity.
- 1.0.0 - Activated after review and readiness alignment.
- 0.3.1 - Linked operational readiness and vulnerability workflows.
- 0.3.0 - Expanded preconditions, rollout, and communication steps.
- 0.2.1 - Added objectives, monitoring window, and repeatable promotion.
- 0.2.0 - Expanded release steps and checklist.
- 0.1.0 - Initial draft.
