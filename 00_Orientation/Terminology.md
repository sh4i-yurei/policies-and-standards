---
id: STD-011
title: Terminology
version: 1.1.2
category: core
status: draft
approver: sh4i-yurei
reviewer: sh4i-yurei
owner: sh4i-yurei
last_updated: 2026-01-13
review_date: 2026-05-01
extends: [STD-010]
tags: [terminology, definitions, language, governance]
---
# Purpose

This document defines the authoritative terminology used throughout the vault. Its purpose is to establish a shared, unambiguous vocabulary for all governance, design, engineering, and workflow artifacts in order to prevent misinterpretation, implicit assumptions, and semantic drift.

All governed documents MUST use terminology consistent with this reference.

# Scope

This terminology applies to all documentation, design artifacts, implementation specifications, and AI-assisted development activities governed by this vault. Where a term is defined here, its meaning SHALL be used consistently across all documents.

This document does not define external industry terminology unless explicitly adopted.

# Standard

## 1. Governance and Organizational Terms

1.1 **Maintainer**  
The human authority responsible for approving, enforcing, and evolving governance, standards, and design artifacts.

1.2 **Governance**  
The system of rules, standards, and controls that define how software and documentation are created, reviewed, approved, and evolved.

1.3 **Standard**  
A governed document that defines enforceable rules or requirements.

1.4 **Policy**  
A governance document that defines authority, responsibility, or control mechanisms rather than technical rules.

1.5 **Compliance**  
Conformance to applicable standards, policies, and approved artifacts.

1.6 **Project Intake**  
A pre-repo, issue-like record that captures project intent, scope,
ownership, and next steps.

1.7 **Project Charter**  
An artifact that anchors project scope, goals, constraints, and risks
before design and implementation.

1.8 **Product Requirements Document (PRD)**  
A requirements artifact that defines goals, success criteria, users,
and constraints prior to design.

## 2. Design and Architecture Terms

2.1 **Design-First Development**  
A development model in which design artifacts are created, reviewed, and approved before any implementation activity occurs.

2.2 **System**  
A cohesive, independently meaningful software unit with defined boundaries and responsibilities.

2.3 **System Design**  
A design artifact that defines system scope, boundaries, architecture, and high-level constraints.

2.4 **Module**  
A cohesive, bounded unit within a system that has a single primary responsibility.

2.5 **Module Design**  
A design artifact that defines a module’s responsibilities, interfaces, dependencies, and non-responsibilities.

2.6 **Technical Specification**  
An implementation-authorizing artifact that translates approved designs into explicit instructions for code changes.

2.7 **Design Artifact**  
Any governed document that defines system, module, or implementation intent prior to code generation.

2.8 **Lightweight Design (Tier 2)**  
A minimal design artifact that documents problem, approach, interfaces or data impacts, testing, and rollback for a feature change.

2.9 **Inline Design (Tier 1)**  
Design notes captured directly in an issue or pull request for urgent or narrow-scope changes.

2.10 **Architecture Decision Record (ADR)**  
A short, structured record of a significant architectural decision,
including options, rationale, and consequences.

## 3. Implementation and Code Terms

3.1 **Implementation**  
The act of writing, modifying, or refactoring code or configuration.

3.2 **Codebase**  
The collection of source code, tests, and configuration files that implement a system.

3.3 **Dependency**  
Any external module, library, service, or resource required by a system or module.

3.4 **Boundary**  
A defined limit that constrains responsibility, access, or behavior between systems or modules.

## 4. AI and Automation Terms

4.1 **AI-Assisted Development**  
The use of AI systems to generate, modify, analyze, or review artifacts under human authority and defined constraints.

4.2 **AI-Assisted System**  
Any AI or LLM-based tool used in development activities.

4.3 **Instruction Context**  
Explicit constraints, standards, and specifications provided to an AI-assisted system prior to output generation.

4.4 **Architectural Drift**  
The gradual divergence of implemented behavior from approved design intent.

4.5 **Inference (Disallowed)**  
The act of an AI system assuming unspecified behavior or intent. Inference is prohibited unless explicitly authorized.

4.6 **Red-Team Review (AI-Assisted)**  
An AI-assisted challenge pass that probes a design or spec for failure modes, data integrity risks, and security gaps.

## 5. Quality and Validation Terms

5.1 **Test**  
An executable artifact that verifies expected behavior.

5.2 **Validation**  
The process of confirming conformance to standards, specifications, and requirements.

5.3 **Review**  
The act of examining an artifact for correctness, completeness, and compliance.

5.4 **Quality Gate**  
A mandatory checkpoint that must be passed before proceeding to the next lifecycle stage.

5.5 **CI/CD**  
Automated pipelines that build, validate, and release changes using enforced gates.

5.6 **SLI/SLO**  
Service Level Indicators and Service Level Objectives used to define and measure operational quality.

## 6. Workflow and Change Terms

6.1 **Issue**  
A tracked record representing a proposed change, defect, or improvement.

6.2 **Change**  
Any modification to governed documentation, design artifacts, or implementation.

6.3 **Approval**  
Formal authorization that permits an artifact to become authoritative or a change to proceed.

6.4 **Rollback**  
The reversal of a change or release to a previous known-good state.

6.5 **SDLC with AI**  
The governed lifecycle for AI-assisted work, including tiered change paths, required artifacts, and validation gates.

6.6 **Change Tier**  
Risk-based classification of work as Tier 1 (Hotfix), Tier 2 (Feature), or Tier 3 (Architecture).

6.7 **Hotfix (Tier 1)**  
An urgent change to correct outages or critical defects with post-hoc documentation requirements.

6.8 **Feature (Tier 2)**  
A planned change with lightweight design and specification requirements.

6.9 **Architecture (Tier 3)**  
A high-risk change that requires full charter, design, and technical specification artifacts.

6.10 **Inline Specification (Tier 1)**  
A brief, approved specification captured in an issue or pull request for urgent changes.

6.11 **Post-Hoc Documentation**  
Required retroactive documentation after emergency changes, completed within the SDLC window.

6.12 **Spike**  
Time-boxed exploratory work that produces findings but does not ship to production.

6.13 **Maintenance Workflow**  
A governed path for dependency updates and routine operational changes.

6.14 **Traceability**  
Linking issues, specs, changes, and releases to preserve an audit trail.

6.15 **Backlog and Milestones**  
A tracked list of planned work items and major delivery targets used for
sequencing and prioritization.

6.16 **Risk Register**  
A structured record of identified risks, their severity, owners, and
mitigation status.

6.17 **Operational Readiness Review**  
A pre-production checklist to confirm operational, security, and
reliability readiness before release.

6.18 **Release Notes**  
A versioned summary of changes, validation evidence, and rollback
guidance for a release.

6.19 **Environment Promotion Record**  
Evidence that a release was promoted to the target environment, captured
in [release_checklist_tpl](../06_Projects/Templates/release/release_checklist_tpl.md) and [release-notes_tpl](../06_Projects/Templates/release/release-notes_tpl.md) (and
[deployment_tpl](../06_Projects/Templates/operations/deployment_tpl.md) when used).

6.20 **Design Post-Mortem Outcomes**  
Documented findings from a post-release design review, recorded in the
governing issue; if design or architecture changes are required, capture
an ADR using [adr_tpl](../06_Projects/Templates/architecture/adr_tpl.md).

# Implementation Notes

- Terms SHOULD be referenced using consistent capitalization where clarity is improved.
    
- New terms MUST be added through the governed change process.
    
- Where ambiguity exists, this document is authoritative.
    

# Continuous Improvement and Compliance Metrics

7.1 Metrics MAY include terminology-related review comments or rework frequency.  
7.2 Findings SHOULD inform clarifications or expansions to this document.

# Compliance

Any document that uses terminology inconsistently with this reference SHALL be considered non-compliant and subject to revision.

# Changelog

- 1.1.2 - Defined environment promotion record and design post-mortem outcomes.
- 1.1.1 - Set owner/reviewer/approver values.

- 1.1.0 — Added project intake, PRD, charter, ADR, backlog, risk,
  readiness, and release note terminology.
- 1.0.0 — Initial release.
