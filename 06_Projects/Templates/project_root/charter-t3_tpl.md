---
id: TPL-PRJ-CHARTER-T3
title: Project charter template (Tier 3 comprehensive)
version: 0.1.0
category: project
status: active
owner: sh4i-yurei
reviewer: sh4i-yurei
approver: sh4i-yurei
last_updated: 2026-02-25
extends: [STD-001, STD-032, STD-020]
tags: [template, project, charter, tier-3]
---

# Purpose

Comprehensive charter for Tier 3 projects requiring full design
governance, formal risk assessment, and multi-phase planning.

# Scope

Use for Tier 3 work per [SDLC_With_AI](../../../05_Dev_Workflows/SDLC_With_AI.md).
See also: [Tier 1 Charter](charter-t1_tpl.md) (mini-spec) and
[Tier 2 Charter](project_charter_tpl.md) (standard).

# Standard

## Project charter template (Tier 3)

## Charter details

- Project name: \<name\>
- Owner/decision maker: \<name/contact\>
- Stakeholders: \<list\>
- Initial change tier: Tier 3

## Design governance and approvals

- Design owner and primary approver: \<name\>
- Required stakeholder sign-offs: \<product | engineering | security | ops\>
- Escalation path and amendment process: \<process\>
- Design artifacts required: system design, module designs, technical specs

## Problem statement

What problem are we solving and why now? Include evidence of the
problem (metrics, user feedback, incidents).

## Goals and outcomes

List measurable goals and success criteria with quantifiable targets.

## Acceptance criteria

Testable conditions for project success. Use WHEN/THEN format:

- WHEN: \<condition or action\>
  THEN: \<observable, verifiable result\>

## Non-goals and exclusions

Clarify what is intentionally out of scope and why.

## Constraints and assumptions

Technical, organizational, timeline, budget, or compliance constraints.
List key assumptions with validation plans.

## Risk assessment

### Risk table

| Risk | Likelihood | Impact | Mitigation | Owner |
|------|-----------|--------|------------|-------|
| \<risk\> | High/Med/Low | High/Med/Low | \<mitigation\> | \<owner\> |

Link to [risk-register_tpl](../risk/risk-register_tpl.md) for ongoing
tracking.

### Threat model reference

Link to threat model per
[Security_and_Threat_Modeling_Standard](../../../03_Engineering_Standards/Security_and_Threat_Modeling_Standard.md)
if the project handles auth, user data, or external integrations.

## Architecture decisions

Reference existing ADRs or note decisions that need ADRs:

- ADR-\<NNN\>: \<title\> (status: \<accepted | proposed\>)

See [adr_tpl](../architecture/adr_tpl.md) for the ADR template.

## Evaluation criteria

How will the project be judged at each phase gate?

| Phase | Criteria | Evidence |
|-------|----------|----------|
| POC | \<what proves feasibility\> | \<demo, benchmark, spike\> |
| MVP | \<what proves value\> | \<tests pass, user feedback\> |
| Polish | \<what proves production-readiness\> | \<perf targets, security audit\> |

## Decomposition

Break the project into workstreams or modules. Link to ExecPlans for
each:

1. \<workstream 1\> — ExecPlan: \<link\>
2. \<workstream 2\> — ExecPlan: \<link\>

## Next steps

- Required design artifacts
- Issues to open
- Target milestones and timeline

## Links

- Originating issue or request: \<link\>
- PRD: [requirements-prd_tpl](../planning/requirements-prd_tpl.md)
- Project roadmap: [project-roadmap_tpl](../planning/project-roadmap_tpl.md)
- System design: [system_design_tpl](../design/system_design_tpl.md)
- Governing standards: [System_Design_Standard](../../../04_Design_Framework/System_Design_Standard.md),
  [Design_First_Development_Model](../../../04_Design_Framework/Design_First_Development_Model.md)

# Implementation Notes

- Update the charter when scope, ownership, or risk profile changes.
- Tier 3 charters MUST be reviewed before design work begins.

# Continuous Improvement and Compliance Metrics

- Track charter changes, scope drift, and risk realization frequency.

# Compliance

Tier 3 projects without a comprehensive charter are non-compliant.

# Changelog

- 0.1.0 - Initial draft.
