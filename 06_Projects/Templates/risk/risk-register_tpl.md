---
id: TPL-PRJ-RISK
title: Risk register template
version: 0.1.2
category: project
status: draft
owner: sh4i-yurei
reviewer: sh4i-yurei
approver: sh4i-yurei
last_updated: 2026-01-13
extends: [STD-001, STD-003, STD-007]
tags: [template, risk, register]
---
# Purpose

Provide a structured risk register to document and track project risks.

# Scope

Use for Tier 2 and Tier 3 projects and for any system with operational or
security exposure.

# Standard

## Risk register

- Risk ID: <id>
  - Description: <text>
  - Category: <security|reliability|delivery|compliance|other>
  - Likelihood: <low|medium|high>
  - Impact: <low|medium|high>
  - Mitigation plan: <text>
  - Owner: <name>
  - Status: <open|monitoring|mitigated|accepted>
  - Review date: <date>

## Risk acceptance

Document accepted risks with rationale and approval reference.

# Implementation Notes

- Review risks at each milestone and before release approval.
- Link risks to issues, ADRs, or specs where applicable.

# Continuous Improvement and Compliance Metrics

- Track risk closure rate and recurrence.

# Compliance

Tier 3 projects without a risk register are non-compliant.

# Changelog

- 0.1.2 - Set owner/reviewer/approver values.
- 0.1.1 - Added owner/reviewer/approver frontmatter fields.

- 0.1.0 — Initial draft.
