---
id: STD-003
title: Issue and Change Management Policy
version: 1.1.3
category: governance
status: active
approver: sh4i-yurei
reviewer: sh4i-yurei
owner: sh4i-yurei
last_updated: 2026-02-12
review_date: 2026-05-01
extends: [STD-000, STD-002]
tags: [issue-management, change-control, workflow, compliance, traceability]
---
# Purpose

This policy defines the mandatory issue and change management process for all governed documents, standards, and related artifacts maintained within the repository. It ensures that every change is intentional, traceable, reviewed, and authorized before becoming authoritative.

This document establishes **change control as a first-class governance function**, preventing undocumented decisions and uncontrolled evolution of standards or workflows.

# Scope

This policy applies to all governed documentation, including governance policies, standards, design frameworks, workflows, and templates. It governs the creation, tracking, review, approval, and closure of issues and associated changes.

Software implementation artifacts are governed indirectly through this policy when they reference or depend upon governed documentation.

# Standard

## 1. Issue Origination

1.1 All proposed changes to governed documents MUST originate from a formally recorded issue.  
1.1.1 In a solo practice, minor correction or clarification changes MAY use a documented **intent statement** in place of a formal issue.  
1.1.2 Intent statements MUST be 1-2 sentences describing what is changing and why, and MUST be recorded in the pull request description or the document changelog.  
1.2 Issues MUST clearly describe the problem, proposed change, or rationale for modification.  
1.3 Each issue or intent statement MUST reference the affected document(s) using canonical identifiers or Markdown links.  
1.4 Duplicate or overlapping issues SHOULD be consolidated or explicitly cross-referenced.

## 2. Issue Classification

2.1 Each issue MUST be classified according to its primary intent.  
2.2 Valid classifications include:

- Minor correction
    
- Clarification
    
- Revision
    
- Enhancement
    
- Deprecation
    
- Structural or organizational change
    

2.3 Classification SHALL determine review depth and versioning impact as defined in [Standards_Governance_Policy](Standards_Governance_Policy.md).

## 3. Change Implementation

3.1 All changes MUST be implemented through a controlled modification to the affected document(s).  
3.2 Changes MUST be limited in scope to the issue being addressed.  
3.3 Each change MUST preserve separation of concerns and MUST NOT introduce unrelated modifications.  
3.4 AI-assisted tooling MAY be used to draft or analyze changes but SHALL NOT bypass review or approval requirements.

## 4. Review and Approval

4.1 All changes MUST undergo review prior to activation.  
4.2 Review SHALL verify:

- Alignment with [Documentation_Standard](../02_Documentation_Standards/Documentation_Standard.md)
    
- Consistency with [Software_Engineering_Governance_Overview](Software_Engineering_Governance_Overview.md)
    
- Compliance with applicable standards
    
- Absence of scope bleed or role violations
    

4.3 Approval authority is defined in [Standards_Governance_Policy](Standards_Governance_Policy.md).  
4.4 In a solo practice, review and approval steps MUST still be executed explicitly and documented.

## 5. Versioning and Traceability

5.1 Any approved change that alters meaning, structure, or enforceable requirements MUST trigger a version increment.  
5.2 Version increments MUST follow semantic versioning rules defined in [Standards_Governance_Policy](Standards_Governance_Policy.md).  
5.3 Each change MUST be recorded in the affected document’s changelog.  
5.4 Issue references SHOULD be included in changelog entries where applicable.

## 6. Deprecation and Retirement

6.1 Deprecations MUST be initiated through a tracked issue.  
6.2 Deprecated documents MUST remain accessible for audit and historical context.  
6.3 Deprecation notices MUST reference the superseding document, if applicable.

## 7. Enforcement and Exceptions

7.1 Changes introduced without an associated issue or documented intent statement SHALL be considered non-compliant.  
7.2 Emergency or corrective changes MAY be expedited but MUST still be documented retroactively.  
7.3 Exceptions to this policy MUST be explicitly approved and recorded.
7.4 Retroactive documentation for emergency changes MUST be completed within
the timeframe defined in [SDLC_With_AI](../05_Dev_Workflows/SDLC_With_AI.md).

# Implementation Notes

- Issue tracking MAY be implemented using GitHub Issues, an equivalent system, provided traceability is preserved.
- If no external tracker is used, record issues in [KB_Issue_Log](KB_Issue_Log.md) using
  [issue_log_tpl](../06_Projects/Templates/governance/issue_log_tpl.md).
    
- Issue templates SHOULD be used to ensure consistency and completeness.
    
- This policy intentionally avoids prescribing tooling details.
    

# Continuous Improvement and Compliance Metrics

8.1 Metrics MAY include issue-to-resolution time, review latency, and rework frequency.  
8.2 Findings SHOULD inform improvements to governance workflows and standards clarity.

# Compliance

Any change to governed documentation that bypasses this policy SHALL be considered invalid and subject to reversal or remediation.

# Changelog
- 1.1.3 - Added KB issue log and template guidance.
- 1.1.2 - Allowed intent statements for minor changes in solo practice.
- 1.1.1 - Set owner/reviewer/approver values.

- 1.1.0 — Aligned with updated governance hierarchy, clarified solo-practice execution, and strengthened traceability requirements.
    
- 1.0.0 — Initial release.
