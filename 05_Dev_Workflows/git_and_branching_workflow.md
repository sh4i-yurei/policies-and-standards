---
id: STD-031
title: Git and Branching Workflow
version: 1.0.4
category: workflow
status: active
approver: sh4i-yurei
reviewer: sh4i-yurei
owner: sh4i-yurei
last_updated: 2026-02-12
extends:
  - STD-000
  - STD-003
  - STD-006
  - STD-010
tags:
  - git
  - branching
  - workflow
  - version-control
  - governance
  - ai-assisted-development
  - quint
---

# Purpose

This document defines the **mandatory Git and branching workflow** for all governed repositories.

Its purpose is to ensure that:

- all changes are traceable, reviewable, and reversible

- CI enforcement is deterministic and meaningful

- Quint Code reasoning artifacts remain aligned with Git history

- AI-assisted contributions are constrained, auditable, and reviewable

- merge and release authority remain explicit and human-controlled


This workflow is designed for a **solo maintainer using AI automation**, while remaining compatible with future human collaboration.

# Scope

This workflow applies to all governed repositories unless an explicit exception is documented and approved.

It governs:

- branch structure and naming

- commit and pull request expectations

- review and approval rules

- merge strategies

- interaction with CI, Quint Code, and release processes


This document does **not** define CI implementation details or Git tooling configuration.

This workflow operates within the broader SDLC defined in
[SDLC_With_AI](SDLC_With_AI.md).

# Standard

## Core Principles

1. The default branch represents the **authoritative state** of the repository.

2. All meaningful changes flow through **pull requests**.

3. CI validation is a **hard gate** to merge.

4. Branches are **short-lived and purpose-specific**.

5. Merge authority resides with the **maintainer**, not automation.

6. Git history MUST preserve **intent and traceability**, not just code deltas.


## Branch Model Overview

This workspace uses a **single-trunk, pull-request-based workflow**.

### Long-Lived Branches

#### `main` (or equivalent default branch)

- Represents the authoritative, releasable state

- Protected by branch protection rules

- Direct commits are prohibited

- All merges require passing CI and maintainer approval


Branch protection rules MUST enforce:

- **all required CI status checks passing**

- **explicit maintainer approval prior to merge**

- **a linear history**

- **squash-only merges, with merge commits and rebase merges disabled**


When human collaborators exist, repository settings SHOULD allow collaborator reviews on pull requests.

No other long-lived branches are permitted unless explicitly approved.

### Short-Lived Branches

All work occurs on short-lived branches created from `main`.

Allowed branch categories:

- `feature/` — new functionality or behavior

- `fix/` — bug fixes or corrections

- `chore/` — maintenance or refactors

- `docs/` — documentation-only changes


Branch names MUST follow:

`<type>/<short-descriptive-name>`

Examples:

- `feature/quint-ci-gate`

- `fix/decision-record-validation`

- `docs/git-workflow`


## Work Initiation and Traceability

### Issue Linkage

Pull requests MUST link to an originating issue when one exists.

When no issue exists, the pull request description MUST include a short  
**Intent Statement** consisting of **1–2 sentences** that clearly state:

- what is being changed, and

- why the change is being made.


### Branch Creation

Branches MUST be created from the current `main` branch.

Branch names SHOULD reference the originating issue, standard, or intent where applicable.

If a branch diverges significantly from its original scope, it SHOULD be closed and replaced with a new branch created from `main` with updated traceability.

## Commits

### Commit Discipline

Commits SHOULD be:

- small

- focused

- logically coherent


Commits MUST NOT mix unrelated concerns.

### Commit Messages

Commit messages SHOULD describe **intent**, not mechanics.

Commits MAY reference issues or Quint decision records, but commits do **not** replace Quint artifacts.

## Pull Requests (Mandatory)

All changes MUST be introduced via pull requests.

### Pull Request Requirements

A pull request MUST:

- target `main`

- pass all required CI gates

- include updated Quint artifacts when code changes

- include links to:

  - the originating issue (when one exists), and

  - the relevant Quint decision record(s)


### Pull Request Scope

Pull requests SHOULD remain narrowly scoped.

Unusually large pull requests (for example, many files changed, large diffs, or multiple concerns) require explicit justification in the PR description.

## AI-Assisted Contributions

AI-assisted code generation and refactoring are permitted.

When AI generates or substantially modifies code, the pull request description MUST summarize:

- what content was AI-generated or AI-assisted

- how the output was validated (tests run, Quint updates, manual inspection)


AI tools and automation:

- MUST follow the same branch naming and PR workflow

- MUST NOT push directly to `main`

- MUST NOT bypass CI, maintainer approval, or Quint requirements


AI systems MAY comment, analyze, or suggest changes, but **MUST NOT approve, merge, or release**.

## CI Interaction

CI runs automatically on pull requests and enforces validation gates
defined in the [CI_CD_Pipeline_Model](CI_CD_Pipeline_Model.md).

Quint freshness rules are defined and enforced by that model; compliance is mandatory for every pull request.

A pull request MUST NOT be merged if:

- any required CI gate fails

- Quint freshness rules are violated

- required documentation or decision records are missing


## Review and Approval

Each pull request MUST receive **explicit maintainer approval** prior to merge.

Maintainer approval MUST be recorded in one of the following ways:

- a GitHub pull request review marked as **Approved** (preferred), or

- a documented approval or checklist comment confirming that required checks  
    (CI, Quint artifacts, required links) have been satisfied

In a solo practice, approval MUST still be explicit and recorded, and MAY be
time-shifted to the next working session as defined in [SDLC_With_AI](SDLC_With_AI.md).


Human collaborators MAY review pull requests and provide feedback; their reviews inform the maintainer’s approval decision.

For operational guidance, reviewers and automation SHOULD reference:

- [Git_Workflow_Checklist](Git_Workflow_Checklist.md)


## Label taxonomy (canonical)

The following labels are the authoritative workflow labels for governed
repositories.

- `workflow-exception` - approved deviation from a governed workflow,
  time-bound and documented in the issue and Quint artifacts.
- `merge-strategy/override` - explicit approval to use a non-squash
  merge strategy, documented in the pull request.

## Merge Strategy

### Required Strategy: Squash Merge

The required merge strategy is **squash merge**.

For governed repositories:

- GitHub’s **Squash and merge** option MUST be enabled

- merge commits and rebase merges MUST be disabled

- branch protection MUST require a linear history


Squash commit messages SHOULD summarize intent and MAY follow:

`<type>: <short summary> — refs <issue-id> / <decision-id>`

### Exceptions

Non-squash merges are permitted only in exceptional cases and MUST:

- include documented rationale in the pull request body

- be labeled `merge-strategy/override` for auditability


## Post-Merge Expectations

After merge:

- `main` MUST remain green

- regressions are treated as defects

- corrective changes follow this same workflow


## Relationship to Releases

Merging to `main` does not imply release.

Releases are manual, explicit, and governed by [Release_Management_Policy](../01_Governance/Release_Management_Policy.md).

## Automation Hooks

Automation MAY assist with:

- creating branches

- suggesting commit messages

- opening pull requests


All automation MUST respect:

- branch naming rules

- the prohibition on direct pushes to `main`

- the requirement that all meaningful changes flow through pull requests with CI


Automation SHALL NOT be granted merge or release authority.

# Implementation Notes

- Branch protection rules are a required enforcement mechanism.

- Tooling MAY evolve; workflow intent MUST remain stable.

- Repo-specific conventions MAY extend this workflow but MUST not conflict with it.


# Continuous Improvement and Compliance Metrics

Metrics MAY include:

- pull request lead time

- CI failure rates

- frequency of reverts

- average pull request size


# Compliance

Any change that bypasses this workflow SHALL be considered non-compliant and subject to remediation or rollback.

# Changelog

- 1.0.4 - Added SDLC cross-reference in Scope section.
- 1.0.3 - Clarified Quint requirement applies to code changes.
- 1.0.2 - Added label taxonomy and CI/CD model link.
- 1.0.1 - Set owner/reviewer/approver values.

- **1.0.0 — Initial release**
