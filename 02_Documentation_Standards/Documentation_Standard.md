---
id: STD-001
title: Documentation Standard
version: 1.1.5
category: core
status: draft
owner: sh4i-yurei
reviewer: sh4i-yurei
approver: sh4i-yurei
last_updated: 2026-01-13
review_date: 2026-05-01
extends: []
tags: [documentation, structure, formatting, governance, vault, obsidian]
---
# Purpose

This standard defines the mandatory structure, metadata, organization, and linking requirements for all documentation maintained within the vault. It establishes documentation as a governed system with explicit structure, traceability, and lifecycle controls, suitable for both human reasoning and automated processing.

This document is the authoritative specification for how knowledge is authored, stored, linked, and evolved across the software engineering practice.

# Scope

This standard applies to all documents stored in the vault, including governance policies, engineering standards, design frameworks, workflows, and project artifacts. No document may be added, modified, or referenced unless it complies with this standard.

# Standard

## 1. Document Format

1.1 All documents MUST be authored using valid Markdown (`.md`) format.  
1.2 Each document MUST begin with a YAML frontmatter block enclosed by triple dashes (`---`).  
1.3 The file extension MUST be `.md`.  
1.4 Files MUST be encoded in UTF-8 and use Unix-style line endings (LF).  
1.5 All documents MUST be stored within the governed vault structure defined in clause 4.

## 2. Metadata Requirements

2.1 All documents MUST include YAML frontmatter containing the required fields defined in clauses 2.2 through 2.13.  
2.2 `id` MUST be a persistent identifier following the `STD-###` pattern or an approved project-specific variant.  
2.3 `title` MUST reflect the full descriptive name of the document.  
2.4 `version` MUST use semantic versioning in `X.Y.Z` format.  
2.5 `category` MUST indicate the document’s primary classification.  
2.6 `status` MUST be one of `draft`, `review`, `active`, or
`deprecated`.  
2.6.1 Standards MUST align status with
[Standards_Governance_Policy](../01_Governance/Standards_Governance_Policy.md).  
2.7 `owner` MUST identify the accountable owner for the document, or be empty during drafting.  
2.8 `reviewer` MUST identify the reviewer for the document, or be empty during drafting.  
2.9 `approver` MUST identify the approver for the document, or be empty during drafting.  
2.10 `last_updated` MUST use `YYYY-MM-DD` format.  
2.11 `extends` MUST list the identifiers of documents this document builds upon, or be an empty array.  
2.12 `tags` MUST include relevant keywords for indexing and retrieval.  
2.13 All metadata fields MUST be present, even when values are empty.

## 3. Required Section Structure

3.1 Each document MUST contain the following sections in the exact order listed:

- `# Purpose`
    
- `# Scope`
    
- `# Standard`
    
- `# Implementation Notes`
    
- `# Continuous Improvement and Compliance Metrics`
    
- `# Compliance`
    
- `# Changelog`
    

3.2 Section headers MUST use level-one Markdown syntax (`#`).  
3.3 Subsections MAY use deeper heading levels as required.  
3.4 All sections MUST be present, even if temporarily empty during drafting.

## 4. Vault Structure and Schema

See [Vault_Schema_Definition](Vault_Schema_Definition.md) for the canonical directory schema and
document role definitions.

4.1 The vault SHALL function as the single source of truth for all organizational documentation.  
4.2 Documents MUST be organized into numbered, top-level directories that encode conceptual intent and precedence.  
4.3 Directory numbering establishes structural layering and MUST NOT be altered without governance approval.

### 4.1 Orientation (`00_Orientation`)

4.1.1 Contains grounding documents defining mission, vision, principles, and shared terminology.  
4.1.2 Documents in this directory SHALL be descriptive rather than procedural.

### 4.2 Governance (`01_Governance`)

4.2.1 Contains policies defining authority, lifecycle control, and approval mechanisms.  
4.2.2 Governance documents SHALL not prescribe technical implementation details.

### 4.3 Documentation Standards (`02_Documentation_Standards`)

4.3.1 Contains standards governing documentation structure, schema, and linking.  
4.3.2 Standards in this directory SHALL apply uniformly across the entire vault.

### 4.4 Engineering Standards (`03_Engineering_Standards`)

4.4.1 Contains standards governing code quality, AI-assisted development, security, and testing.  
4.4.2 Engineering standards SHALL not define project-specific behavior.

### 4.5 Design Framework (`04_Design_Framework`)

4.5.1 Contains mandatory design artifacts and design-time expectations.  
4.5.2 No implementation activity is permitted without artifacts defined here.

### 4.6 Development Workflows (`05_Dev_Workflows`)

4.6.1 Contains lifecycle and workflow orchestration documents.  
4.6.2 Workflow documents SHALL reference applicable standards rather than redefining them.

### 4.7 Projects (`06_Projects`)

4.7.1 Contains project-specific artifacts derived from upstream standards.  
4.7.2 Projects MUST conform to approved templates and link back to governing documents.

### 4.8 Archive (`99_Archive`)

4.8.1 Contains deprecated or superseded documents retained for auditability.  
4.8.2 Archived documents MUST remain immutable except for metadata or deprecation notices.

## 5. Cross-Referencing and Linking

5.1 When a document references another governed document, it MUST use an Obsidian-style internal link.  
5.2 Links MUST be embedded inline at the point of conceptual dependency.  
5.3 Link targets SHOULD reference canonical document titles or identifiers.  
5.4 Documents MUST avoid duplicating normative content and instead reference the authoritative source.  
5.5 Circular dependencies SHOULD be avoided and flagged during review.

## 6. Document Role Integrity

6.1 Each document MUST serve a single primary role: orientation, governance, standard, framework, workflow, or project artifact.  
6.2 Documents MUST NOT mix roles or responsibilities.  
6.3 Cross-cutting concerns MUST be addressed through explicit linking rather than content blending.

# Implementation Notes

- Templates SHOULD be provided for common document types to reduce authoring friction; maintain template inventory under the Templates directory defined in [Vault_Schema_Definition](Vault_Schema_Definition.md).
    
- Tooling MAY be introduced to validate structure, placement, metadata, and link integrity.
    
- This standard supersedes all prior informal documentation conventions.
- Follow [documentation_change_workflow](../05_Dev_Workflows/documentation_change_workflow.md) for governed updates.

# Continuous Improvement and Compliance Metrics

7.1 Documentation compliance SHOULD be periodically validated through automated or manual audits.  
7.2 Metrics MAY include structural violations, broken links, misplaced documents, and role conflicts.  
7.3 Findings SHOULD inform improvements to standards, templates, and author guidance.

# Compliance

Documents that do not comply with this standard SHALL be rejected, relocated, or revised until compliance is restored. Persistent violations MAY result in rejection of proposed changes under the change management policy.

# Changelog
- 1.1.5 - Set owner/reviewer/approver values.

- 1.1.4 — Added owner, reviewer, and approver frontmatter requirements.
- 1.1.3 — Replaced template path reference with vault schema link.
- 1.1.2 — Aligned status lifecycle with governance.
- 1.1.1 — Linked vault schema and documentation change workflow.
- 1.1.0 — Integrated vault schema and mandatory cross-referencing requirements.
    
- 1.0.1 — Added lifecycle governance and CI enforcement.
    
- 1.0.0 — Initial release.
