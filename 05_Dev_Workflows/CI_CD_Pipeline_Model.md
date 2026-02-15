---
id: STD-030
title: CI/CD Pipeline and Validation Model
version: 1.2.0
category: workflow
status: active
approver: sh4i-yurei
reviewer: sh4i-yurei
owner: sh4i-yurei
last_updated: 2026-02-15
extends:
  - STD-000
  - STD-003
  - STD-006
tags:
  - ci
  - cd
  - validation
  - governance
  - quint
  - ai-assisted-development
---

# Purpose

This document defines the **intended CI/CD pipeline** for this
workspace and explicitly identifies the **tools we will install and
use** to make every code change safe to merge.

This CI/CD model exists to ensure:

- code changes are correct, consistent, and test-validated

- documentation and design-first expectations are enforced

- security and supply-chain risks are detected early

- AI-assisted work is constrained and auditable

- **Quint Code is run for every code change**, preserving reasoning,
  evidence, and decisions in durable, queryable artifacts


This document is written to be usable by:

- the human maintainer, to understand operational expectations

- AI systems, to understand available tools, enforcement boundaries,
  and CI constraints


# Scope

This model applies to all governed repositories unless an explicit
exception is documented and approved.

CI is a **hard gate**:

- if required checks fail, the change MUST NOT merge


This model is consistent with:

- [AI_Assisted_Development_Standard](../03_Engineering_Standards/AI_Assisted_Development_Standard.md)

- [Coding_Standards_and_Conventions](../03_Engineering_Standards/Coding_Standards_and_Conventions.md)

- [Testing_and_Quality_Standard](../03_Engineering_Standards/Testing_and_Quality_Standard.md)

- [Security_and_Threat_Modeling_Standard](../03_Engineering_Standards/Security_and_Threat_Modeling_Standard.md)

- [Release_Management_Policy](../01_Governance/Release_Management_Policy.md)

- [Issue_and_Change_Management_Policy](../01_Governance/Issue_and_Change_Management_Policy.md)

- [git_and_branching_workflow](git_and_branching_workflow.md)

- [Git_Workflow_Checklist](Git_Workflow_Checklist.md)


# Standard

## Non-negotiables

1. No merge on red CI.

2. Every change MUST have traceability (issue or intent) and validation
   evidence.

3. Quint Code MUST be run for every code change, and Quint artifacts
   MUST be updated in the PR.

4. AI MAY assist, but MUST NOT bypass any gate defined here.

5. Local workflows MUST mirror CI to minimize drift.


## CI/CD control plane

### Primary platform

- **GitHub** is the control plane (Issues -> Pull Requests -> Actions ->
  Releases).

- **GitHub Actions** is the CI execution environment.


### CI location

All workflow definitions MUST live under:

`.github/workflows/`

### Branch protection requirements

- Required status checks MUST include all mandatory gates defined here.
- At least one human review is required for merge.
- Direct pushes and force pushes to protected branches are prohibited.
- CODEOWNERS SHOULD be used where ownership is clear.

## Pipeline overview

The pipeline is composed of three enforced tracks:

1. Pull Request Validation (required to merge)

2. Post-merge Validation on `main` (required to keep `main` healthy)

3. Release Validation (manual promotion; no autonomous deploy)


Each track is composed of **validation gates**. Gates are additive and
may evolve, but their responsibilities are stable.

## Validation gates

Each gate defines:

- what it protects

- how enforcement occurs

- what constitutes pass or fail


---

### Gate A - Quint Code Reasoning and Decision Record

**(REQUIRED FOR EVERY CODE CHANGE)**

#### Purpose

Ensure engineering decisions are:

- structured

- evidence-backed

- queryable

- durable across time


Quint Code is the organization's mechanism for preventing \"chat
archaeology\" and ensuring that rationale survives beyond any single
session or tool.

#### The `.quint/` Contract (Intent-First, Layout-Flexible)

Each governed project repository that contains code MUST be initialized
with Quint Code, producing a `.quint/` directory.

For each governed change set, `.quint/` MUST contain durable artifacts
that collectively cover the following **content categories**:

- Context (problem statement, scope, constraints, assumptions)

- Alternatives considered (approaches, hypotheses, tradeoffs)

- Verification (checks against standards, constraints, invariants)

- Validation / Evidence (tests, experiments, outputs, results)

- Audit / Risk notes (bias, confidence, security, reliability concerns)

- Decision (final decision, rationale, tradeoffs, next steps)


**Commitment rule:**
The `.quint/` directory MUST be committed to version control. Do not
add `.quint/` to `.gitignore`. Decision artifacts are durable project
records, not ephemeral working state. Projects that previously
gitignored `.quint/` should remove the gitignore entry and commit
existing artifacts.

**Layout rule:**
The on-disk layout inside `.quint/` MAY vary by Quint version or
repository convention. CI enforces the presence and freshness of
decision and evidence artifacts, not a fixed folder taxonomy.

#### Decision Record (Required)

For each PR that changes code or configuration:

- At least one decision record under `.quint/` MUST be added or updated.


Decision files MAY follow any stable repo convention (e.g., `DRR-*.md`,
`pr-<number>.md`) provided the file clearly corresponds to the PR's
change set.

Decision records SHOULD include:

- what changed

- why it changed

- standards consulted

- evidence gathered

- risks and mitigations

- final decision and next steps


#### Freshness Rule (Hard Gate)

If a PR changes code or configuration, then at least one file under
`.quint/` MUST change in the same PR. Documentation-only changes do not
require Quint artifacts.

#### Enforcement

CI MAY enforce this gate using workflow logic, shell checks, or
repo-local scripts.

Scripts such as `scripts/ci/quint_guard.py` are **recommended
implementations**, not required contract artifacts.

#### Pass / Fail

Gate A passes if:

- `.quint/` exists

- the freshness rule is satisfied

- at least one decision record under `.quint/` changed


---

### Gate B - Documentation Structure and Cross-Reference Validation

**(REQUIRED)**

#### Purpose

Enforce design-first development and prevent undocumented drift.

#### Required Behavior

- required documentation exists (repo-defined)

- Markdown frontmatter exists where required

- required sections and headings are present

- required cross-references to governing standards exist

- spelling validation passes

- cross-reference version consistency validated


#### Tooling

Validation behavior is mandatory. Tool choice is flexible.

Recommended tools include:

- `markdownlint`

- `yamllint`

- `cspell` (spelling validation)

- `validate-version-refs.sh` (cross-reference version consistency)

- repo-local validation scripts where needed


#### Pass / Fail

Fail if required documentation is missing or malformed.

---

### Gate C - Code Style, Formatting, and Static Checks

**(REQUIRED)**

- Enforces linting, formatting, and static analysis

- Default Python tools: `ruff`, `black`, `mypy`

- Fail on any violation


---

### Gate D - Tests

**(REQUIRED)**

- Default Python tool: `pytest`

- Fail on any test failure


---

### Gate E - Configuration and Data Validation

**(REQUIRED WHEN APPLICABLE)**

- YAML and JSON validation

- Schema enforcement where schemas exist

- Fail on invalid configuration


---

### Gate F - Security and Supply-Chain Baseline

**(PHASED IN)**

- Dependabot

- CodeQL

- Secret scanning

- Optional: Trivy, gitleaks, SonarQube


Initially reporting-only; promotion to blocking requires explicit approval.

---

### Gate G - AI Review as Validator

**(PHASED IN)**

AI-assisted review MUST:

- tag findings by severity

- reference applicable standards

- propose concrete fixes where possible


Initially advisory; future blocking behavior must be explicitly governed.

## Pipeline triggers and environments

- Pull request validation runs on all PRs and is required to merge.
- Post-merge validation runs on `main` to keep it releasable.
- Scheduled validation MAY run link checks, security scans, and
  long-running tests.
- Release validation is manual and explicit, per
  [Release_Management_Policy](../01_Governance/Release_Management_Policy.md).

## Gate application matrix

- Code changes: Gates A, B (if docs touched), C, D, and E when
  applicable.
- Documentation-only changes: Gate B plus spelling and link checks.
  Gate A is not required.
- Configuration-only changes: Gate E required; C and D as applicable.
- Release validation: all applicable gates plus release checklist.

## Pull request CI requirements

A PR MUST pass the applicable gates per the matrix above.


## Main branch CI

Post-merge CI ensures `main` remains healthy and releasable. Failures
are treated as defects.

## Release model

Releases are manual and explicit:

- Git tags and GitHub Releases

- No autonomous deploy

- Governed by [Release_Management_Policy](../01_Governance/Release_Management_Policy.md)

- Release readiness MUST be confirmed using
  [release_checklist_tpl](../06_Projects/Templates/release/release_checklist_tpl.md)


## Local workflow alignment

Local development MUST mirror CI using:

- **pre-commit**


Hooks SHOULD align with CI enforcement to minimize drift.

## Pipeline optimization

### Dependency caching

Workflows SHOULD cache dependencies to minimize installation overhead
across runs. Cache keys MUST include a hash of the dependency manifest
(e.g., `pyproject.toml`, `package-lock.json`, `Cargo.lock`) so the
cache invalidates when dependencies change.

Recommended cache paths by language:

| Language | Cache path | Key includes |
|----------|-----------|--------------|
| Python | `~/.cache/pip` | `hashFiles('**/pyproject.toml')` or `hashFiles('**/requirements*.txt')` |
| Node | `~/.npm` | `hashFiles('**/package-lock.json')` |
| Rust | `~/.cargo/registry`, `target/` | `hashFiles('**/Cargo.lock')` |
| Java | `~/.m2/repository` | `hashFiles('**/pom.xml')` |

### Parallel gate execution

Independent validation gates SHOULD run in parallel. Gates A through F
have no inter-gate dependencies and SHOULD execute concurrently within
a single CI run. Gate G (AI review) is currently advisory and MAY run
asynchronously or on a separate schedule, so it is excluded from
these parallelism and performance budget requirements.

Sub-jobs within a gate (e.g., Gate B's markdownlint, yamllint,
link-check, cspell, and version-consistency) SHOULD also run in parallel
unless they share mutable state.

### Conditional gate execution

Gates SHOULD be skipped when their inputs have not changed:

- Gate A: skip for documentation-only changes (already implemented).
- Gate C and D: MAY be skipped only when the diff is limited to
  documentation content (e.g., `docs/**`, `.github/ISSUE_TEMPLATE/**`)
  and/or CI-only non-runtime configuration (e.g., `.github/workflows/**`,
  lint/format configs used only in CI). They MUST NOT be skipped for
  changes to dependency, tooling, or runtime configuration (e.g.,
  `pyproject.toml`, `package.json`, lockfiles, Dockerfiles, or
  application configs).
- Gate F: skip for documentation-only changes.

Conditional execution MUST NOT weaken enforcement — the gate matrix
defines which gates are required for each change type.

### Concurrency control

Workflows SHOULD use concurrency groups to cancel in-progress runs when
a new commit is pushed to the same PR branch. This prevents wasted
compute on superseded commits.

### Performance budget

Pipeline duration SHOULD be tracked and optimized. Target gate durations
for a typical PR:

| Gate | Target | Notes |
|------|--------|-------|
| A (Quint) | < 15s | Shell checks only |
| B (Docs) | < 60s | Link-check is the bottleneck |
| C (Code) | < 30s | Lint and type checking |
| D (Tests) | < 120s | Scales with test suite |
| E (Config) | < 15s | Parse validation only |
| F (Security) | < 300s | CodeQL dominates |

Excessive CI duration undermines developer velocity. If any gate
consistently exceeds its target, investigate and optimize before adding
new checks.

### Build artifacts

Build artifacts SHOULD be produced once and promoted through environments
rather than rebuilt per environment. This ensures the tested artifact is
the deployed artifact.

## Failure handling and exceptions

- Failing a required gate blocks merge.
- Exceptions MUST be documented in an issue labeled
  `workflow-exception`, include rationale, and be time-bound.
- Exception approval MUST be recorded in Quint decision artifacts.

# Implementation Notes

- Tool choices may evolve; enforcement behavior must not.

- Repo-specific CI models SHOULD reference this document rather than
  redefine it.

- This document defines _validation intent_, not CI YAML syntax. Projects
  SHOULD derive their CI definitions from the template at
  [ci_pipeline_tpl](../06_Projects/Templates/ci/ci_pipeline_tpl.md) and keep project-specific
  deviations documented.


# Continuous Improvement and Compliance Metrics

- CI failure rates

- Rework due to missing Quint artifacts

- Security finding trends

- Drift between local and CI behavior


Metrics SHOULD inform incremental refinement of gates and tooling.

# Compliance

Any PR that bypasses, disables, or circumvents required CI gates SHALL
be considered non-compliant and subject to rollback or remediation.

# Changelog

- 1.2.0 - Added pipeline optimization section covering dependency caching, parallel execution, conditional gating, concurrency control, performance budgets, and build artifact promotion.
- 1.1.6 - Added cspell and version-consistency checks to Gate B; added .quint/ commitment rule to Gate A; documented spelling and version-ref validation in required behavior and tooling.
- 1.1.5 - Clarified Quint gating for code changes and removed code-bearing path requirements.
- 1.1.4 - Set owner/reviewer/approver values.

- 1.1.3 - Replaced template paths with KB links.
- 1.1.2 - Linked git workflow references.
- 1.1.1 - Marked active after review.
- 1.1.0 - Expanded triggers, gate matrix, and exception handling.
- 1.0.0 - Initial release.
