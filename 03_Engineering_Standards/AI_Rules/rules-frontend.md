---
id: STD-049
title: Frontend rules pack
version: 1.0.3
category: reference
status: active
approver: sh4i-yurei
reviewer: sh4i-yurei
owner: sh4i-yurei
last_updated: 2026-02-12
extends: [STD-004, STD-032]
tags: [rules, frontend, ui, prompts]
---
# Purpose

Define frontend-specific rules for AI-assisted work without bloating the
global ruleset.

# Scope

Apply when modifying UI, client-side logic, or frontend assets.

# Standard

## Governing standards

- [Coding_Standards_and_Conventions](../Coding_Standards_and_Conventions.md)
- [Testing_and_Quality_Standard](../Testing_and_Quality_Standard.md)
- [Security_and_Threat_Modeling_Standard](../Security_and_Threat_Modeling_Standard.md)
- [Technical_Specification_Standard](../../04_Design_Framework/Technical_Specification_Standard.md)

## 1. UI consistency and structure

1.1 Use the approved design system and component library.  
1.2 Prefer semantic HTML and stable component structure.  
1.3 Avoid duplicated UI logic; extract shared components when reused.

## 2. Accessibility requirements

2.1 Keyboard navigation MUST be supported for all interactive elements.  
2.2 Focus management MUST be explicit for dialogs and page transitions.  
2.3 Color contrast MUST meet WCAG targets defined by the design system.

## 3. State and data flow

3.1 State ownership MUST be clear and scoped to the owning component.  
3.2 Shared state MUST be documented and tested when used across views.  
3.3 Side effects MUST be isolated and recoverable (loading, errors).

## 4. Performance and resilience

4.1 Avoid large bundles; document and justify performance-sensitive
changes.  
4.2 Use code splitting and lazy loading for heavy views when possible.  
4.3 UI changes MUST handle slow or failed network responses gracefully.

## 5. Testing and QA

5.1 Add or update tests for critical user flows and regressions.  
5.2 Update snapshots only when UI intent is explicitly approved.  
5.3 Accessibility checks SHOULD run in CI for UI changes.

## 6. Security and privacy

6.1 Never render untrusted HTML without sanitization.  
6.2 Do not expose secrets or tokens in client code or logs.  
6.3 Redact sensitive data in client-side telemetry.

## 7. Documentation

7.1 Update design or spec artifacts when UI behavior changes.  
7.2 Update release notes for user-visible changes.

# Implementation Notes

- Link this rule pack from the AI context pack when UI work is in scope.
- Keep rules specific to frontend concerns; avoid duplicating global
  standards.

# Continuous Improvement and Compliance Metrics

Track UI regressions, accessibility defects, and test coverage gaps.

# Compliance

Frontend changes that ignore this rule pack are non-compliant.

# Changelog

- 1.0.3 - Set owner/reviewer/approver values.

- 1.0.2 - Added governing standards links.
- 1.0.1 - Marked draft pending rules index activation.
- 1.0.0 - Promoted to active after review.
- 0.2.0 - Expanded frontend rules and testing requirements.
- 0.1.0 - Initial draft.
