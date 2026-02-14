---
id: TPL-PRJ-AI
title: AI context pack template
version: 0.2.9
category: project
status: active
owner: sh4i-yurei
reviewer: sh4i-yurei
approver: sh4i-yurei
last_updated: 2026-02-14
extends: [STD-004, STD-032]
tags: [template, ai, context, prompts]
---

# Purpose

Provide a repo-local context pack file for AI-assisted work. Keep it
concise and update when docs change.

# Scope

Use for AI-assisted tasks across planning, design, implementation, and
operations. Save as `AI_CONTEXT.md` at the repo root.

# Standard

## AI context pack template

Use this template to assemble the minimum context required for a task.
Reference this file from AGENTS.md.

## Project summary

- What the project does: <one-liner>
- Current milestone: <text>

## Governing standards to reference

- [System_Design_Standard](../../../04_Design_Framework/System_Design_Standard.md) / [Module_Design_Standard](../../../04_Design_Framework/Module_Design_Standard.md) /
  [Technical_Specification_Standard](../../../04_Design_Framework/Technical_Specification_Standard.md)
- [Coding_Standards_and_Conventions](../../../03_Engineering_Standards/Coding_Standards_and_Conventions.md)
- [Testing_and_Quality_Standard](../../../03_Engineering_Standards/Testing_and_Quality_Standard.md)
- [AI_Assisted_Development_Standard](../../../03_Engineering_Standards/AI_Assisted_Development_Standard.md)

## Rule packs to include

- Select only the rule packs needed for this task.
- Reference the rules index: [rules-index](../../../03_Engineering_Standards/AI_Rules/rules-index.md).

## Skills to invoke

- List repo-local skills to use: <skill names>

## Key files to include

- README sections: <which>
- Architecture/design/spec links: <list>
- ExecPlan and PLANS.md (when required): <links>
- Schema definitions and file boundaries: <links>
- Style/testing guides: <paths>
- Session handoff artifacts (when resuming multi-session work): <links>

## Prompt hygiene

- State goal, constraints, acceptance criteria.
- Include spec excerpts and file targets.
- Ask for uncertainties; no inference.

## Output expectations

- Small diffs, no new deps unless approved.
- Tests added/updated for changed behavior.
- Summaries suitable for PR description.

# Implementation Notes

- Refresh context packs after major design or spec updates.

# Continuous Improvement and Compliance Metrics

- Track rework caused by missing context.

# Compliance

AI work performed without a validated context pack is non-compliant.

# Changelog

- 0.2.9 - Added session handoff artifacts to key files list.
- 0.2.8 - Set owner/reviewer/approver values.
- 0.2.7 - Added owner/reviewer/approver frontmatter fields.

- 0.2.6 - Defined AI_CONTEXT.md as the repo-local context pack file.
- 0.2.5 - Added skills section for context packs.
- 0.2.4 - Added ExecPlan and PLANS.md to key files list.
- 0.2.3 - Removed organizational context reference.
- 0.2.2 - Linked organizational context reference.
- 0.2.1 - Added schema definition references.
- 0.2.0 - Current draft.
