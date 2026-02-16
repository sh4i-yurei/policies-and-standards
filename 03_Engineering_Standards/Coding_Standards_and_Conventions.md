---
id: STD-005
title: Coding Standards and Conventions
version: 1.2.0
category: engineering
status: active
approver: sh4i-yurei
reviewer: sh4i-yurei
owner: sh4i-yurei
last_updated: 2026-02-15
review_date: 2026-05-01
extends: [STD-000]
tags: [coding, conventions, quality, testing, maintainability]
---
# Purpose

This standard defines mandatory coding practices, structural constraints, and quality expectations for all software developed under this governance framework. Its objective is to ensure codebases remain readable, testable, modular, and maintainable over time, regardless of whether code is authored by a human or generated with AI assistance.

# Scope

This standard applies to all source code, test code, and configuration logic developed under governed projects. It applies uniformly across programming languages and runtime environments. This document does not define AI prompting behavior, repository governance, or release procedures.

# Standard

## 1. Design and Modularity

1.1 Code MUST adhere to separation of concerns and the Single Responsibility Principle.  
1.2 Each module MUST encapsulate one primary responsibility and expose minimal, explicit interfaces.  
1.3 Composition MUST be favored over inheritance unless inheritance is explicitly justified.  
1.4 Dependencies MUST be injected explicitly and MUST NOT rely on hidden global state.  
1.5 Cyclic dependencies between modules are prohibited.

## 2. Size and Complexity Constraints

2.1 Functions SHOULD remain concise and readable.  
2.2 Functions SHOULD NOT exceed ten executable lines.  
2.3 Functions MUST NOT accept more than three parameters without
explicit justification recorded in the governing issue per
[Issue_and_Change_Management_Policy](../01_Governance/Issue_and_Change_Management_Policy.md).  
2.4 Classes MUST expose no more than seven public members.  
2.5 Control flow SHOULD avoid nesting deeper than three levels.

## 3. Naming and Structure

3.1 Identifiers MUST describe intent rather than implementation detail.  
3.2 Language-appropriate casing conventions MUST be applied consistently.  
3.3 Files and modules MUST be named after their primary responsibility.  
3.4 Directory structures SHOULD reflect architectural boundaries rather than technical layers.

## 4. Documentation and Commentary

4.1 Comments MUST explain intent and rationale rather than restating behavior.  
4.2 Public interfaces MUST include documentation describing purpose, inputs, outputs, and usage expectations.  
4.3 Complex logic MUST be accompanied by clarifying documentation or references to design artifacts.  
4.4 Comments that describe limitations or workarounds MUST reference a
tracked issue per [Issue_and_Change_Management_Policy](../01_Governance/Issue_and_Change_Management_Policy.md).

## 5. Error Handling and Observability

5.1 Errors MUST be handled explicitly and communicated using structured or typed mechanisms where supported.  
5.2 Silent failures are prohibited.  
5.3 Logging MUST provide sufficient contextual information to support debugging and traceability.  
5.4 Sensitive data MUST NOT be logged under any circumstances.

## 6. Testing Expectations

6.1 Code MUST be testable by design.  
6.2 Tests MUST be maintained alongside production code.  
6.3 Critical paths MUST be covered by deterministic tests.  
6.4 External dependencies MUST be isolated using mocks or stubs where appropriate.  
6.5 Tests SHOULD serve as executable specifications of intended behavior.

## 7. Version Control and Integration Discipline

7.1 Code changes MUST be incremental and reviewable.  
7.2 Commits SHOULD be small, focused, and traceable to a governing issue
per [Issue_and_Change_Management_Policy](../01_Governance/Issue_and_Change_Management_Policy.md).  
7.3 Automated validation SHOULD enforce linting, testing, and static analysis.  
7.4 Code that fails validation MUST NOT be merged or released.

## 8. Dependency Management

8.1 Every project MUST commit a lockfile (e.g., `package-lock.json`,
`Cargo.lock`, `poetry.lock`, `go.sum`) that pins exact resolved
versions. Lockfiles MUST NOT be gitignored.
8.2 Dependency manifests SHOULD pin to the narrowest version range that
satisfies requirements (e.g., exact version or tilde range rather than
wildcard).
8.3 Security updates (CVEs, advisories) MUST be applied within 7
calendar days of disclosure for critical/high severity and within 30
days for medium/low severity.
8.4 Feature and minor version updates SHOULD be reviewed and applied at
least monthly. Major version upgrades require an assessed migration plan
documented in the governing issue.
8.5 Projects SHOULD enable automated dependency update tooling
(Dependabot, Renovate, or equivalent). Configuration SHOULD:

- group minor and patch updates to reduce PR noise
- auto-merge patch updates that pass CI when confidence is high
- require manual review for major version bumps

8.6 Breaking changes introduced by dependency updates MUST be caught by
existing tests. If a dependency upgrade causes test failures, the
upgrade MUST NOT be merged until the failures are resolved.
8.7 Unused dependencies MUST be removed promptly. Dependency audits
SHOULD be performed as part of periodic housekeeping.

## 9. Relationship to AI-Assisted Development

9.1 These coding standards apply equally to human-authored and AI-generated code.
9.2 AI-assisted code generation MUST comply with this standard and with [AI_Assisted_Development_Standard](AI_Assisted_Development_Standard.md).
9.3 Violations introduced by AI-generated code SHALL be treated as implementation defects, not tooling errors.

# Implementation Notes

- Language-specific conventions MAY be documented as extensions to this standard.

- Tooling MAY be used to enforce size, complexity, and formatting constraints.

- This standard intentionally avoids prescribing specific languages, frameworks, or tools.


# Continuous Improvement and Compliance Metrics

10.1 Metrics MAY include defect density, test coverage trends, and refactor frequency.
10.2 Findings SHOULD inform refinements to standards and development practices.

# Compliance

Any code that violates this standard SHALL be considered non-compliant and subject to revision or rejection prior to release.

# Changelog

- 1.2.0 - Added dependency management section (8): lockfile policy,
  update cadence, automated tooling guidance, and breaking change
  handling.
- 1.1.2 - Added traceability links for justification and issue tracking.
- 1.1.1 - Set owner/reviewer/approver values.

- 1.1.0 — Formatting corrected to align with STD-001 and clarified separation of concerns.

- 1.0.0 — Initial release.
