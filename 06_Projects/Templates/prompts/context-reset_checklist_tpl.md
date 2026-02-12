---
id: TPL-PRJ-CONTEXT-RESET
title: Context reset checklist template
version: 0.1.4
category: project
status: draft
owner: sh4i-yurei
reviewer: sh4i-yurei
approver: sh4i-yurei
last_updated: 2026-02-11
extends: [STD-001, STD-004, STD-032]
tags: [template, context, checklist, ai]
---
# Purpose

Provide a checklist to finalize planning and reset AI context before
execution.

# Scope

Use after planning or design phases and before implementation sessions.

# Standard

## Checklist

- PRD and charter are complete and approved.
- System and module designs are approved (Tier 3 only).
- Technical specification is approved and references tests.
- Schema definitions are linked and approved when contracts change.
- Implementation boundaries and file targets are explicit.
- Rule packs selected using [rules-index](../../../03_Engineering_Standards/AI_Rules/rules-index.md).
- AI context pack updated with current links.
- Command catalog updated for any new repeatable prompts.
- Validation steps and test commands are listed.
- ADRs updated to reflect decisions made during planning and design.
- Execution handoff document created and stored.
- New AI session started with only required context.

## Evidence and links

- PRD: <link>
- Charter: <link>
- Designs: <links>
- Specs: <links>
- Context pack: <link>
- ADRs: <links>
- Command catalog: <link>

# Implementation Notes

- Store the completed checklist with the spec or release artifacts.
- Use this checklist when transitioning between planning and execution.

# Continuous Improvement and Compliance Metrics

Track context reset usage and defects caused by missing handoffs.

# Compliance

Implementation work without a completed context reset is non-compliant.

# Changelog

- 0.1.4 - Added ADR update check and evidence link to checklist.
- 0.1.3 - Set owner/reviewer/approver values.
- 0.1.2 - Added owner/reviewer/approver frontmatter fields.

- 0.1.1 — Added schema definition check.
- 0.1.0 — Initial draft.
