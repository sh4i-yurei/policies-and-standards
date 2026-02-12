---
id: TPL-PRJ-CHARTER
title: Project charter template
version: 0.2.6
category: project
status: active
owner: sh4i-yurei
reviewer: sh4i-yurei
approver: sh4i-yurei
last_updated: 2026-02-12
extends: [STD-001, STD-032]
tags: [template, project, charter]
---

# Purpose

Anchor scope, goals, and constraints before design and implementation.

# Scope

Use for Tier 2 and Tier 3 work per [SDLC_With_AI](../../../05_Dev_Workflows/SDLC_With_AI.md).

# Standard

## Project charter template

Capture charter details before drafting system or module designs.

## Charter details

- Project name: <name>
- Owner/decision maker: <name/contact>
- Stakeholders: <list>
- Initial change tier: Tier 2 | Tier 3

## Design governance and approvals

- Design owner and primary approver: <name>
- Required stakeholder sign-offs: <product | engineering | security | ops>
- Escalation path and amendment process: <process>

## Problem statement

What problem are we solving and why now?

## Goals and outcomes

List measurable goals and success criteria.

## Non-goals and exclusions

Clarify what is intentionally out of scope.

## Constraints and assumptions

Technical, organizational, timeline, budget, or compliance constraints.
List key assumptions.

## Risks and mitigations

Top risks with planned mitigations or follow-ups. Link to
[risk-register_tpl](../risk/risk-register_tpl.md) when risks are tracked separately.

## Next steps

- Required design artifacts
- Issues to open
- Target milestones

## Links

- Originating issue or request: <link>
- PRD: [requirements-prd_tpl](../planning/requirements-prd_tpl.md)
- Project roadmap: [project-roadmap_tpl](../planning/project-roadmap_tpl.md)
- Governing standards: [System_Design_Standard](../../../04_Design_Framework/System_Design_Standard.md),
  [Issue_and_Change_Management_Policy](../../../01_Governance/Issue_and_Change_Management_Policy.md)

# Implementation Notes

- Update the charter when scope or ownership changes.

# Continuous Improvement and Compliance Metrics

- Track charter changes and scope drift.

# Compliance

Projects without a charter are non-compliant for Tier 2 and Tier 3.

# Changelog

- 0.2.6 - Set owner/reviewer/approver values.
- 0.2.5 - Added owner/reviewer/approver frontmatter fields.

- 0.2.4 - Replaced placeholder standard reference.
- 0.2.3 - Added design governance and approval section.
- 0.2.2 - Linked risk register template.
- 0.2.1 - Added PRD and roadmap links.
- 0.2.0 - Added structured sections and placeholders.
- 0.1.0 - Initial draft.
