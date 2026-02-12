---
id: TPL-PRJ-SCHEMA
title: Schema definition template
version: 0.1.3
category: project
status: draft
owner: sh4i-yurei
reviewer: sh4i-yurei
approver: sh4i-yurei
last_updated: 2026-01-13
extends: [STD-001, STD-055]
tags: [template, schema, design, contracts]
---
# Purpose

Provide a structured schema definition aligned to
[schema-definition-standard](../../../04_Design_Framework/schema-definition-standard.md).

# Scope

Use for any change that introduces or modifies data models, API
contracts, event formats, configuration formats, or repository layout
rules.

# Standard

## Schema summary

- Schema name: <name>
- Schema type: <data|api|event|config|layout>
- Owner: <name/contact>
- Status: <draft|approved>
- Version: <text>
- Approver: <name/contact>
- Approval date: <YYYY-MM-DD>

## Scope and intent

Describe what this schema covers and why it exists.

## Source of truth

- Canonical files: <paths>
- Format or spec: <sql|openapi|json schema|protobuf|other>
- Validation tooling: <commands or checks>
- CI validation: <job or check name>
- Manual validation: <yes/no; steps if yes>

## Schema definition

Describe entities, fields, constraints, and relationships. For API or
event schemas, list endpoints or message shapes with required fields.

## Compatibility and migration

- Compatibility rules: <backward|forward|none>
- Migration or rollout plan: <text>
- Deprecations: <text>

## Consumers and producers

List services, modules, or integrations that use this schema.

## Storage, retention, and privacy

Describe storage location, retention expectations, and data sensitivity.
- Data classification: <public|internal|confidential|restricted>

## Repository layout rules

If this schema defines file layout or module boundaries, list allowed
paths and restricted areas.
- Allowed paths: <list>
- Restricted paths: <list>

## Links

- System Design: <link>
- Module Design: <link>
- Technical Spec: <link>
- AI context pack: <link>
- ADRs: <list>
- Issues/PRs: <list>

# Implementation Notes

- Keep schemas explicit and avoid inference.
- Link schema definitions in specs and context packs.

# Continuous Improvement and Compliance Metrics

- Track schema drift and contract breakage.

# Compliance

Schema changes without this artifact are non-compliant.

# Changelog

- 0.1.3 - Set owner/reviewer/approver values.
- 0.1.2 - Added owner/reviewer/approver frontmatter fields.

- 0.1.1 - Promoted to review status and expanded validation metadata.
- 0.1.0 - Initial draft.
