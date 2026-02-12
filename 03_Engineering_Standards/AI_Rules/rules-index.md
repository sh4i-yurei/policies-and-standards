---
id: STD-048
title: Rules index
version: 0.2.3
category: reference
status: draft
approver: sh4i-yurei
reviewer: sh4i-yurei
owner: sh4i-yurei
last_updated: 2026-02-11
extends: [STD-004, STD-032]
tags: [rules, prompts, ai, context]
---
# Purpose

Define a modular rules index so AI sessions include only the relevant
rules for the task at hand.

# Scope

Applies to AI-assisted planning, design, implementation, and review
activities across governed projects.

# Standard

## Global rules

Global rules MUST remain lightweight and limited to universal
constraints such as governance boundaries, coding standards, repository
structure, and logging or security baselines.

## Rule packs

Rule packs MUST be stored as standalone Markdown documents and scoped to
specific domains (for example: frontend UI, API design, data pipelines,
operations, deployment). Rule packs SHOULD not duplicate global rules.

## Rule pack registry

Document active rule packs here and link to each pack.

- Frontend rules: [rules-frontend](rules-frontend.md)
- API and service rules: [rules-api](rules-api.md)
- Data and storage rules: [rules-data](rules-data.md)
- Operations and release rules: [rules-operations](rules-operations.md)
- Security and privacy rules: [rules-security](rules-security.md)

## Selection guide

Apply rule packs based on what the change touches:

- Change affects UI rendering, HTML/CSS/JS, or user interaction →
  [rules-frontend](rules-frontend.md)
- Change affects HTTP endpoints, API contracts, or service interfaces →
  [rules-api](rules-api.md)
- Change affects data models, storage, migrations, or ETL →
  [rules-data](rules-data.md)
- Change affects deployment, CI/CD, monitoring, or infrastructure →
  [rules-operations](rules-operations.md)
- Change affects authentication, authorization, secrets, PII, or
  trust boundaries → [rules-security](rules-security.md)

When a change spans multiple domains, apply all matching packs.
Security rules SHOULD be included whenever authentication,
authorization, or sensitive data is in scope, regardless of primary
domain.

If classification is unclear, ask the maintainer before proceeding.

## Usage

- Apply rule packs explicitly by listing them in the AI prompt or
  context pack.
- Include only the global rules plus the rule packs required for the
  current task.
- Avoid loading unrelated rule packs into execution context.
- Reference this index from AI context packs and prompt templates.

# Implementation Notes

- Add new rule packs through the change management process.
- Review rule packs for overlap and remove duplicates.

# Continuous Improvement and Compliance Metrics

Track rule pack usage, conflict frequency, and the number of AI issues
attributable to missing or overloaded rules.

# Compliance

AI sessions that ignore the rules index or load unrelated rule packs are
non-compliant.

# Changelog
- 0.2.3 - Added selection guide with domain-based decision tree.
- 0.2.2 - Set owner/reviewer/approver values.

- 0.2.1 — Added explicit usage guidance for selecting and applying rule packs.
- 0.2.0 — Added starter rule pack links.
- 0.1.0 — Initial draft.
