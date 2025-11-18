---
id: STD-005
title: Coding Standards and Conventions
version: 1.0.0
category: core
status: active
last_updated: 2025-11-17
extends: []
tags: [coding, conventions, governance]
owner: AI Standards Council
review_date: 2026-05-01
audience: All developers, Technical Writing GPTs
description: Full codebase standards for modular, maintainable, and AI friendly
  software delivery.
---

# Purpose
This standard defines the required practices for code quality, structure, and
style across all organizational projects. It is optimized for AI tooling,
peer review, and continuous integration enforcement.

# Scope
This document applies to every repository, programming language, and runtime
maintained by the organization. It supersedes team-level conventions unless a
formally approved exception references this standard.

# Standard

## 1. Modularity and Design
1.1 Teams MUST apply SRP, DRY, KISS, and SOLID principles to every module.
1.2 Functions MUST remain at or below ten executable lines and accept no more
than three parameters.
1.3 Classes MUST expose at most seven public members, including properties and
methods.
1.4 Control flow MUST avoid `goto` statements and deeper than three nested
levels.
1.5 Implementations MUST use dependency injection or explicit factories instead
of global state whenever sharing resources.

## 2. Naming Conventions
2.1 Names MUST describe intent rather than type or structure and MUST avoid
Hungarian notation entirely.
2.2 Python identifiers MUST use snake_case, JavaScript identifiers MUST use
camelCase, class names MUST use PascalCase, and constants MUST use
UPPER_SNAKE_CASE.
2.3 Namespaces, packages, and files MUST mirror their primary export or
responsibility to aid searchability.

## 3. Comments and Documentation
3.1 Comments MUST explain intent (the "why") rather than literal implementation.
3.2 All public methods MUST include documentation for parameters, return values,
version tags, and usage examples.
3.3 When architecture is complex, teams MUST include supporting flowcharts or
UML diagrams within the `docs/` tree.
3.4 Doc blocks MUST include an `@version` tag that matches the module release.

## 4. Project Layout
4.1 Source control roots MUST include the folders `src/`, `tests/`, `docs/`,
`scripts/`, and `config/` unless a project charter states otherwise.
4.2 Each folder listed in clause 4.1 MUST contain a `README.md` describing its
purpose and expected artifacts.
4.3 Individual modules MUST remain under 500 lines to support AI code review and
regression analysis.

## 5. Error Handling and Logging
5.1 Code MUST raise typed exceptions that communicate actionable context.
5.2 Logging MUST record contextual identifiers that allow observability systems
to trace events end-to-end.
5.3 Implementations MUST never log credentials, tokens, or other secrets.
5.4 Silent failures are prohibited; any ignored exception MUST be documented
with an explicit rationale and tracking reference.

## 6. Version Control and Continuous Integration
6.1 Branch names MUST follow the `feature/`, `bugfix/`, or `chore/` prefixes.
6.2 Commits MUST follow the `type(scope): description` pattern defined by the
repository governance policy.
6.3 Pull requests MUST include tests, peer review, and links to governing
issues per STD-003.
6.4 CI pipelines MUST run linting, unit tests, and additional verification steps
relevant to the repository technology stack.

## 7. Testing Expectations
7.1 Teams MUST practice test-driven development and maintain tests alongside
feature code.
7.2 Every release MUST include both unit coverage and either integration or
end-to-end coverage.
7.3 Overall coverage MUST remain at or above eighty percent, while critical
paths MUST stay at or above ninety percent.
7.4 Tests MUST be deterministic, isolate external services with mocks, and avoid
network calls unless part of an approved integration suite.

## 8. Dependency Management
8.1 Every dependency MUST be declared explicitly and pinned via lock files or
checksums.
8.2 CI pipelines MUST run security tools such as `pip-audit` or `npm audit` and
track remediation work in issues.
8.3 Transitive dependencies MUST undergo the same review as direct dependencies
and MUST be removed when unused.

## 9. Security Controls
9.1 Implementations MUST enforce least privilege at the process, network, and
code levels.
9.2 Secrets MUST be stored in vault services or other approved secret stores and
NEVER checked into version control.
9.3 Database and API operations MUST use prepared statements or parameterized
queries.
9.4 Inputs MUST be validated, outputs MUST be escaped, and both static (SAST)
and dynamic (DAST) scanning MUST be part of the release process.

## 10. Database Schema Expectations
10.1 Tables MUST use singular names, and columns MUST use snake_case.
10.2 Primary keys SHOULD use UUIDs unless latency or storage constraints require
an alternative, in which case the decision MUST be documented.
10.3 Database migrations MUST be versioned, reversible, and reviewed as part of
normal pull requests.
10.4 ORM layers MUST avoid business logic; complex constraints belong in service
layers or stored procedures with explicit review.

# Implementation Notes

- This document resides in `core/` so that AI tooling and human reviewers can
  reference it as STD-005.
- Teams SHOULD reference this standard from `README.md` files in each project to
  reinforce visibility.
- Additional appendices such as checklists MAY be created under `docs/` but MUST
  reference this standard ID.

# Compliance

- Changes to this document MUST originate from GitHub Issues, adhere to the
  workflow defined in STD-003, and cite reviewer approval in pull requests.
- Before submission, authors MUST run `npx markdownlint "**/*.md"` and
  `npx cspell "**/*.md"`; failures in other documents MUST be documented in the
  PR description.

# Changelog

- 1.0.0 — Initial release authored by the AI Standards Council on 2025-11-17.

Reference: core/coding_standards_and_conventions.md (STD-005)
