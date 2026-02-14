---
id: STD-032
title: SDLC with AI
version: 1.0.23
category: workflow
status: active
approver: sh4i-yurei
reviewer: sh4i-yurei
owner: sh4i-yurei
last_updated: 2026-02-14
extends: [STD-000, STD-003, STD-006, STD-020, STD-021, STD-022, STD-023]
tags: [sdlc, ai-assisted, workflow, governance]
---
# Purpose

This document defines the AI-assisted SDLC for this environment. It
preserves governance, traceability, and quality gates while enabling
fast, safe iteration through tiered workflows.

# Scope

Applies to all changes that modify system behavior, configuration, or
operational posture.

# Standard

## Tool specificity (authoritative)

This standard names specific AI tools (Claude Code, Codex, Copilot,
Quint Code) as the current approved implementations of required
capabilities. KB retrieval uses the approved KB search mechanism
(rag-service or manual search). These references are authoritative for
this environment and MAY be updated via [Tooling_Inventory](../03_Engineering_Standards/Tooling_Inventory.md) without
changing
SDLC roles or responsibilities. Any replacement tool MUST provide
equivalent or stronger capabilities and remain subject to
[AI_Assisted_Development_Standard](../03_Engineering_Standards/AI_Assisted_Development_Standard.md) (STD-004) and
[Software_Engineering_Governance_Overview](../01_Governance/Software_Engineering_Governance_Overview.md) (STD-000).

## Change tier decision framework

Use this sequence to classify changes:

1. Is this fixing a production outage or critical security issue?
   - YES -> Tier 1 (Hotfix)
   - NO -> continue
2. Does this create a new system, service, or major subsystem?
   - YES -> Tier 3 (Architecture)
   - NO -> continue
3. Does this modify authentication, authorization, payment, or data
   storage?
   - YES -> Tier 3 (Architecture)
   - NO -> continue
4. Does this require a data migration or schema change?
   - YES -> Tier 3 (Architecture)
   - NO -> Tier 2 (Feature)

## Change classification

### Tier 1 - Hotfix

- Trigger: Production outage, security incident, urgent defect.
- Path: Issue -> Fix -> Validate -> Release -> Post-hoc documentation.

### Tier 2 - Feature

- Trigger: New capability, medium-risk change, routine enhancement.
- Path: Lightweight design -> Spec -> Implement -> Validate -> Release.

### Tier 3 - Architecture

- Trigger: New system, major redesign, high-risk change.
- Path: Project proposal -> PRD -> Charter -> System design -> Module
  design -> Spec -> Implement -> Validate -> Release -> Operate.

> WARNING: If classification is unclear, default to Tier 2 and open an
> issue to reclassify.

## Lightweight design definition (Tier 2)

Tier 2 design MUST be a single Markdown document or issue comment that
includes:

- Problem statement
- Approach summary
- Interfaces or data impacts
- Testing plan
- Success metrics and instrumentation plan
- Progressive delivery plan (feature flags, canary, rollback triggers)
- Rollback plan
- Failure scenarios and mitigations (for critical paths)
- Links to affected standards

## Tier 3 architecture requirements

Tier 3 work MUST begin with a PRD and charter before System Design.

Tier 3 design MUST explicitly cover:

- System context and boundaries
- Major components and interfaces
- Data/storage model and ownership
- Deployment and operational view
- Quality goals (latency, availability, durability)
- Security assumptions and threat considerations
- Threat model linked per [Security_and_Threat_Modeling_Standard](../03_Engineering_Standards/Security_and_Threat_Modeling_Standard.md)
- SLI/SLO targets and error budgets linked per [SLI_SLO_Standard](../03_Engineering_Standards/SLI_SLO_Standard.md)
- Success metrics and instrumentation plan
- Progressive delivery plan (feature flags, canary, rollback triggers)
- Failure scenarios and mitigations (FMEA-style analysis for critical
  paths)
- Architecture options analysis with decision rubric and trade-offs
- Design governance and approval model captured in the charter or
  design artifact

Tier 3 design MUST include an AI-assisted red-team pass (approved CLI
agent + KB retrieval) focused on failure modes, data integrity, and
security. The red-team review MUST be recorded in the design artifact
or Quint Code.

## AI-assisted design flow (by tier)

### Tier 2 flow

1. Capture a lightweight design using
   [lightweight-design_tpl](../06_Projects/Templates/design/lightweight-design_tpl.md) or an issue comment.
2. Use KB retrieval (rag-service or manual search) to surface relevant
   KB standards and precedents.
3. Use the approved CLI agent to draft a spec and test requirements
   tied to the design.
4. Use the approved CLI agent to validate design completeness against
   [Design_Review_Checklist](../04_Design_Framework/Design_Review_Checklist.md) and flag ADR conflicts or missing
   standards links.
5. Record ADRs only when decisions affect shared interfaces, data
   contracts, or cross-module behavior.

### Tier 3 flow

1. Capture a PRD using
   [requirements-prd_tpl](../06_Projects/Templates/planning/requirements-prd_tpl.md).
2. Use the approved CLI agent to transform informal intent into
   structured requirements.
3. Use KB retrieval (rag-service or manual search) to surface relevant
   KB standards and precedents.
4. Use the approved CLI agent to propose at least two architecture
   options and capture trade-offs using
   [architecture-options-analysis_tpl](../06_Projects/Templates/architecture/architecture-options-analysis_tpl.md).
5. Select an option, record ADRs as needed, and produce the approved
   design/spec artifacts.
6. Produce threat model per [Security_and_Threat_Modeling_Standard](../03_Engineering_Standards/Security_and_Threat_Modeling_Standard.md)
   and define SLI/SLO targets per [SLI_SLO_Standard](../03_Engineering_Standards/SLI_SLO_Standard.md). Link both
   from the system design artifact.
7. Use the approved CLI agent to validate design completeness against
   [Design_Review_Checklist](../04_Design_Framework/Design_Review_Checklist.md), check for ADR conflicts, and generate a
   stakeholder summary.
8. Use the approved CLI agent to draft test requirements tied to the
   spec.

All implementation prompts MUST reference the approved spec and the
tier-appropriate design artifact, plus relevant standards including
[AI_Assisted_Development_Standard](../03_Engineering_Standards/AI_Assisted_Development_Standard.md) (STD-004). Tier 3 architectural
decisions MUST be captured as ADRs using
[adr_tpl](../06_Projects/Templates/architecture/adr_tpl.md) and linked from the System Design alongside the options
analysis.

## Context reset and execution handoff

After planning and design, create a consolidated execution handoff
including the approved artifacts for the tier (for example, a
lightweight design for Tier 2 or PRD, charter, and System Design for
Tier 3), specs, test plan, and file targets. Complete the context
reset checklist in
[context-reset_checklist_tpl](../06_Projects/Templates/prompts/context-reset_checklist_tpl.md). Start a
fresh AI session for implementation using the context pack and only the
rule packs needed for the task (see [rules-index](../03_Engineering_Standards/AI_Rules/rules-index.md)). This keeps
execution context small and reduces drift.

An ExecPlan MUST be created before implementation when any of the
following apply:

- Tier 3 work (always required)
- Cross-module changes affecting shared interfaces or data contracts
- Multi-session work where context must survive between sessions
- Changes introducing new dependencies or data contracts

When an ExecPlan is required, create or update it before implementation
and include it in the context pack.

At session end, agents working on Tier 2+ tasks SHOULD produce a session
handoff artifact per the
[session_handoff_tpl](../06_Projects/Templates/ai/session_handoff_tpl.md).
At session start, agents MUST check for and read any existing handoff
artifact before beginning work.

## Canonical stages (with feedback loops)

Each tier maps to the same stages, but may skip or compress steps.

### 1. Initiation

- Inputs: issue, incident, request, charter, or
  [project-intake_tpl](../06_Projects/Templates/planning/project-intake_tpl.md) (pre-repo).
- Outputs: change tier, intent, and PRD or charter when required.
- For Tier 3, capture a project proposal using [project-proposal_tpl](../06_Projects/Templates/planning/project-proposal_tpl.md)
  before PRD and design.
- For Tier 3, define design governance (approvers, escalation path,
  amendment process) in the project charter.
- If work spans multiple items, track backlog and milestones in
  [backlog-milestones_tpl](../06_Projects/Templates/planning/backlog-milestones_tpl.md).
- For Tier 2 and Tier 3, capture a roadmap using
  [project-roadmap_tpl](../06_Projects/Templates/planning/project-roadmap_tpl.md).
- For new repos, follow [project_repo_initialization_workflow](project_repo_initialization_workflow.md).
- Follow [KB_Integration_Standard](../03_Engineering_Standards/KB_Integration_Standard.md) for required pointer artifacts and
  KB retrieval expectations before design or implementation.
- Feedback loop: validate scope against
  [Issue_and_Change_Management_Policy](../01_Governance/Issue_and_Change_Management_Policy.md).

### 2. Design

- Inputs: intent and constraints.
- Outputs by tier:
  - Tier 1: inline design notes in issue or PR.
  - Tier 2: lightweight design doc (defined above).
  - Tier 3: [System_Design_Standard](../04_Design_Framework/System_Design_Standard.md) and [Module_Design_Standard](../04_Design_Framework/Module_Design_Standard.md),
    plus threat model and SLI/SLO artifacts.
- Risk register required for Tier 3; Tier 2 requires it when changes
  introduce security, data, or operational risk (use
  [risk-register_tpl](../06_Projects/Templates/risk/risk-register_tpl.md)).
- Capture architectural decisions per [architecture-decision-workflow](architecture-decision-workflow.md).
- Feedback loop: design review using [design_review_workflow](design_review_workflow.md) and
  [Design_Review_Checklist](../04_Design_Framework/Design_Review_Checklist.md).

### 3. Specification

- Inputs: approved design.
- Outputs: technical specification(s) per
  [Technical_Specification_Standard](../04_Design_Framework/Technical_Specification_Standard.md).
- Outputs: schema definitions per [schema-definition-standard](../04_Design_Framework/schema-definition-standard.md) when
  data models or contracts change.
- For Tier 2 and Tier 3, schema and interface definitions MUST be
  approved before test authoring begins.
- Feedback loop: feasibility check and test plan review.

### 4. Implementation

- Inputs: approved specification.
- Outputs: code and configuration changes.
- Controls: follow [git_and_branching_workflow](git_and_branching_workflow.md) (PR review, branch
  protection, AI-assist disclosure) and [CI_CD_Pipeline_Model](CI_CD_Pipeline_Model.md) gates.
- For Tier 2 and Tier 3, test cases defined in the specification MUST
  be authored before or alongside implementation code.
- Work meeting ExecPlan criteria (see Context reset and execution
  handoff) MUST maintain an ExecPlan per `PLANS.md`. ExecPlans MUST be
  created at session start (not retroactively), stored in
  `plans/exec_plans/<date>_<slug>.md`, and have their Progress section
  updated each session. Missing ExecPlans for qualifying work constitute
  a process compliance gap.
- Security and config baselines run in CI when applicable; do not defer
  security checks to release.
- Feedback loop: incremental test runs and CI feedback per commit.

### 5. Verification and validation

- Inputs: implementation changes.
- Outputs: passing gates and evidence.
- Validation runs in staging or production-like environments for Tier 2
  and Tier 3 per [Environment_Segregation_Standard](../03_Engineering_Standards/Environment_Segregation_Standard.md).
- Non-functional checks (performance, resilience, security validation)
  MUST run when required by the approved spec or readiness checklist.
- Validate new telemetry with [observability_checklist_tpl](../06_Projects/Templates/operations/observability_checklist_tpl.md) when
  signals, alerts, or SLOs are introduced.
- Feedback loop: failures feed back to design/spec as needed.

### 6. Release

- Inputs: validated changes and approvals.
- Outputs: release artifact, rollback plan, release note.
- Workflow: [release_workflow](release_workflow.md) and
  [operational-readiness-review-checklist](operational-readiness-review-checklist.md).
- Release candidates MUST be validated before promotion, and promotion
  MUST follow the environment path defined in
  [Release_Management_Policy](../01_Governance/Release_Management_Policy.md) and
  [Environment_Segregation_Standard](../03_Engineering_Standards/Environment_Segregation_Standard.md).
- Feedback loop: staged rollout signals and canary metrics.

### 7. Operations and learning

- Inputs: deployed system.
- Outputs: operational metrics, incidents, and improvement backlog.
- Workflow: [observability_and_feedback](observability_and_feedback.md) and [incident_response](incident_response.md).
- Feedback loop: incidents and metrics feed new issues and specs.
- For Tier 3 (and Tier 2 when material), run a design post-mortem using
  [design-postmortem_tpl](../06_Projects/Templates/operations/design-postmortem_tpl.md) to compare SLI/SLOs and success metrics
  against design assumptions, update ADRs, and capture lessons learned.
  Record outcomes in the governing issue; use an ADR when design changes
  are required.
- Run the governance audit checklist quarterly or before major releases
  using [governance-process-audit-checklist](governance-process-audit-checklist.md).

## CI/CD integration points

- Design stage: documentation structure and cross-references
- Spec stage: completeness and standards alignment
- Implementation stage: linting, formatting, static checks, config and
  baseline security checks (when applicable)
- Validation stage: tests, coverage, and required non-functional checks
- Release stage: security scan, release checklist, rollback readiness

All CI requirements follow [CI_CD_Pipeline_Model](CI_CD_Pipeline_Model.md).

## CI/CD stage matrix

- Design: Frontmatter, links, spelling (yamllint, markdown-link-check,
  cspell). Blocking: yes when docs change; advisory for code-only
  changes.
- Spec: Spec completeness (checklist or script). Blocking: Tier 2/3
  spec changes; advisory for Tier 1 inline specs.
- Implementation: Lint, format, type checks (ruff, black, mypy, eslint).
  Config validation and security baselines when applicable. Blocking:
  yes.
- Validation: Tests, coverage (pytest, jest/vitest), and required
  non-functional checks. Blocking: yes.
- Release: Security, rollback plan, release checklist (CodeQL).
  Blocking: yes.

## AI agent roles by stage (explicit tools)

- Initiation: approved CLI agent (intent clarification).
- Design/Spec: approved CLI agent + KB retrieval (standards alignment
  and completeness checks).
- Implementation: approved CLI agent teams (parallel implementation,
  scoped edits, test generation), Copilot (inline suggestions).
- Validation: approved CLI agent (run checks), Quint Code (decision
  tracking for code changes).
- Release/Operate: approved CLI agent (checklists, post-incident notes).

## AI enforcement controls

- Pre-commit hooks MUST run locally.
- Branch protection MUST require CI passes.
- Protected branches MUST deny direct pushes.
- Secrets scanning MUST run before merge.

## Approval requirements by tier

### Tier 1 approvals

- Design approval: inline in PR or issue.
- Spec approval: inline in PR.
- Release approval: explicit record + CI pass.

### Tier 2 approvals

- Design approval: self + AI review.
- Spec approval: self + checklist.
- Release approval: self + checklist.

### Tier 3 approvals

- Design approval: owner + AI red team + stakeholder sign-off
  (product, engineering, security, operations as applicable).
- Spec approval: self + 24-hour cooling period.
- Release approval: self + rollback plan.

## Gate ownership and escalation

- Implementation gate owner: maintainer (or CODEOWNERS delegate) per
  [git_and_branching_workflow](git_and_branching_workflow.md).
- Validation gate owner: maintainer ensures evidence meets
  [Testing_and_Quality_Standard](../03_Engineering_Standards/Testing_and_Quality_Standard.md) and readiness checklist requirements.
- Release gate owner: release authority per [Release_Management_Policy](../01_Governance/Release_Management_Policy.md)
  with operational readiness sign-off.
- Escalations follow the workflow-exception path in this SDLC.

## Tier 1 post-hoc documentation gate

Hotfixes may deploy immediately, but must record:

- root cause
- fix summary
- validation evidence
- follow-up actions

This MUST be documented within 24 hours or the next working session,
whichever comes first.

## Maintenance workflow

- Path: Issue -> Impact assessment -> Update -> Validate -> Release.
- Security updates MAY follow Tier 1 with post-hoc documentation.

## Spike and exploration workflow

- Time-boxed, non-production code.
- Max duration: 1 day (solo).
- Spike branches MUST be prefixed `spike/`.
- Findings MUST be documented and linked to a Tier 2 or Tier 3 issue.
- Spike code MUST NOT be deployed to production.

## Rollback and recovery

Rollback is mandatory for Tier 1-3:

- Define rollback strategy before release.
- Use feature flags or reversible changes when possible.
- Post-rollback: open remediation issue and update specs.

## Operations feedback loop

- Define SLIs/SLOs in design and spec stages.
- Instrument logging, metrics, and tracing in implementation.
- Validate observability in testing and staging.
- Incidents MUST open issues and feed Tier 1 or Tier 2 workflows.
- Review operational metrics weekly and update backlog.

## Process evolution after defects

When defects or incidents occur, update the AI workflow assets that
caused or failed to prevent the issue. This MAY include global rules,
rule packs, prompt patterns, or the command catalog. Record the changes
in the issue or Quint artifacts to prevent recurrence.

## Traceability requirements

- Every change links to issue or charter.
- Every implementation links to its specification.
- Every release links to validation evidence and Quint records.
- Every code change MUST update Quint artifacts per
  [CI_CD_Pipeline_Model](CI_CD_Pipeline_Model.md).
- Design changes MUST increment version metadata and update changelog
  entries on the affected design artifacts.

## Escalation and exceptions

When the workflow does not fit:

1. Open issue labeled `workflow-exception`.
2. Document why the standard path does not apply.
3. Propose an alternative with equivalent controls.
4. Approve with explicit risk acknowledgment.
5. Record decision in Quint Code.
6. Review exception in next retrospective.

## SDLC effectiveness metrics

Track to ensure process health:

- Cycle time by tier (Tier 1 < 1 day, Tier 2 < 3 days, Tier 3 < 2 weeks).
- Rollback frequency (< 5% of releases).
- Hotfix documentation compliance (100% within window).
- CI failure rate (< 10% of commits).
- Design rework rate (< 20% of specs require redesign).
- AI-introduced defect rate (track, minimize over time).

## Solo practice considerations

This workflow is executed when time permits. Approvals and reviews
remain explicit but may be time-shifted to the next working session. Any
delays MUST be documented in the issue or release record.

# Implementation Notes

- Update [Tooling_Inventory](../03_Engineering_Standards/Tooling_Inventory.md) when approved tools change.
- Document deviations from this SDLC in change records.

# Continuous Improvement and Compliance Metrics

- Track change tier distribution and cycle time by tier.
- Review post-release defects tied to design or spec gaps.

# Compliance

Any change that bypasses required gates is non-compliant and must be
remediated through the change management process.

# Changelog

- 1.0.23 - Strengthened ExecPlan enforcement with explicit trigger
  criteria, storage path, and compliance gap language. Added session
  handoff template reference for multi-session continuity.
- 1.0.22 - Added threat model/SLI/SLO step to Tier 3 flow, explicit
  design outputs, and design post-mortem template reference.
- 1.0.21 - Added schema-before-tests and tests-first sequencing for Tier 2/3.
- 1.0.20 - Removed Aider; replaced implementation role with agent teams.
- 1.0.19 - Generalized Codex references to "approved CLI agent" for multi-runtime support.
- 1.0.18 - Aligned CI/CD matrix with Quint and documentation gates.
- 1.0.17 - Clarified design post-mortem recording location.
- 1.0.16 - Linked tooling inventory location.
- 1.0.15 - Updated links for renamed engineering standards.
- 1.0.14 - Set owner/reviewer/approver values.

- 1.0.13 - Replaced template paths with KB links.
- 1.0.12 - Required ExecPlans for complex work and added handoff guidance.
- 1.0.11 - Added risk register trigger, architecture decision workflow, and governance audit cadence.
- 1.0.10 - Restored design review workflow reference.
- 1.0.9 - Linked KB integration standard and removed draft workflow dependency.
- 1.0.8 - Expanded phase 4-6 controls, validation, and ownership.
- 1.0.7 - Required project proposal before Tier 3 design.
- 1.0.6 - Added design governance, success metrics, progressive delivery,
  AI validation, and design post-mortem requirements.
- 1.0.5 - Clarified tier-specific design flow requirements.
- 1.0.4 - Linked design review workflow.
- 1.0.3 - Added schema definition requirement for specs.
- 1.0.2 - Added links to release and operations workflows.
- 1.0.1 - Added project roadmap requirement for Tier 2 and Tier 3.
- 1.0.0 - Activated after review and baseline alignment.
- 0.6.5 - Added backlog and milestones template reference.
- 0.6.4 - Added repo initialization workflow reference.
- 0.6.3 - Added intake template reference in initiation stage.
- 0.6.2 - Normalized structure and added options analysis requirements.
- 0.6.1 - Added context reset checklist usage.
- 0.6.0 - Added PRD-first requirement, context reset handoff, and
  workflow evolution after defects.
- 0.5.2 - Aligned traceability with Quint requirements.
- 0.5.1 - Added explicit standard IDs and red-team review recording.
