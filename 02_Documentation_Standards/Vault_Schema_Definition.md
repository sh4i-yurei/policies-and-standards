---
id: STD-012
title: Repository Schema Definition
version: 1.0.2
category: core
status: active
approver: sh4i-yurei
reviewer: sh4i-yurei
owner: sh4i-yurei
last_updated: 2026-02-12
extends: [STD-001]
tags: [repository, schema, structure, governance]
---

# Purpose

This document defines the structural schema of the repository that serves as the authoritative knowledge base for the software engineering practice. It establishes mandatory directory groupings, document roles, and structural constraints to ensure separation of concerns, navigability, and long-term maintainability.

The vault schema is intended to be stable, explicit, and machine-auditable, enabling both human exploration and automated tooling to reason reliably about the repository contents.

# Scope

This schema applies to all documents stored in the repository, including governance standards, engineering standards, design frameworks, workflows, and project artifacts. All new documents MUST conform to this schema unless an explicit, approved exception is documented through the change management process.

# Standard

## 1. Vault as System of Record

1.1 The repository SHALL function as the single source of truth for all organizational knowledge related to software engineering governance, standards, design, and workflows.  
1.2 Informal notes, exploratory drafts, or transient ideas MUST either conform to this schema or be explicitly stored outside the governed vault.  
1.3 All documents within the repository MUST comply with [Documentation_Standard](Documentation_Standard.md).

## 2. Top-Level Directory Schema

2.1 The vault MUST be organized into numbered, top-level directories that encode document intent and precedence.  
2.2 Directory numbering establishes conceptual layering, not chronological order.  
2.3 Documents MUST reside only in directories appropriate to their role as defined below.
2.4 Files at the repository root are treated as non-governed drafts or
reference material unless explicitly placed in a numbered directory.
Directories explicitly labeled as not part of the KB are excluded from
governance.

### 2.1 Orientation (`00_Orientation`)

2.1.1 This directory contains grounding documents that define purpose, vision, and shared understanding.  
2.1.2 Documents in this directory SHALL be descriptive rather than procedural.  
2.1.3 Changes to these documents SHOULD be infrequent and subject to heightened review.

### 2.2 Governance (`01_Governance`)

2.2.1 This directory contains policies that define authority, lifecycle control, and approval mechanisms.  
2.2.2 Governance documents SHALL not prescribe technical implementation details.  
2.2.3 All standards and workflows MUST be traceable to governance authority defined here.

### 2.3 Documentation Standards (`02_Documentation_Standards`)

2.3.1 This directory defines how documents are authored, structured, linked, and validated.  
2.3.2 Documentation standards SHALL apply uniformly across all other directories.  
2.3.3 Changes to this directory MAY require cascading updates to other documents.

### 2.4 Engineering Standards (`03_Engineering_Standards`)

2.4.1 This directory defines technical constraints for code, AI-assisted development, security, and quality.  
2.4.2 Engineering standards SHALL not define project-specific behavior.  
2.4.3 AI-assisted tooling MUST reference applicable standards from this directory.

### 2.5 Design Framework (`04_Design_Framework`)

2.5.1 This directory defines mandatory design artifacts and design-time expectations.  
2.5.2 Documents here govern system design, module design, and specification practices.  
2.5.3 No implementation activity is permitted without artifacts defined in this directory.

### 2.6 Development Workflows (`05_Dev_Workflows`)

2.6.1 This directory defines how work progresses through the system lifecycle.  
2.6.2 Workflow documents SHALL reference applicable governance, design, and engineering standards.  
2.6.3 Workflows SHALL not redefine standards; they orchestrate their application.

### 2.7 Projects (`06_Projects`)

2.7.1 This directory contains project-specific artifacts derived from upstream standards and frameworks.  
2.7.2 Each project MUST conform to the approved project template structure.  
2.7.3 Project documents SHALL link back to governing standards and design frameworks.

### 2.8 Archive (`99_Archive`)

2.8.1 This directory stores deprecated, superseded, or retired documents.  
2.8.2 Archived documents MUST remain immutable except for metadata or deprecation notices.  
2.8.3 Archive contents remain searchable and linkable for audit and historical context.

## 3. Document Role Constraints

3.1 Each document MUST have a single primary role: orientation, governance, standard, framework, workflow, or project artifact.  
3.2 Documents MUST NOT blend roles (e.g., governance mixed with implementation guidance).  
3.3 When cross-cutting concerns exist, documents MUST reference each other using explicit internal links rather than duplicating content.

## 4. Linking and Navigability

4.1 Documents MUST use standard relative Markdown links when referencing other governed documents.  
4.2 Links SHOULD be embedded inline at the point of conceptual dependency.  
4.3 Link targets SHOULD reference canonical document titles or IDs to ensure long-term stability.  
4.4 Circular dependencies between documents SHOULD be avoided and flagged during review.

## 5. Schema Evolution

5.1 Changes to the repository schema MUST be proposed and approved through the change management process.  
5.2 Schema changes SHOULD prioritize backward compatibility and minimal disruption.  
5.3 When schema changes occur, affected documents MUST be updated to restore compliance.

# Implementation Notes

- Folder numbering is intentional and MUST NOT be altered without schema approval.

- Tooling MAY be introduced to validate directory placement and link integrity.

- Templates SHOULD be provided for common document types to reduce authoring friction.


# Continuous Improvement and Compliance Metrics

6.1 Schema compliance SHOULD be periodically validated through automated checks or manual audits.  
6.2 Metrics MAY include misplaced documents, broken links, and role violations.  
6.3 Findings SHOULD inform improvements to documentation standards and author guidance.

# Compliance

Documents that do not conform to this schema SHALL be considered non-compliant and subject to revision or relocation. Persistent violations MAY result in rejection of proposed changes until compliance is restored.

# Changelog

- 1.0.2 - Set owner/reviewer/approver values.

- 1.0.1 — Clarified root-level draft and non-KB exclusions.
- 1.0.0 — Initial draft.
