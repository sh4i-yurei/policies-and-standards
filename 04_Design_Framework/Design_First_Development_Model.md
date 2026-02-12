---
id: STD-020
title: Design-First Development Model
version: 1.0.4
category: design
status: active
approver: sh4i-yurei
reviewer: sh4i-yurei
owner: sh4i-yurei
last_updated: 2026-02-12
review_date: 2026-05-01
extends: [STD-000, STD-002]
tags: [design, architecture, workflow, governance]
---
# Purpose

This document defines the design-first development model governing all software development activities within this practice. Its purpose is to ensure that architectural intent, system boundaries, and design decisions are explicitly defined, reviewed, and approved before any implementation activity occurs.

This model establishes **design as a mandatory control gate** rather than an optional planning step.

# Scope

This model applies to all software systems, subsystems, and components developed under this governance framework. It governs both human and AI-assisted development activities and applies regardless of project size or complexity.

Exploratory or experimental work that bypasses this model is explicitly out of scope and must remain isolated from governed artifacts.

This model defines design authority and gates; the authoritative end-to-end workflow remains [SDLC_With_AI](../05_Dev_Workflows/SDLC_With_AI.md).

# Standard

## 1. Design Authority

1.1 Architectural and design authority resides with the human maintainer.  
1.2 AI-assisted systems SHALL NOT define system architecture, module boundaries, or design intent.  
1.3 Design decisions MUST be captured in formal design artifacts prior to implementation.

## 2. Design as a Mandatory Gate

2.1 No implementation activity SHALL occur without approved design artifacts.  
2.2 Design artifacts MUST be created, reviewed, and approved before code is generated or modified.  
2.3 This requirement applies equally to human-authored and AI-generated code.
2.4 Approved design artifacts MAY be tier-appropriate as defined in
[SDLC_With_AI](../05_Dev_Workflows/SDLC_With_AI.md). Tier 1 and Tier 2 changes MAY use inline or lightweight
design artifacts; Tier 3 changes REQUIRE full System and Module Design
artifacts.
2.5 Significant architectural decisions MUST be supported by an options
analysis using
[architecture-options-analysis_tpl](../06_Projects/Templates/architecture/architecture-options-analysis_tpl.md)
and linked from the System Design.  
2.6 Significant architectural decisions MUST be captured as ADRs using the
approved template in [adr_tpl](../06_Projects/Templates/architecture/adr_tpl.md) and
linked from the System Design.

## 3. Required Design Artifacts

3.1 All systems MUST have a System Design artifact.  
3.2 Systems composed of multiple components MUST have Module Design artifacts.  
3.3 All implementation work MUST be driven by Technical Specification artifacts.  
3.4 The structure and content of these artifacts are defined in [System_Design_Standard](System_Design_Standard.md), [Module_Design_Standard](Module_Design_Standard.md), and [Technical_Specification_Standard](Technical_Specification_Standard.md).

## 4. Separation of Concerns in Design

4.1 Design artifacts MUST clearly separate concerns such as business logic, infrastructure, data persistence, and external integrations.  
4.2 Cross-cutting concerns (security, observability, testing) MUST be explicitly addressed in design.  
4.3 Design documents MUST avoid embedding implementation details except where required to clarify intent.

## 5. Design Review and Approval

5.1 Design artifacts MUST undergo review prior to approval.  
5.2 Review SHALL verify completeness, coherence, and alignment with governing standards.  
5.3 Approved designs SHALL be treated as authoritative until formally amended.

## 6. Relationship to Implementation and AI Assistance

6.1 Implementation activities MUST conform strictly to approved design artifacts.  
6.2 AI-assisted development MAY be used only after design approval and MUST operate within the constraints defined by those artifacts.  
6.3 Deviations from approved design require a design amendment and re-approval.

## 7. Change and Evolution

7.1 Design changes MUST follow the controlled change process defined in [Issue_and_Change_Management_Policy](../01_Governance/Issue_and_Change_Management_Policy.md).  
7.2 Incremental design evolution is preferred over large-scale redesign.  
7.3 Historical design artifacts MUST be retained for traceability and auditability.
7.4 Design amendments MUST increment version metadata and update the
changelog; superseded decisions MUST be recorded in ADRs.

# Implementation Notes

- This model is intentionally prescriptive to prevent architectural drift.
    
- Design artifacts MAY be lightweight for small systems but MUST still exist.
    
- Design approval may be documented through version control or issue tracking workflows.
    

# Continuous Improvement and Compliance Metrics

8.1 Metrics MAY include frequency of design changes, post-implementation rework, and deviation findings.  
8.2 Findings SHOULD inform refinements to design standards and review practices.

# Compliance

Any implementation activity that occurs without approved design artifacts SHALL be considered non-compliant and subject to corrective action or rollback.

# Changelog
- 1.0.4 - Set owner/reviewer/approver values.

- 1.0.3 - Clarified SDLC authority reference.
- 1.0.2 - Replaced template paths with KB links.
- 1.0.1 - Required version/changelog updates for design amendments.
- 1.0.0 - Initial release.
