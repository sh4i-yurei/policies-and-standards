---
id: TPL-PRJ-CHARTER-T1
title: Project charter template (Tier 1 mini-spec)
version: 0.1.0
category: project
status: active
owner: sh4i-yurei
reviewer: sh4i-yurei
approver: sh4i-yurei
last_updated: 2026-02-25
extends: [STD-001, STD-032]
tags: [template, project, charter, tier-1]
---

# Purpose

One-page mini-spec for changes too big for no-spec but too small for a
full Charter. Use for Tier 1 work that crosses multiple files or has
non-obvious risk.

# Scope

Use when a change is larger than a single-file hotfix but does not
warrant a full [Tier 2 Charter](project_charter_tpl.md).

# Standard

## Mini-spec

- **Change**: \<one-sentence description of what changes\>
- **Why now**: \<why this needs to happen\>
- **Affected files**: \<list of files/modules that will be modified\>

## Acceptance criteria

- WHEN: \<condition or action\>
  THEN: \<observable, verifiable result\>

## Risk

\<one sentence on what could go wrong and the rollback plan\>

## Links

- Issue: \<link\>
- Related: \<ADR, Charter, or PR if applicable\>

# Implementation Notes

- Keep this document to one page. If it grows beyond that, upgrade to
  a [Tier 2 Charter](project_charter_tpl.md).

# Continuous Improvement and Compliance Metrics

- Track tier escalation frequency (T1 → T2 upgrades).

# Compliance

Tier 1 changes with cross-file impact SHOULD have a mini-spec.

# Changelog

- 0.1.0 - Initial draft.
