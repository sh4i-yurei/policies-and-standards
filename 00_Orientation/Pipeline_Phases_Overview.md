---
id: STD-016
title: Pipeline Phases Overview
version: 0.1.4
category: orientation
status: active
approver: sh4i-yurei
reviewer: sh4i-yurei
owner: sh4i-yurei
last_updated: 2026-02-12
extends: [STD-032]
tags: [orientation, pipeline, sdlc, phases]
---
# Purpose

Provide an at-a-glance view of the governed delivery pipeline and
consistent phase terminology for AI and human collaboration.

# Scope

Applies to all governed work. This overview is non-authoritative and
serves as a navigation aid; the authoritative workflow remains
[SDLC_With_AI](../05_Dev_Workflows/SDLC_With_AI.md).

# Standard

## Phase map (at a glance)

1. Phase 1 - Initiation
   - Intent: clarify need, scope, tier, and governance.
   - Core artifacts: intake record or issue, Tier 3 project proposal,
     PRD/charter/roadmap as required.
2. Phase 2 - Design (the design pipe)
   - Intent: define system and module intent before implementation.
   - Core artifacts: Tier 1 inline notes, Tier 2 lightweight design, or
     Tier 3 system/module design plus options analysis and ADRs.
3. Phase 3 - Specification
   - Intent: authorize implementation with explicit requirements.
   - Core artifacts: technical specification and schema definitions when
     applicable.
4. Phase 4 - Implementation
   - Intent: build within approved specification boundaries.
   - Core artifacts: code changes tied to specs and tests.
5. Phase 5 - Verification and validation
   - Intent: prove the change works and meets requirements.
   - Core artifacts: test evidence, validation results, and staging
     verification where required.
6. Phase 6 - Release
   - Intent: ship safely with rollback readiness.
   - Core artifacts: release checklist, rollback plan, release notes,
     environment promotion record.
7. Phase 7 - Operations and learning
   - Intent: monitor, learn, and feed improvements back into design.
   - Core artifacts: observability signals, incident records, design
     post-mortem outcomes when required.

## Entry requirements by tier

- Tier 1: issue or incident record; inline design/spec allowed.
- Tier 2: lightweight design + spec required before implementation.
- Tier 3: project proposal required before design; PRD and charter
  required before system/module design.

## Terminology

- Phase: a governed stage of work in the SDLC pipeline.
- Gate: an approval checkpoint between phases (design review, spec
  approval, release readiness).
- Artifact: a required document or record produced in a phase.
- Tier: change classification as defined in [SDLC_With_AI](../05_Dev_Workflows/SDLC_With_AI.md).

## References

- Authoritative workflow: [SDLC_With_AI](../05_Dev_Workflows/SDLC_With_AI.md)
- Repo creation workflow: [project_repo_initialization_workflow](../05_Dev_Workflows/project_repo_initialization_workflow.md)
- Design review: [design_review_workflow](../05_Dev_Workflows/design_review_workflow.md)
- Observability feedback loop: [observability_and_feedback](../05_Dev_Workflows/observability_and_feedback.md)
- Proposal template: [project-proposal_tpl](../06_Projects/Templates/planning/project-proposal_tpl.md)
- Environment standard: [Environment_Segregation_Standard](../03_Engineering_Standards/Environment_Segregation_Standard.md)
- Release authority: [Release_Management_Policy](../01_Governance/Release_Management_Policy.md)

# Implementation Notes

- Keep this overview concise; expand details in the referenced
  standards and workflows.
- Use the phase labels in prompts and status updates for consistency.

# Continuous Improvement and Compliance Metrics

Track onboarding clarity and update this overview when phases or gates
change.

# Compliance

This document is informational. Compliance is governed by
[SDLC_With_AI](../05_Dev_Workflows/SDLC_With_AI.md) and the linked standards.

# Changelog

- 0.1.4 - Updated links for renamed engineering standards.
- 0.1.3 - Set owner/reviewer/approver values.

- 0.1.2 - Marked overview as non-authoritative.
- 0.1.1 - Added environment and release references.
- 0.1.0 - Initial draft.
