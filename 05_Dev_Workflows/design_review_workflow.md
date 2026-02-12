---
id: STD-034
title: Design review workflow
version: 0.2.4
category: workflow
status: draft
approver: sh4i-yurei
reviewer: sh4i-yurei
owner: sh4i-yurei
last_updated: 2026-01-13
extends: [STD-020, STD-024]
tags: [design, review, workflow]
---

# Purpose

Define how design reviews are executed and recorded in practice.

# Scope

Applies to system, module, and technical specification artifacts.

# Standard

## Workflow steps

1. Prepare design artifacts and links.
2. Confirm applicable checklist sections.
3. Identify required approvers and stakeholders per the project charter.
4. Run checklist review and AI-assisted completeness checks.
5. Record findings, risks, and decisions.
6. Collect sign-offs or return for revision.

## Required artifacts

- Design document(s)
- Completed [Design_Review_Checklist](../04_Design_Framework/Design_Review_Checklist.md)
- Linked issues or specs
- ADRs for significant architectural decisions (use
  [adr_tpl](../06_Projects/Templates/architecture/adr_tpl.md))
- Architecture options analysis for significant decisions
- Evidence of AI-assisted review for Tier 3
- Design governance and approver list (charter or issue)
- Version/changelog updates for modified design artifacts
- Threat model link when security boundaries change
- SLI/SLO links when reliability targets change
- Progressive delivery plan when runtime rollout controls are required

## Definition of Done

- Review recorded with pass/fail status.
- Required artifacts linked.
- Approval or revision decision documented with sign-offs when required.
- Tier 3 red-team review recorded.

## Links

- [Design_Review_Checklist](../04_Design_Framework/Design_Review_Checklist.md)
- [Design_First_Development_Model](../04_Design_Framework/Design_First_Development_Model.md)
- [SDLC_With_AI](SDLC_With_AI.md)

# Implementation Notes

- In solo practice, use AI-assisted review and document outcomes.
- Record any exceptions or unresolved risks.
- Record checklist results inline or in a separate review note.

# Continuous Improvement and Compliance Metrics

- Track review findings, rework frequency, and rejection rate.
- Use findings to refine design standards.

# Compliance

Designs without a recorded review are non-compliant.

# Changelog
- 0.2.4 - Set owner/reviewer/approver values.

- 0.2.3 - Replaced template path with KB link.
- 0.2.2 - Promoted to review status.
- 0.2.1 - Added approver identification, AI completeness checks, and
  governance/version artifacts.
- 0.2.0 - Expanded workflow steps and Tier 3 review requirements.
- 0.1.0 - Initial draft.
