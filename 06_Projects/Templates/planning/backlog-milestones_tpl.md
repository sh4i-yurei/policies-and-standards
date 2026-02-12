---
id: TPL-PRJ-BACKLOG
title: Backlog and milestones template
version: 0.1.3
category: project
status: draft
owner: sh4i-yurei
reviewer: sh4i-yurei
approver: sh4i-yurei
last_updated: 2026-01-13
extends: [STD-001, STD-003]
tags: [template, backlog, milestones, planning]
---
# Purpose

Provide a lightweight backlog and milestone template to track planned
work and delivery sequencing.

# Scope

Use for all governed projects that require more than a single change.

# Standard

## Milestones

- Milestone: <name>
  - Target date: <date>
  - Success criteria: <text>
  - Linked issues/specs: <links>

## Backlog

- Item: <name>
  - Tier: <1|2|3>
  - Owner: <name>
  - Status: <todo|in progress|blocked|done>
  - Links: <issue, spec, ADR>

## Dependencies and sequencing

List dependencies and ordering constraints that affect delivery.

## Notes

Capture decisions, scope changes, or resourcing notes.

# Implementation Notes

- Keep backlog items linked to issues for traceability.
- Review milestones during release planning.
- Align backlog sequencing with [project-roadmap_tpl](project-roadmap_tpl.md).

# Continuous Improvement and Compliance Metrics

- Track cycle time per milestone and backlog churn.

# Compliance

Backlog entries without linked issues are non-compliant.

# Changelog

- 0.1.3 - Set owner/reviewer/approver values.
- 0.1.2 - Added owner/reviewer/approver frontmatter fields.

- 0.1.1 — Added roadmap linkage.
- 0.1.0 — Initial draft.
