---
id: STD-003
title: Issue and Change Management Policy
version: 1.0.1
category: core
status: active
last_updated: 2025-12-10
review_date: 2026-05-01
extends: []
tags: [issue-management, change-control, workflow, compliance]
---

# Purpose
Defines a structured issue and change management workflow with integrated automation, AI assistance, and empirical feedback metrics. It ensures that every modification is traceable, reviewed, and properly authorized before publication while maintaining integrity, transparency, and accountability across the lifecycle of all standards and governance documents.

# Scope
This policy applies to all controlled standards, governance documents, procedures, and related records maintained in the repository. It governs the creation, tracking, review, and approval of issues, change requests, and associated pull requests.  
This policy covers all modifications, including enhancements, corrections, deprecations, and metadata updates made under the authority of STD-001 (Documentation Standard) and STD-002 (Standards Governance Policy).

# Standard

## 1. Issue Creation and Tracking

1.1 All proposed changes to governed documents MUST originate from a formally logged GitHub Issue.  
1.2 Each Issue MUST include the following required fields:

- **Title** — A concise summary describing the change or problem.  
- **Description** — A detailed explanation including purpose, scope, affected documents, and rationale.  
- **Type** — The change classification (`bug`, `enhancement`, `revision`, `deprecation`, `metadata`, or `formatting`).  
- **Severity/Impact** — Optional field describing potential scope or significance (`low`, `medium`, `high`).  

1.3 Each Issue MUST include a clear reference to the affected document(s) by standard ID (e.g., `STD-001`).  
1.4 Issues MUST be labeled according to repository conventions to facilitate filtering and prioritization.  
1.5 Duplicate or redundant Issues SHOULD be closed with a note referencing the canonical Issue.  
1.6 Issues MAY remain open through multiple Pull Requests if part of an iterative change process.

## 2. Change Classification

2.1 All changes MUST be categorized as one of the following types:

- **Minor Edit** — Non-substantive changes such as grammar, spelling, or formatting corrections that do not affect structure or intent.  
- **Revision** — Substantive updates that alter structure, content, or interpretation of requirements.  
- **Deprecation** — Retirement of a standard or document that has been superseded or rendered obsolete.  
- **Metadata Update** — Changes limited to the YAML frontmatter or other descriptive metadata.  
- **Structural Realignment** — Adjustments to document layout, numbering, or formatting that improve readability without altering meaning.

2.2 Each change classification determines review depth, required approvals, and version increment level as defined in STD-002.  
2.3 Any change classified as a Revision or Deprecation MUST undergo full review and approval before merging.
2.4 Any change classified with Impact Level = High (e.g., broad policy, security, or cross-repository changes) MUST undergo additional governance review and approval by the AI Standards Council before merge.

## 3. Change Proposal and Review Workflow

3.1 All modifications MUST be implemented through a GitHub Pull Request (PR).  
3.2 Each PR MUST link to at least one corresponding Issue using GitHub’s reference format (e.g., `Closes #123`).  
3.3 Each PR MUST contain a concise description of the proposed change and justification for inclusion.  
3.4 Pull Requests MUST contain only changes relevant to their referenced Issue(s).  
3.5 PRs MUST pass automated validation checks (e.g., schema and structure validation) prior to review.  
3.6 At least one Reviewer MUST verify the change for accuracy and alignment with applicable standards.  
3.7 The Approver, as defined in STD-002, MUST provide final authorization before the PR is merged.  
3.8 All merged PRs MUST automatically close or update their corresponding Issues.  
3.9 Any rejected or withdrawn PR MUST include a justification or link to a superseding Issue.
3.10 All Pull Requests MUST pass automated validation checks executed by the CI/CD governance pipeline prior to human review.
3.11 AI-assisted review tools, as defined in STD-004, MAY conduct initial compliance scanning, metadata validation, and risk flagging.
3.12 Automation outputs MUST be logged and attached to the Pull Request for audit visibility.

## 4. Versioning and Documentation Linkage

4.1 Version increments MUST follow the rules defined in STD-002 (Standards Governance Policy).  
4.2 Any change classified as a Revision, Deprecation, or Metadata Update MUST trigger a version increment in the affected document.  
4.3 Minor Edits MAY be merged without version increment, provided they do not modify content, structure, or meaning.  
4.4 Each version increment MUST include a corresponding entry in the `# Changelog` section of the affected document.  
4.5 Affected documents MUST maintain accurate version, status, and update metadata in the YAML frontmatter.  
4.6 Linked Issues and PRs MUST remain visible in version control history to ensure traceability.

# Implementation Notes
- The official issue tracking platform is GitHub Issues associated with the organizational repository.  
- Pull Requests MUST reference related Issues using `Closes`, `Fixes`, or `Relates to` notation in the PR description.  
- Repository maintainers SHOULD use standard labels such as `bug`, `enhancement`, `documentation`, and `revision` to indicate change intent.  
- A formal label taxonomy and usage guide SHOULD be published as a separate supporting document.  
- Issue and PR templates MAY be maintained under `.github/` to standardize submissions and ensure all required information is provided.  
- Automated workflows MAY enforce structural validation, changelog checks, and metadata consistency prior to merge approval.

# Process Metrics and Continuous Improvement
5.1 The governance process SHALL be empirically monitored for efficiency and quality.  
5.2 Metrics to be tracked MUST include:
    - Issue-to-Merge Cycle Time (mean and 90th percentile)
    - Review Latency (PR open → first review)
    - PR Rejection/Withdrawal Rate
    - Post-merge Amendment or Reversion Rate
    - Quarterly Retrospective Outcome Summaries
5.3 Governance tooling MUST expose these metrics via dashboards or automated reports.  
5.4 Results SHALL be reviewed quarterly by the AI Standards Council for process refinement.  
5.5 Continuous improvement actions SHOULD be documented as follow-up Issues referencing this policy.  
5.6 Cross-reference: STD-001 (Documentation Standard) for lifecycle, STD-004 (AI Assisted Development Standard) for automation, STD-005 (Coding Standards) for CI/CD enforcement.

# Compliance
All changes to governed documentation MUST be tracked via a GitHub Issue linked to an approved Pull Request.  
Any modification introduced without proper tracking, classification, or approval SHALL be considered non-compliant and subject to reversion.  
Reviewers and Approvers are responsible for enforcing this policy as part of the document lifecycle defined in STD-002.

# Changelog
- 1.0.0 — Initial draft.

Reference: core/issue_and_change_management_policy.md (STD-003)
