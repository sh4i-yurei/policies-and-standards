title: Coding Standards and Conventions
status: active
version: 1.0
owner: AI Standards Council
review_date: 2026-05-01
audience: All developers, Technical Writing GPTs
description: Full-codebase standards for modular, maintainable, and AI-compatible code development across all projects.
-----------------------------------------------------------------------------------------------------------------------

1. Purpose
   Defines enforced standards for code quality, structure, and style. Optimized for AI tooling and CI enforcement.

2. Scope
   Applies to all projects, all languages. Overrides team-specific conventions unless otherwise documented.

3. Standard

###Instruction###
As a documenting agent (AI or human), follow these standards when writing/reviewing code, generating documentation, or integrating with AI tools.

3.1 Modularity & Design

* Apply SRP, DRY, KISS, SOLID
* Functions ≤10 LOC, ≤3 parameters
* Classes ≤7 public members
* No GOTO or deep nesting (>3 levels)
* Use dependency injection; avoid global state

3.2 Naming

* Descriptive names only
* snake_case (Python), camelCase (JavaScript), PascalCase (classes), UPPER_SNAKE_CASE (constants)
* No Hungarian notation

3.3 Comments & Docs

* Explain intent (why), not implementation (what)
* Public methods require: param, return, version, usage
* Include flowcharts or UML where needed
* Use @version in docblocks

3.4 Project Layout

* Use standard folders: src/, tests/, docs/, scripts/, config/
* Each folder has README.md
* Keep modules <500 LOC

3.5 Error Handling & Logging

* Raise typed exceptions
* Log context and traceable identifiers
* No silent fails
* Never log secrets

3.6 Version Control & CI

* Branch names: feature/, bugfix/, chore/
* Commits: type(scope): description
* PRs require tests and peer review
* CI must run lint and test pipelines

3.7 Testing

* TDD mandatory
* Require unit + integration or E2E
* ≥80% coverage (critical paths ≥90%)
* Tests must be deterministic
* Mock external systems

3.8 Dependencies

* All dependencies declared and pinned
* Lockfiles enforced
* Tools like pip-audit or npm audit run in CI

3.9 Security

* Enforce least privilege
* Use secrets vaults
* Prepared statements only
* Validate inputs, escape outputs
* SAST/DAST required

3.10 Database Schema

* Use singular table names
* snake_case for columns
* Prefer UUIDs as primary keys
* Version migrations
* Avoid logic in ORM models
  ###EndInstruction###

4. Implementation Guidance
   File must be root-level for ingestion by Aider. Use markdownlint and cspell before PR.

5. Enforcement
   All rules enforceable via linters, CI jobs, or GitHub review automation.

6. Revision History

* 1.0 — Initial release, 2025-11-17 — AI Standards Council

