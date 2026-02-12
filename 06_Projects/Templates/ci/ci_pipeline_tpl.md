---
id: TPL-PRJ-CI
title: CI pipeline template
version: 0.1.2
category: project
status: draft
owner: sh4i-yurei
reviewer: sh4i-yurei
approver: sh4i-yurei
last_updated: 2026-01-13
extends: [STD-030, STD-032]
tags: [template, ci, pipeline, workflow]
---

# Purpose

Provide a template for documenting project-specific CI pipeline stages
and required checks.

# Scope

Use when a project needs additional CI detail or an approved deviation.
Otherwise rely on [CI_CD_Pipeline_Model](../../../05_Dev_Workflows/CI_CD_Pipeline_Model.md).

# Standard

## CI pipeline template

Align with [CI_CD_Pipeline_Model](../../../05_Dev_Workflows/CI_CD_Pipeline_Model.md) and [SDLC_With_AI](../../../05_Dev_Workflows/SDLC_With_AI.md).

## Scope

- Repository: <name>
- Branch protections: <rules>
- Required checks: <list>

## Stages

- Lint/format: <tools/commands>
- Tests: <unit/integration/e2e> (commands)
- Build/package: <commands/artifacts>
- Security/baseline: <dependency scan, SAST, secret scan>
- Docs/link checks: <commands>
- Deploy/publish (if applicable): <commands/targets>
- Reference shared CI templates where possible; project-specific steps
  SHOULD be minimal and documented.

## Artifacts and caching

- Artifacts to upload: <list>
- Cache strategy: <paths/keys>

## Failure handling

- Retry rules: <if any>
- Quarantine/flaky test policy: define when to retry vs. quarantine,
  where quarantine lists live, and how fixes are tracked/scheduled.

## Notes

- Trigger rules (PR/push/schedule): <details>
- Secrets and tokens required: <list, scope, injection method>; use
  least privilege and avoid long-lived credentials.
- Metrics to watch: pipeline duration, failure rate, flaky-test count;
  use these to refine stages and caching.

## Usage

- Default to the organization CI standard in [CI_CD_Pipeline_Model](../../../05_Dev_Workflows/CI_CD_Pipeline_Model.md);
  create a project-specific CI doc only when special instructions or
  approved deviations are required.
- Record any deviations explicitly: what differs, why, and how the
  standard's gates remain satisfied.
- Prefer shared CI templates; keep project-specific steps minimal and
  documented.

# Implementation Notes

- Keep project-specific CI docs short and focused on deviations.

# Continuous Improvement and Compliance Metrics

- Track pipeline reliability and false-positive rates.

# Compliance

CI pipelines that bypass required gates are non-compliant.

# Changelog

- 0.1.2 - Set owner/reviewer/approver values.
- 0.1.1 - Added owner/reviewer/approver frontmatter fields.

- 0.1.0 - Initial draft.
