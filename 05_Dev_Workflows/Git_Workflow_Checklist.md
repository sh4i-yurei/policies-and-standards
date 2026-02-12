---
id: STD-042
title: Git Workflow Checklist
version: 0.1.8
category: workflow
status: active
approver: sh4i-yurei
reviewer: sh4i-yurei
owner: sh4i-yurei
last_updated: 2026-02-12
extends: [STD-031, STD-030, STD-033]
tags: [git, checklist, workflow, governance]
---
# Purpose

Provide a quick checklist to validate branches and pull requests comply
with the governed git and CI/CD workflow.

# Scope

Use for all pull requests under this governance model. This checklist
is derived from [git_and_branching_workflow](git_and_branching_workflow.md).

# Standard

- Branch created from `main` and follows `<type>/<name>` naming.
- Follow [git_and_branching_workflow](git_and_branching_workflow.md) for branch and PR rules.
- Linked issue or intent statement included.
- Applicable design/spec referenced (Tier 2/3 as required).
- Required tests and lint run locally.
- Quint artifacts updated for code changes.
- CI green (lint, tests, checks).
- PR description includes AI-assistance summary (if used).
- Required reviewers/approvals obtained.
- Merge strategy: squash; no direct pushes to `main`.

## Implementation review (AI-assisted)

- AI output aligns with the approved design/spec and stays in scope.
- `AI_CONTEXT.md` is current for the changes and linked in the PR when required.
- ExecPlan exists and is current when required by `PLANS.md`.
- Public interfaces and schemas changed only when explicitly approved.
- Security-sensitive changes reviewed against
  [Security_and_Threat_Modeling_Standard](../03_Engineering_Standards/Security_and_Threat_Modeling_Standard.md).
- Data changes aligned with [Data_Management_Standard](../03_Engineering_Standards/Data_Management_Standard.md) and
  [schema-definition-standard](../04_Design_Framework/schema-definition-standard.md) when applicable.
- New dependencies or build/tooling changes are intentional and
  documented.
- Tests added or updated for critical paths and edge cases introduced.
  If no tests are added, rationale is documented.

# Implementation Notes

- Use this checklist as a release gate for all PRs.
- Document exceptions in the PR description and link approvals.

# Continuous Improvement and Compliance Metrics

Track checklist failures and CI rejects to refine guidance.

# Compliance

PRs that do not satisfy this checklist are non-compliant and should not
merge.

# Changelog

- 0.1.8 - Clarified Quint requirement applies to code changes.
- 0.1.7 - Updated links for renamed engineering standards.
- 0.1.6 - Set owner/reviewer/approver values.

- 0.1.5 - Added workflow derivation note.
- 0.1.4 - Added AI context pack currency check.
- 0.1.3 - Added ExecPlan check for AI-assisted implementations.
- 0.1.2 - Added AI-assisted implementation review section.
- 0.1.1 - Linked git and branching workflow.
- 0.1.0 - Initial draft checklist.
