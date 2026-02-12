---
id: STD-055
title: Schema definition standard
version: 0.1.5
category: design
status: active
approver: sh4i-yurei
reviewer: sh4i-yurei
owner: sh4i-yurei
last_updated: 2026-02-12
extends: [STD-020, STD-023, STD-044]
tags: [schema, design, contracts, data, interfaces]
---
# Purpose

Define how schemas are identified, documented, and constrained so
implementation (including AI-assisted work) follows explicit structure
instead of inferred shapes.

# Scope

Applies to any change that introduces or modifies data models, API
contracts, event/message formats, configuration formats, or repository
layout rules for governed projects. Schema definitions are required for
Tier 2 and Tier 3 changes per [SDLC_With_AI](../05_Dev_Workflows/SDLC_With_AI.md) and MUST be created
during the Design stage before Implementation.

# Standard

## 1. Schema definition requirement

1.1 A schema definition artifact MUST exist for any change that
introduces or modifies a schema.  
1.2 Trivial changes (typos, comments, formatting) MAY be documented in
the change PR instead of updating the schema definition artifact.  
1.3 Any change that alters semantics, compatibility, validation rules,
or adds/removes fields MUST update the schema definition artifact.  
1.4 A schema definition MUST be created using the template in
[schema-definition_tpl](../06_Projects/Templates/design/schema-definition_tpl.md) or documented as
a canonical schema file with a companion markdown description.  
1.5 The schema definition template provides required sections and
examples. See [schema-definition_tpl](../06_Projects/Templates/design/schema-definition_tpl.md) for the canonical structure.  
1.6 Schema definitions MUST be approved before implementation work
begins.

## 2. Schema types and coverage

Schema definitions MUST cover, when in scope:

- Data/storage schemas (tables, collections, object models).
- API schemas (REST, GraphQL, RPC contracts).
- Event/message schemas (queues, streams, webhooks).
- Configuration schemas (config files, environment formats).
- Repository layout rules (allowed paths, module boundaries). For
  example, allowed directory structures, file naming conventions, and
  module boundaries such as "tests MUST live in tests/, not src/".

## 3. Source of truth and representation

3.1 Each schema definition MUST identify the canonical source-of-truth
files and formats (SQL, OpenAPI, JSON Schema, protobuf).  
3.2 Schema definitions MUST list exact file paths relative to the repo
root. If a schema spans multiple files, list the directory and
index/main file.  
3.3 If a schema is embedded in code, the definition MUST link to the
authoritative file paths and describe how it is validated.  
3.4 Schema definitions MUST include versioning and compatibility rules.  
3.5 Validation tooling or checks MUST be specified.  
3.6 Validation checks MUST run in CI on every change to canonical
schema files when CI is available.  
3.7 If no automated validation exists, or CI is not available, the
schema definition MUST note "Manual validation only" and link to the
review checklist or validation steps.

## 4. Linkage requirements

4.1 System and Module Designs MUST link to schema definitions for owned
data and exposed contracts.  
4.2 Technical Specifications MUST link to schema definitions for any
data structures or interfaces they implement.  
4.3 AI context packs MUST include relevant schema definitions and
approved file boundaries for the task.

## 5. Change control

5.1 Breaking schema changes MUST include an ADR and migration or
rollback plan.  
5.2 Schema changes that alter data classification or retention MUST be
aligned with [Data_Management_Standard](../03_Engineering_Standards/Data_Management_Standard.md).

## 6. AI-assisted implementation requirements

6.1 AI prompts for schema work MUST reference this standard and the
schema definition artifact, aligned with
[AI_Assisted_Development_Standard](../03_Engineering_Standards/AI_Assisted_Development_Standard.md).  
6.2 AI-generated schema changes MUST be scoped to paths listed in the
schema definition "Repository layout rules" section.  
6.3 AI MUST NOT infer or modify schema structure outside explicitly
documented definitions.

## 7. Implementation boundaries

7.1 Schema definitions MUST identify or link to allowed file paths for
schema changes.  
7.2 Implementation MUST NOT modify schema files outside approved
boundaries.

# Implementation Notes

- Keep schema definitions concise and explicitly scoped.
- Link schema definitions from specs to prevent AI inference.
- Solo maintainers with multiple repos SHOULD maintain a schema
  registry (vault or central docs repo) listing schemas across
  projects. Check the registry before creating a new schema to avoid
  duplication or naming conflicts.

# Continuous Improvement and Compliance Metrics

- Track schema definition coverage (% of schemas with artifacts),
  schema-code drift incidents, breaking change frequency, and
  validation failure rates. Review metrics quarterly.

# Compliance

Implementation work that changes schemas without an approved schema
definition is non-compliant.  
CI SHOULD detect schema file changes and require a linked, approved
schema definition artifact.  
Non-compliant schema changes MUST be reverted or documented
retroactively before the next release.  
Solo maintainers SHOULD use pre-commit hooks or CI checks to validate
schema change compliance.

# Changelog

- 0.1.5 - Updated links for renamed engineering standards.
- 0.1.4 - Set owner/reviewer/approver values.

- 0.1.3 - Replaced template path with KB link.
- 0.1.2 - Promoted to review status.
- 0.1.1 - Clarified requirements, validation, AI use, and compliance.
- 0.1.0 - Initial draft.
