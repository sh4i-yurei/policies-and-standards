---
id: STD-015
title: Onboarding guide
version: 1.1.1
category: orientation
status: active
approver: sh4i-yurei
reviewer: sh4i-yurei
owner: sh4i-yurei
last_updated: 2026-02-12
extends: [STD-010, STD-013]
tags: [onboarding, orientation, quickstart]
---
# Purpose

Give a quick start path for new contributors (or future you) so the
first hour is clear and aligned to the governed workflow.

# Scope

Applies to anyone onboarding to this knowledgebase or its governed
projects. Optional for solo, recommended for team or public use.

# Standard

## Orientation reading path

New contributors (or future you returning after a break) should read the
following documents in order to build context:

1. [Mission_Statement](Mission_Statement.md) — why this practice exists.
2. [Core_Principles](Core_Principles.md) — values that shape decisions.
3. [Vision_and_Long_Term_Goals](Vision_and_Long_Term_Goals.md) — where the practice is headed.
4. [Terminology](Terminology.md) — shared vocabulary.
5. [Documentation_Standard](../02_Documentation_Standards/Documentation_Standard.md) — how knowledge is structured.
6. [Pipeline_Phases_Overview](Pipeline_Phases_Overview.md) — at-a-glance delivery pipeline.
7. [SDLC_With_AI](../05_Dev_Workflows/SDLC_With_AI.md) — the authoritative AI-assisted workflow.
8. [project_repo_initialization_workflow](../05_Dev_Workflows/project_repo_initialization_workflow.md) — how new repos are set up.

## Tooling and environment

Approved tools and their roles are defined in [Tooling_Inventory](../03_Engineering_Standards/Tooling_Inventory.md).
Environment expectations for governed repositories are documented in
each project's AGENTS.md and README per
[project_repo_initialization_workflow](../05_Dev_Workflows/project_repo_initialization_workflow.md).

## First session expectations

For a new project, follow the Initiation stage in [SDLC_With_AI](../05_Dev_Workflows/SDLC_With_AI.md) and
set up the repository using [project_repo_initialization_workflow](../05_Dev_Workflows/project_repo_initialization_workflow.md).

For an existing project, start by reading the project README, AGENTS.md,
and AI_CONTEXT.md. Review the current charter or active design and spec
artifacts, then check the backlog for open issues.

AI-assisted sessions can use the repo-orientation skill (defined in
[repo_orientation_skill_tpl](../06_Projects/Templates/ai/repo_orientation_skill_tpl.md) and stored at
`.claude/skills/repo-orientation/SKILL.md`) to automate context
discovery.

# Implementation Notes

- This guide is descriptive and serves as the primary KB entry point.
- Update reading path when new orientation or governance docs are added.

# Continuous Improvement and Compliance Metrics

Track onboarding friction and time-to-first-PR; update this guide when
steps change or new blockers appear.

# Compliance

Onboarding guides should be reviewed when workflows or toolchains
change.

# Changelog

- 1.1.1 - Expanded first session expectations for new and existing
  projects; linked repo-orientation skill template.
- 1.1.0 - Reframed as descriptive orientation; added pipeline overview,
  tooling reference, and structured reading path.
- 1.0.6 - Normalized filename and updated orientation link.
- 1.0.5 - Set owner/reviewer/approver values.

- 1.0.4 - Removed non-KB roadmap reference.
- 1.0.3 - Added explicit links for orientation flow and roadmap.
- 1.0.2 - Linked repo initialization workflow and updated reading path.
- 1.0.1 - Added standard frontmatter and aligned formatting.
- 1.0.0 - Initial draft.
