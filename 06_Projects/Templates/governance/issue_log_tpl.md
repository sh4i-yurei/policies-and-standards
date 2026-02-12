---
id: TPL-PRJ-ISSUE-LOG
title: Issue log template
version: 0.1.0
category: project
status: active
owner: sh4i-yurei
reviewer: sh4i-yurei
approver: sh4i-yurei
last_updated: 2026-02-12
extends: [STD-001, STD-003]
tags: [template, governance, issues, change-management]
---
# Purpose

Provide a lightweight issue log for governed changes when no external
tracker is used.

# Scope

Use for KB-only issue tracking in governed work. Store as
`01_Governance/KB_Issue_Log.md` when working inside this repository.

# Standard

## Issue log format

Use one entry per issue.

| Issue ID | Date opened | Title | Classification | Status | Owner | Links / Artifacts | Resolution date |
| --- | --- | --- | --- | --- | --- | --- | --- |
| ISSUE-001 | YYYY-MM-DD | <short title> | <Minor/Clarification/Revision/etc> | <Open/In Progress/Closed> | <owner> | <links> | <YYYY-MM-DD> |

## Required fields

- Issue ID (unique)
- Date opened
- Title
- Classification (per [Issue_and_Change_Management_Policy](../../../01_Governance/Issue_and_Change_Management_Policy.md))
- Status
- Owner
- Links to affected documents and decisions
- Resolution date (when closed)

# Implementation Notes

- Keep the log minimal; link to ADRs or Quint decisions when used.
- If you later move to an external tracker, keep this log for historical
  issues or link to the tracker.

# Continuous Improvement and Compliance Metrics

- Track issue count, cycle time, and closure rate.

# Compliance

Governed changes without an issue (or approved intent statement) are
non-compliant.

# Changelog

- 0.1.0 - Initial draft.
