---
id: STD-024
title: Design Review Checklist
version: 1.0.7
category: design
status: active
approver: sh4i-yurei
reviewer: sh4i-yurei
owner: sh4i-yurei
last_updated: 2026-02-12
review_date: 2026-05-01
extends: [STD-020, STD-021, STD-022, STD-023]
tags: [design-review, checklist, validation, architecture]
---
# Purpose

This document defines a mandatory checklist used to review and validate design artifacts prior to approval. Its purpose is to ensure that System Designs, Module Designs, and Technical Specifications are complete, coherent, and aligned with governing standards before implementation is authorized.

This checklist functions as a **quality gate**, not as guidance or instruction.

# Scope

This checklist applies to all design artifacts governed by the Design Framework, including System Design, Module Design, and Technical Specification artifacts. Completion of the applicable sections of this checklist is REQUIRED before design approval.

This document does not define how designs are created or implemented.

# Standard

## 1. General Design Review (Applies to All Design Artifacts)

1.1 The design artifact exists and complies with the [Documentation_Standard](../02_Documentation_Standards/Documentation_Standard.md).  
1.2 The artifact clearly identifies its role (System, Module, or Technical Specification).  
1.3 The artifact references all upstream governing documents using Markdown links.  
1.4 Terminology is consistent with [Terminology](../00_Orientation/Terminology.md).  
1.5 The design avoids ambiguity, placeholders, or implied behavior.  
1.6 Assumptions are explicitly documented.  
1.7 Out-of-scope responsibilities are explicitly stated.
1.8 Version metadata and changelog entries reflect the current review.  
1.9 Design governance and approver list are linked (charter or issue).

## 2. System Design Review Checklist

2.1 The system's purpose and objectives are clearly defined.  
2.2 System boundaries are explicit and unambiguous.  
2.3 External systems and actors are clearly identified.  
2.4 Architectural style and high-level structure are documented without
implementation leakage.  
2.5 Architecture options and a decision rubric are documented or linked, with
trade-offs captured.  
2.6 Data ownership and flow are clearly defined.  
2.7 Non-functional requirements are explicitly stated.  
2.8 Security and risk considerations are addressed at a high level.  
2.9 Threat model artifacts are linked per
[Security_and_Threat_Modeling_Standard](../03_Engineering_Standards/Security_and_Threat_Modeling_Standard.md).  
2.10 SLI/SLO targets and error budgets are linked per
[SLI_SLO_Standard](../03_Engineering_Standards/SLI_SLO_Standard.md).  
2.11 Explicit out-of-scope responsibilities are documented.  
2.12 The System Design constrains all downstream Module Designs.  
2.13 Schema definitions are linked for owned data and external
contracts when applicable.
2.14 Risk register exists when the change introduces security, data, or
operational risk, or for all Tier 3 changes.  
2.15 Success metrics and instrumentation plan are documented.  
2.16 Progressive delivery plan (feature flags, canary, rollback triggers)
is documented when applicable.  
2.17 Failure scenarios and mitigations are documented for critical paths.  
2.18 Design governance and stakeholder sign-offs are recorded for Tier 3.

## 3. Module Design Review Checklist

3.1 The module has exactly one primary responsibility.  
3.2 Inputs and outputs are fully specified.  
3.3 Public interfaces are minimal and well-defined.  
3.4 Dependencies are explicitly listed and justified.  
3.5 No cyclic dependencies are introduced.  
3.6 Error and failure modes are documented.  
3.7 Non-functional considerations are addressed where relevant.  
3.8 Explicit non-responsibilities are documented.  
3.9 The Module Design aligns with the approved System Design.
3.10 Required logs, metrics, and traces are identified.

## 4. Technical Specification Review Checklist

4.1 The specification references an approved Module Design.  
4.2 Authorized implementation boundaries are explicitly defined.  
4.3 Interfaces and contracts are fully specified.  
4.4 Data structures and ownership are clearly defined.  
4.5 Algorithms and control flow are sufficiently detailed to prevent interpretation gaps.  
4.6 Error handling behavior is explicitly defined.  
4.7 Configuration and dependencies are fully documented.  
4.8 Testing requirements are defined prior to implementation.  
4.9 Non-functional constraints are specified where applicable.  
4.10 Explicit exclusions are documented.  
4.11 The specification is precise enough to be implemented by AI without inference.  
4.12 Schema definitions are linked for data structures and interfaces.
4.13 Validation/rollout and rollback triggers are documented.  
4.14 Success metrics and telemetry updates are documented.

## 5. AI Readiness Review

5.1 The design contains no ambiguous or underspecified behavior.  
5.2 All constraints required for AI-assisted development are explicitly stated.  
5.3 The design references applicable standards, including [AI_Assisted_Development_Standard](../03_Engineering_Standards/AI_Assisted_Development_Standard.md) and [Coding_Standards_and_Conventions](../03_Engineering_Standards/Coding_Standards_and_Conventions.md).  
5.4 The design provides sufficient context to prevent AI-generated architectural drift.  
5.5 Any areas requiring human judgment are explicitly identified.
5.6 AI validation findings (completeness, ADR conflicts, standards alignment)
are recorded when required.
5.7 ExecPlan criteria are assessed per `PLANS.md`; if required, an
ExecPlan is created or scheduled before implementation.
5.8 `AI_CONTEXT.md` is prepared or updated for the implementation handoff.

## 6. Approval Decision

6.1 All applicable checklist items have been reviewed.  
6.2 Open questions or risks are documented and resolved.  
6.3 The design is approved for downstream use, or returned for revision.  
6.4 Approval or rejection is recorded through the governed change process.

# Implementation Notes

- This checklist MAY be completed inline within design documents or as a separate review artifact.
    
- The checklist is intended to be deterministic; items are pass/fail, not advisory.
    
- In a solo practice, the act of completing this checklist constitutes formal review.
    

# Continuous Improvement and Compliance Metrics

7.1 Metrics MAY include design rejection rate, post-implementation deviations, and rework frequency.  
7.2 Findings SHOULD inform refinements to design standards and checklist criteria.

# Compliance

Design artifacts that have not passed the applicable sections of this checklist SHALL NOT be approved for implementation or AI-assisted development.

# Changelog

- 1.0.7 - Updated links for renamed engineering standards.
- 1.0.6 - Set owner/reviewer/approver values.

- 1.0.5 - Added AI context pack readiness check.
- 1.0.4 - Added ExecPlan readiness check.
- 1.0.3 - Added risk register check for Tier 3 and risk-bearing changes.
- 1.0.2 - Added versioning, governance, success metrics, progressive
  delivery, and telemetry checks.
- 1.0.1 - Added schema definition checks.
- 1.0.0 - Initial release.
