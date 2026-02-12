---
id: STD-051
title: Data and storage rules pack
version: 1.0.4
category: reference
status: active
approver: sh4i-yurei
reviewer: sh4i-yurei
owner: sh4i-yurei
last_updated: 2026-02-12
extends: [STD-004, STD-032, STD-044]
tags: [rules, data, storage, prompts]
---
# Purpose

Define rules for data modeling, storage changes, and migrations.

# Scope

Apply when modifying schemas, persistence logic, or data pipelines.

# Standard

## Governing standards

- [Data_Management_Standard](../Data_Management_Standard.md)
- [schema-definition-standard](../../04_Design_Framework/schema-definition-standard.md)
- [Technical_Specification_Standard](../../04_Design_Framework/Technical_Specification_Standard.md)
- [Security_and_Threat_Modeling_Standard](../Security_and_Threat_Modeling_Standard.md)
- [Testing_and_Quality_Standard](../Testing_and_Quality_Standard.md)

## 1. Classification and ownership

1.1 Data ownership and lifecycle changes MUST be documented in System
Design artifacts.  
1.2 Data classification MUST align with [Data_Management_Standard](../Data_Management_Standard.md).  
1.3 Data risk changes MUST be recorded in the risk register.

## 2. Schema and modeling

2.1 Use consistent naming, constraints, and indexing conventions.  
2.2 Schema changes MUST be reviewed for backward compatibility.  
2.3 Data models MUST document required fields and defaults.

## 3. Migrations and rollbacks

3.1 Migrations MUST include rollout, backfill, and rollback steps in the
Technical Specification.  
3.2 Destructive changes require explicit approval and verified backups.  
3.3 Migrations MUST be staged when large data sets are affected.

## 4. Data quality and validation

4.1 Validate inputs at ingestion boundaries and before persistence.  
4.2 Data integrity checks MUST be documented for critical datasets.  
4.3 Data quality metrics SHOULD be monitored in operations.

## 5. Performance and scaling

5.1 Index changes MUST be justified with query or workload evidence.  
5.2 Large scans or backfills MUST include throttling guidance.  
5.3 Storage cost impacts SHOULD be documented when material.

## 6. Testing and verification

6.1 Update tests and fixtures for schema changes.  
6.2 Migration tests MUST validate both forward and rollback paths.  
6.3 Sampling validation MUST be recorded for large backfills.

## 7. Documentation

7.1 Update specs, runbooks, and operational notes when data handling
changes.  
7.2 Release notes MUST call out breaking or retention changes.

# Implementation Notes

- Include this rule pack for any data model or storage change.
- Align with [Data_Management_Standard](../Data_Management_Standard.md) for retention and recovery.

# Continuous Improvement and Compliance Metrics

Track migration failures, data defects, and recovery outcomes.

# Compliance

Data changes that ignore this rule pack are non-compliant.

# Changelog

- 1.0.4 - Updated links for renamed engineering standards.
- 1.0.3 - Set owner/reviewer/approver values.

- 1.0.2 - Added governing standards links.
- 1.0.1 - Marked draft pending rules index activation.
- 1.0.0 - Promoted to active after review.
- 0.2.0 - Expanded data rules and migration requirements.
- 0.1.0 - Initial draft.
