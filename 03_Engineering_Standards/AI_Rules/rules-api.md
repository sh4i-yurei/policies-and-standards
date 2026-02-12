---
id: STD-050
title: API and service rules pack
version: 1.0.4
category: reference
status: draft
approver: sh4i-yurei
reviewer: sh4i-yurei
owner: sh4i-yurei
last_updated: 2026-01-13
extends: [STD-004, STD-032]
tags: [rules, api, services, prompts]
---
# Purpose

Define API and service rules for AI-assisted backend changes.

# Scope

Apply when creating or modifying service interfaces, APIs, or request
handling logic.

# Standard

## Governing standards

- [System_Design_Standard](../../04_Design_Framework/System_Design_Standard.md)
- [Module_Design_Standard](../../04_Design_Framework/Module_Design_Standard.md)
- [Technical_Specification_Standard](../../04_Design_Framework/Technical_Specification_Standard.md)
- [Security_and_Threat_Modeling_Standard](../Security_and_Threat_Modeling_Standard.md)
- [Testing_and_Quality_Standard](../Testing_and_Quality_Standard.md)
- [SLI_SLO_Standard](../SLI_SLO_Standard.md)

## 1. Boundaries and ownership

1.1 API boundaries and owners MUST be defined in System or Module
Design artifacts.  
1.2 Changes to public endpoints MUST be linked to specs or ADRs.  
1.3 Do not bypass service boundaries without explicit approval.

## 2. Contracts and versioning

2.1 Use consistent request and response schemas across endpoints.  
2.2 Breaking changes MUST be documented and versioned explicitly.  
2.3 Deprecations MUST include timelines and migration guidance.

## 3. Authentication and authorization

3.1 Auth checks MUST occur at the boundary for every request.  
3.2 Authorization MUST be explicit and least-privilege.  
3.3 Security-sensitive endpoints MUST reference threat models.

## 4. Error handling and idempotency

4.1 Use a canonical error format with stable codes.  
4.2 Map HTTP status codes consistently to error classes.  
4.3 Prefer idempotent operations for retries and safety.

## 5. Validation, limits, and safety

5.1 Validate all inputs at the boundary and reject invalid data.  
5.2 Rate limits and timeouts MUST be defined for public endpoints.  
5.3 Requests MUST include correlation or request IDs for tracing.

## 6. Observability

6.1 Emit metrics for latency, errors, and throughput per endpoint.  
6.2 Log request IDs and error codes without sensitive payloads.  
6.3 Alerts SHOULD map to SLOs and reference runbooks.

## 7. Testing and verification

7.1 Add or update tests for public endpoints and contracts.  
7.2 Contract or integration tests MUST cover breaking changes.  
7.3 Negative cases MUST be included for auth and validation.

## 8. Documentation

8.1 Update API docs or specs for any contract change.  
8.2 Document versioning and deprecation notices in release notes.

# Implementation Notes

- Include this rule pack when API contracts are in scope.
- Keep rules aligned with the System and Module Design artifacts.

# Continuous Improvement and Compliance Metrics

Track API defect rates, contract drift, and incident frequency.

# Compliance

API changes that ignore this rule pack are non-compliant.

# Changelog

- 1.0.4 - Updated links for renamed engineering standards.
- 1.0.3 - Set owner/reviewer/approver values.

- 1.0.2 - Added governing standards links.
- 1.0.1 - Marked draft pending rules index activation.
- 1.0.0 - Promoted to active after review.
- 0.2.0 - Expanded API rules and contract expectations.
- 0.1.0 - Initial draft.
