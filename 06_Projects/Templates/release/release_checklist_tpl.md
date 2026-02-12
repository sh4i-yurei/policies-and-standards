---
id: TPL-PRJ-RELEASE
title: Release checklist template
version: 0.1.2
category: project
status: draft
owner: sh4i-yurei
reviewer: sh4i-yurei
approver: sh4i-yurei
last_updated: 2026-01-13
extends: [STD-006, STD-030]
tags: [template, release, checklist]
---

# Purpose

Document a repeatable release process for a project.

# Scope

Use for project-specific releases aligned to
[Release_Management_Policy](../../../01_Governance/Release_Management_Policy.md) and [CI_CD_Pipeline_Model](../../../05_Dev_Workflows/CI_CD_Pipeline_Model.md).

# Standard

## Release checklist template

Align with Release_Management_Policy and CI_CD_Pipeline_Model.

## Release metadata

- Version: <semver>
- Release type: <major|minor|patch>
- Environments: <dev/stage/prod>

## Preconditions

- CI green (lint, tests, checks)
- Quint artifacts updated
- Docs updated (README, specs, runbooks)
- Approvals recorded

## Release steps

1. <step>
2. <step>
3. <step>

## Validation

- Smoke tests: <list>
- Metrics/alerts to watch: <list>
- Data checks: <list>

## Rollback

- Strategy: <revert/tag/feature flag>
- Steps: <ordered>
- Data considerations: <migrations>

## Post-release

- Monitoring window: <duration>
- Issue to record outcomes: <link>
- Follow-ups: <list>

# Implementation Notes

- Capture deviations and approvals inline during release.

# Continuous Improvement and Compliance Metrics

- Track release failures and rollback frequency.

# Compliance

Releases without a completed checklist are non-compliant.

# Changelog

- 0.1.2 - Set owner/reviewer/approver values.
- 0.1.1 - Added owner/reviewer/approver frontmatter fields.

- 0.1.0 - Initial draft.
