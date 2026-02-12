---
id: TPL-PRJ-STYLE
title: Style guide template
version: 0.1.2
category: project
status: draft
owner: sh4i-yurei
reviewer: sh4i-yurei
approver: sh4i-yurei
last_updated: 2026-01-13
extends: [STD-001, STD-005]
tags: [template, style-guide, coding, project]
---
# Purpose

Provide a standard style guide template for governed projects.

# Scope

Use for any project that needs additional style guidance beyond the
coding standard.

# Standard

## Template

### Style guide

Document coding conventions, patterns to prefer or avoid, and
observability expectations for this project. Align with
[Coding_Standards_and_Conventions](../../../03_Engineering_Standards/Coding_Standards_and_Conventions.md).

#### Languages and versions

List languages, runtimes, and formatter or linter versions.

#### Code style

- Naming conventions and file or module layout.
- Function or class size and complexity limits.
- Immutability and state rules.

#### Patterns to prefer

- <example: dependency injection, pure functions>
- <example: typed DTOs for API boundaries>

#### Patterns to avoid

- <example: global state, tight coupling, reflection-based magic>

#### Error handling and logging

- How to represent errors and return codes.
- Logging levels and fields; PII handling rules.
- Tracing or metrics expectations.

#### Dependencies

- Allowed and denied libraries.
- Version pinning strategy.
- Third-party service usage rules.

#### Documentation expectations

- When to comment and what to reference (design, spec, issue).
- Docstring or header comment requirements.

#### Testing expectations

Link to the testing strategy and note coverage targets or suites.

#### Examples

Provide a few short code snippets that demonstrate preferred patterns.

# Implementation Notes

- Keep the style guide short and focused on project-specific decisions.
- Link to shared standards instead of duplicating them.

# Continuous Improvement and Compliance Metrics

Track style violations and rework frequency.

# Compliance

Projects with custom conventions must document them in a style guide.

# Changelog

- 0.1.2 - Set owner/reviewer/approver values.
- 0.1.1 - Added owner/reviewer/approver frontmatter fields.

- 0.1.0 — Initial draft.
