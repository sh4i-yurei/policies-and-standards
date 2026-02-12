---
id: STD-033
title: Documentation change workflow
version: 1.0.1
category: workflow
status: active
approver: sh4i-yurei
reviewer: sh4i-yurei
owner: sh4i-yurei
last_updated: 2026-02-12
extends: [STD-001, STD-003]
tags: [documentation, workflow, governance]
---

# Purpose

Define the workflow for governed documentation updates.

# Scope

Applies to all KB documents and templates under governance.

# Standard

## 1. Change classification

- Editorial: spelling, formatting, or clarity changes with no change in
  meaning.
- Minor: adds detail or examples without changing policy intent.
- Major: changes policy meaning, required behavior, or structure.

## 2. Workflow steps

1. Open or link an issue for the change.
2. Classify the change (editorial, minor, major).
3. Update documentation in scope and update cross-references.
4. Validate structure, spelling, and links.
5. Record review and approval.
6. Update changelog and version metadata as required.

## 3. Documentation gates

- Frontmatter valid and complete.
- Required sections present (STD-001).
- Links and references updated.
- Changelog updated when meaning changes.
- Version increment applied when required.
- Spelling and link checks run for any modified file.

## Definition of done

- Issue linked and resolved.
- Validation checks complete.
- Changes approved and recorded.
- Version updated when required.

## Links

- [Documentation_Standard](../02_Documentation_Standards/Documentation_Standard.md)
- [Issue_and_Change_Management_Policy](../01_Governance/Issue_and_Change_Management_Policy.md)
- [CI_CD_Pipeline_Model](CI_CD_Pipeline_Model.md)
- [SDLC_With_AI](SDLC_With_AI.md)

# Implementation Notes

- Use markdownlint, cspell, and link checks where applicable.
- Keep changes scoped to the originating issue.
- Documentation-only changes still require explicit approval.
- Documentation gates SHOULD run in CI for each documentation change.
- Versioning guidance: patch for minor clarifications, minor for new
  sections or material additions, major for structural or breaking
  changes.

# Continuous Improvement and Compliance Metrics

- Track documentation errors, rework frequency, and broken-link rates.
- Use findings to improve templates and guidance.

# Compliance

Documentation changes that bypass this workflow are non-compliant.

# Changelog
- 1.0.1 - Set owner/reviewer/approver values.

- 1.0.0 - Activated after review and workflow consolidation.
- 0.3.0 - Added classification and expanded gates.
- 0.2.1 - Added CI and versioning guidance.
- 0.2.0 - Expanded steps, gates, and versioning rules.
- 0.1.0 - Initial draft.
