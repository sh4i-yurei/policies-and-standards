---
id: STD-002
title: Standards Governance Policy
version: 1.1.3
category: governance
status: active
owner: sh4i-yurei
reviewer: sh4i-yurei
approver: sh4i-yurei
last_updated: 2026-02-12
review_date: 2026-05-01
extends: [STD-000]
tags: [governance, standards, lifecycle, approval, compliance]
---
# Purpose

This policy defines the governance framework for the creation, review, approval, versioning, and retirement of all standards maintained within the repository. It ensures that standards evolve through a controlled, auditable lifecycle and remain internally consistent, authoritative, and aligned with the mission and governance principles of the practice.

This document is the **authoritative control mechanism** for how standards themselves are managed.

# Scope

This policy applies to all standards, policies, and governance documents governed under [Documentation_Standard](../02_Documentation_Standards/Documentation_Standard.md). It defines mandatory roles, lifecycle states, versioning rules, and compliance expectations for any document designated as a standard.

Project-specific artifacts and implementation outputs are explicitly out of scope.

# Standard

## 1. Roles and Authority

1.1 Each standard MUST have a designated **Owner** responsible for its authorship, maintenance, and accuracy.  
1.2 Each standard MUST be reviewed by at least one **Reviewer** prior to activation or major revision.  
1.3 Each standard MUST be approved by an **Approver** before entering the `active` lifecycle state.  
1.4 Owner, Reviewer, and Approver values MUST be captured in document frontmatter per [Documentation_Standard](../02_Documentation_Standards/Documentation_Standard.md).  
1.5 In a solo practice, the Owner, Reviewer, and Approver MAY be fulfilled by the same individual, provided the roles are executed explicitly and sequentially.  
1.6 Automation agents and AI-assisted tooling MAY assist with validation and analysis but SHALL NOT perform approval actions.

## 2. Standard Lifecycle

2.1 All standards MUST progress through the following lifecycle states:

- `draft` — In development and not yet authoritative

- `review` — Under formal evaluation for correctness and alignment

- `active` — Approved and enforceable

- `deprecated` — Superseded or retired but retained for audit purposes


2.2 Lifecycle state MUST be reflected in the `status` field of the YAML frontmatter.  
2.3 Transitions between lifecycle states MUST be recorded through version control history.  
2.4 A standard MAY transition backward to `draft` or `review` if substantive changes are introduced.

## 3. Versioning Rules

3.1 All standards MUST use semantic versioning in `X.Y.Z` format.  
3.2 Version increments SHALL be applied as follows:

- Increment `X` for breaking or foundational changes

- Increment `Y` for additive or clarifying changes

- Increment `Z` for corrections, clarifications, or metadata updates


3.3 Each version increment MUST include a corresponding entry in the `# Changelog` section.  
3.4 Initial activation of a standard MUST begin at version `1.0.0`.

## 4. Amendments and Controlled Change

4.1 Changes to standards MUST originate from a tracked issue and follow the process defined in [Issue_and_Change_Management_Policy](Issue_and_Change_Management_Policy.md).  
4.2 Amendments SHALL be incremental, well-scoped, and explicitly justified.  
4.3 High-impact or cross-cutting changes SHOULD undergo extended review prior to approval.  
4.4 Deprecated standards MUST reference the standard that supersedes them.

## 5. Retirement and Deprecation

5.1 A standard MAY be marked `deprecated` when it is obsolete, superseded, or no longer applicable.  
5.2 Deprecation MUST be explicitly documented in both the frontmatter and changelog.  
5.3 Deprecated standards MUST remain accessible and immutable except for deprecation notices.

## 6. Conflict Resolution

6.1 Conflicts between standards, workflows, or templates MUST be logged
as a tracked issue per [Issue_and_Change_Management_Policy](Issue_and_Change_Management_Policy.md).  
6.2 Until resolved, conflicts SHALL be governed by the highest
precedence rule using the following order:  

- Higher repository layer: `01_Governance` > `02_Documentation_Standards` >
  `03_Engineering_Standards` > `04_Design_Framework` >
  `05_Dev_Workflows` > `06_Projects`  
- Higher lifecycle status: `active` > `review` > `draft`  
- `extends` precedence: the parent (extended) standard wins  
- If still tied, the more restrictive requirement wins

6.3 The conflict issue MUST record the impacted documents, the interim
rule applied, and the proposed resolution path.  
6.4 Conflict resolution that changes behavior or enforcement MUST be
recorded in a decision artifact (ADR or Quint decision).  
6.5 Resolutions MUST update the affected documents and their changelogs
to remove the conflict.  
6.6 In a solo practice, the Owner retains final arbitration authority
but MUST document the decision in the issue and decision artifact.  
6.7 Time-boxed conflict waivers MAY be used to unblock work when a
resolution is not immediately possible. Waivers MUST include explicit
risk acknowledgment and an expiry date in the issue and decision
artifact.  
6.8 Any change relying on a lower-precedence rule without a waiver is
non-compliant.

## 7. Compliance and Escalation

7.1 All standards MUST comply with [Documentation_Standard](../02_Documentation_Standards/Documentation_Standard.md).  
7.2 Standards that violate lifecycle, versioning, or role enforcement SHALL be rejected or returned to draft.  
7.3 Persistent non-compliance MAY result in suspension of approval authority until resolved.

# Implementation Notes

- Templates SHOULD be used to standardize new standards and reduce authoring overhead.

- Review and approval MAY be documented through pull request workflows.

- This policy applies equally to human-authored and AI-assisted standards drafts.


# Continuous Improvement and Compliance Metrics

8.1 Governance effectiveness SHOULD be evaluated using metrics such as amendment frequency, review latency, and rollback events.  
8.2 Findings SHOULD inform refinements to lifecycle rules and review practices.

# Compliance

Any standard that does not conform to this policy SHALL be considered non-authoritative and MUST NOT be enforced until compliance is restored.

# Changelog

- 1.1.3 - Added conflict resolution mechanism and precedence rules.
- 1.1.2 - Set owner/reviewer/approver values.

- 1.1.1 — Added frontmatter capture requirement for governance roles.
- 1.1.0 — Clarified role execution in solo practice, aligned lifecycle language, and strengthened authority boundaries.

- 1.0.0 — Initial release.
