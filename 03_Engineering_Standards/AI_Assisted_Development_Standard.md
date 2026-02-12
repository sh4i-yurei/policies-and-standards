---
id: STD-004
title: AI Assisted Development Standard
version: 1.1.3
category: engineering
status: active
approver: sh4i-yurei
reviewer: sh4i-yurei
owner: sh4i-yurei
last_updated: 2026-02-12
review_date: 2026-05-01
extends: [STD-000, STD-005]
tags: [ai, assisted_development, tooling, governance]
---
# Purpose

This standard defines mandatory constraints, expectations, and behavioral rules for the use of AI systems in assisted software development. Its objective is to ensure that AI accelerates implementation and analysis without introducing architectural drift, undocumented decisions, or violations of established engineering standards.

This document governs **how AI may operate**, not what software should be built.

# Scope

This standard applies to all AI-assisted development activities that generate, modify, analyze, or review code or documentation within governed projects. It applies across all IDEs, large language models, and AI agents used during development.

This document does not define coding standards, system architecture, or workflow sequencing.

# Standard

## 1. Authority and Operating Assumptions

1.1 AI-assisted systems SHALL operate as constrained implementation and analysis agents.  
1.2 AI-assisted systems SHALL NOT make autonomous architectural, security, or design decisions.  
1.3 All AI-generated output is subject to human review and approval.  
1.4 AI-assisted systems MUST assume that project structure and design intent have already been defined through approved artifacts.

## 2. Instruction Context and Constraints

2.1 AI-assisted systems MUST be provided with explicit instruction context prior to generating output.  
2.2 Instruction context MUST reference applicable governing standards, including [Coding_Standards_and_Conventions](Coding_Standards_and_Conventions.md).  
2.3 When instruction context is ambiguous or incomplete, AI-assisted systems MUST request clarification rather than infer intent.  
2.4 AI-assisted systems MUST NOT introduce new dependencies, technologies, or architectural patterns unless explicitly instructed.
2.5 Instruction context MUST reference tier-appropriate approved artifacts as
defined in [SDLC_With_AI](../05_Dev_Workflows/SDLC_With_AI.md).
2.6 Instruction context MUST include schema definitions and approved file
boundaries when schemas or layouts are in scope.

## 3. Scope of Permitted Activities

3.1 AI-assisted systems MAY generate helper functions, classes, modules, tests, or documentation that fit within an existing scaffold.  
3.2 AI-assisted systems MAY refactor code within a single module when explicitly requested.  
3.3 AI-assisted systems MAY assist with learning, explanation, or analysis of existing code.  
3.4 AI-assisted systems MUST NOT modify cross-module contracts, public interfaces, or shared data models without explicit approval.

## 4. Output Constraints

4.1 AI-generated code MUST comply with [Coding_Standards_and_Conventions](Coding_Standards_and_Conventions.md).  
4.2 AI-generated output MUST avoid hidden side effects, global state, and implicit dependencies.  
4.3 AI-generated suggestions MUST be limited to the scope explicitly requested.  
4.4 When constraints are violated, AI-assisted systems MUST decline to produce partial or non-compliant output.

## 5. Workspace and Repository Boundaries

5.1 AI-assisted systems MUST respect repository boundaries and directory scopes defined by the project.  
5.2 AI-assisted systems MUST NOT modify configuration, dependency manifests, or build scripts unless explicitly instructed.  
5.3 Suggestions outside approved workspaces MUST be declined with a clear explanation.

## 6. Review, Validation, and Traceability

6.1 AI-generated output MUST be reviewed using the same standards as human-authored work.  
6.2 Defects introduced by AI-assisted output SHALL be treated as implementation defects, not tooling failures.  
6.3 AI-assisted analysis MAY be used to identify violations of standards, complexity issues, or refactoring opportunities.  
6.4 AI-assisted systems MUST support traceability by aligning output with governing documents and issues.

## 7. Prohibited Behaviors

7.1 AI-assisted systems MUST NOT bypass governance, review, or approval processes.  
7.2 AI-assisted systems MUST NOT suppress errors, validation failures, or test results.  
7.3 AI-assisted systems MUST NOT generate code or documentation that conflicts with approved standards.
7.4 Workflow standards MAY name approved tools for this environment, but AI
systems remain bound to this standard and the tool mappings in
[Tooling_Inventory](Tooling_Inventory.md).

# Implementation Notes

- AI instruction blocks MAY be embedded in IDE or tool configuration to preload governing constraints.
    
- Examples provided to AI systems SHOULD be minimal and representative to reduce token waste.
    
- This standard intentionally avoids prescribing specific AI vendors or tools.
    

# Continuous Improvement and Compliance Metrics

8.1 Metrics MAY include frequency of AI-generated violations, rework rates, and review findings.  
8.2 Findings SHOULD inform refinements to instruction practices and constraint definitions.

# Compliance

Any AI-assisted output that violates this standard SHALL be considered non-compliant and subject to correction or rejection prior to merge or release.

# Changelog
- 1.1.3 - Linked tooling inventory location.
- 1.1.2 - Set owner/reviewer/approver values.

- 1.1.1 — Required schema definitions in AI instruction context.
- 1.1.0 — Formatting corrected, scope clarified, and overlap with coding standards removed.
    
- 1.0.0 — Initial release.
