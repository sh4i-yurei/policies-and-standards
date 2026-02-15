---
id: STD-054
title: Project repository initialization workflow
version: 0.1.18
category: workflow
status: active
approver: sh4i-yurei
reviewer: sh4i-yurei
owner: sh4i-yurei
last_updated: 2026-02-15
extends: [STD-003, STD-020, STD-032, STD-056]
tags: [workflow, repository, initialization, templates, onboarding]
---
# Purpose

Define the required process and minimum documentation set when creating
a new project repository, so only necessary artifacts are added based on
change tier and scope.

# Scope

Applies to all new governed repositories and major new projects created
under this knowledge base.

# Standard

## 1. Inputs and decision points

- Intake record or issue exists: [project-intake_tpl](../06_Projects/Templates/planning/project-intake_tpl.md) or issue link.
- Tier 3 projects MUST have a proposal using [project-proposal_tpl](../06_Projects/Templates/planning/project-proposal_tpl.md)
  before design begins.
- Change tier classified per [SDLC_With_AI](SDLC_With_AI.md).
- Deployment scope identified: non-production, internal, or production.

## 2. Baseline repository set (required for all tiers)

- README: [readme_tpl](../06_Projects/Templates/project_root/readme_tpl.md)
- License: [license_tpl](../06_Projects/Templates/project_root/license_tpl.md)
- Contributing: [contributing_tpl](../06_Projects/Templates/project_root/contributing_tpl.md)
- Code of conduct: [code_of_conduct_tpl](../06_Projects/Templates/project_root/code_of_conduct_tpl.md)
- Security policy: [security_tpl](../06_Projects/Templates/project_root/security_tpl.md)
- Testing strategy: [testing_tpl](../06_Projects/Templates/project_root/testing_tpl.md)
- Style guide: [style_guide_tpl](../06_Projects/Templates/project_root/style_guide_tpl.md)
- AGENTS.md: [agents_tpl](../06_Projects/Templates/project_root/agents_tpl.md)
- KB context config: [kb-ai-context_tpl](../06_Projects/Templates/project_root/kb-ai-context_tpl.md)
- Pull request template:
  [pull-request-template_tpl](../06_Projects/Templates/project_root/pull-request-template_tpl.md)
- Project charter: [project_charter_tpl](../06_Projects/Templates/project_root/project_charter_tpl.md)
- CI definition (only for deviations from [CI_CD_Pipeline_Model](CI_CD_Pipeline_Model.md)):
  [ci_pipeline_tpl](../06_Projects/Templates/ci/ci_pipeline_tpl.md)

2.1 AGENTS.md MUST include the sudo policy from [agents_tpl](../06_Projects/Templates/project_root/agents_tpl.md),
including use of `/usr/local/sbin/codex-helper.sh` for privileged
operations.

## 3. Planning and design requirements by tier

- Risk register (when required by security or data standards):
  [risk-register_tpl](../06_Projects/Templates/risk/risk-register_tpl.md)
- Related templates: [risk-register_tpl](../06_Projects/Templates/risk/risk-register_tpl.md).

### Tier 1 - Hotfix

- Inline design notes in issue or PR.
- Technical spec may be inline per [Technical_Specification_Standard](../04_Design_Framework/Technical_Specification_Standard.md).

### Tier 2 - Feature

- PRD (optional; requirements may be captured in the issue or
  lightweight design): [requirements-prd_tpl](../06_Projects/Templates/planning/requirements-prd_tpl.md)
- Project roadmap: [project-roadmap_tpl](../06_Projects/Templates/planning/project-roadmap_tpl.md)
- Backlog/milestones: [backlog-milestones_tpl](../06_Projects/Templates/planning/backlog-milestones_tpl.md)
- Lightweight design: [lightweight-design_tpl](../06_Projects/Templates/design/lightweight-design_tpl.md)
- Technical spec: [technical_specification_tpl](../06_Projects/Templates/design/technical_specification_tpl.md)
- Schema definition (when needed):
  [schema-definition_tpl](../06_Projects/Templates/design/schema-definition_tpl.md)
- Related templates: [requirements-prd_tpl](../06_Projects/Templates/planning/requirements-prd_tpl.md), [project-roadmap_tpl](../06_Projects/Templates/planning/project-roadmap_tpl.md),
  [backlog-milestones_tpl](../06_Projects/Templates/planning/backlog-milestones_tpl.md), [lightweight-design_tpl](../06_Projects/Templates/design/lightweight-design_tpl.md),
  [technical_specification_tpl](../06_Projects/Templates/design/technical_specification_tpl.md), [schema-definition_tpl](../06_Projects/Templates/design/schema-definition_tpl.md).

### Tier 3 - Architecture

- PRD and charter (required).
- Project roadmap: [project-roadmap_tpl](../06_Projects/Templates/planning/project-roadmap_tpl.md)
- System design: [system_design_tpl](../06_Projects/Templates/design/system_design_tpl.md)
- Module design: [module_design_tpl](../06_Projects/Templates/design/module_design_tpl.md)
- Technical spec: [technical_specification_tpl](../06_Projects/Templates/design/technical_specification_tpl.md)
- Schema definition (when needed):
  [schema-definition_tpl](../06_Projects/Templates/design/schema-definition_tpl.md)
- Options analysis:
  [architecture-options-analysis_tpl](../06_Projects/Templates/architecture/architecture-options-analysis_tpl.md)
- ADRs: [adr_tpl](../06_Projects/Templates/architecture/adr_tpl.md)
- Related templates: [requirements-prd_tpl](../06_Projects/Templates/planning/requirements-prd_tpl.md), [project_charter_tpl](../06_Projects/Templates/project_root/project_charter_tpl.md),
  [project-roadmap_tpl](../06_Projects/Templates/planning/project-roadmap_tpl.md), [system_design_tpl](../06_Projects/Templates/design/system_design_tpl.md), [module_design_tpl](../06_Projects/Templates/design/module_design_tpl.md),
  [technical_specification_tpl](../06_Projects/Templates/design/technical_specification_tpl.md), [schema-definition_tpl](../06_Projects/Templates/design/schema-definition_tpl.md),
  [architecture-options-analysis_tpl](../06_Projects/Templates/architecture/architecture-options-analysis_tpl.md), [adr_tpl](../06_Projects/Templates/architecture/adr_tpl.md).

## 4. Operations and release requirements (conditional)

Add the following when the project will be deployed or operated:

- Operational notes: [operational_notes_tpl](../06_Projects/Templates/operations/operational_notes_tpl.md)
- Runbooks: [runbooks_tpl](../06_Projects/Templates/operations/runbooks_tpl.md)
- Deployment guide: [deployment_tpl](../06_Projects/Templates/operations/deployment_tpl.md)
- Observability checklist:
  [observability_checklist_tpl](../06_Projects/Templates/operations/observability_checklist_tpl.md)
- Release checklist: [release_checklist_tpl](../06_Projects/Templates/release/release_checklist_tpl.md)
- Release notes: [release-notes_tpl](../06_Projects/Templates/release/release-notes_tpl.md)
- Related templates: [operational_notes_tpl](../06_Projects/Templates/operations/operational_notes_tpl.md), [runbooks_tpl](../06_Projects/Templates/operations/runbooks_tpl.md),
  [deployment_tpl](../06_Projects/Templates/operations/deployment_tpl.md), [observability_checklist_tpl](../06_Projects/Templates/operations/observability_checklist_tpl.md),
  [release_checklist_tpl](../06_Projects/Templates/release/release_checklist_tpl.md), [release-notes_tpl](../06_Projects/Templates/release/release-notes_tpl.md).

## 5. AI context and prompt assets

Add for all governed repositories:

- AI context pack: [ai_context_pack_tpl](../06_Projects/Templates/ai/ai_context_pack_tpl.md)
- PLANS.md: [plans_tpl](../06_Projects/Templates/project_root/plans_tpl.md)
- ExecPlan template: [exec_plan_tpl](../06_Projects/Templates/ai/exec_plan_tpl.md)
- Repo-orientation skill:
  `.claude/skills/repo-orientation/SKILL.md`
  using [repo_orientation_skill_tpl](../06_Projects/Templates/ai/repo_orientation_skill_tpl.md)
- Additional repo-local skills:
  `.claude/skills/<skill-name>/SKILL.md`
  using [skill_tpl](../06_Projects/Templates/ai/skill_tpl.md)
- CLAUDE.md with a "Development commands" section documenting available
  scripts and their invocation syntax per
  [KB_Integration_Standard](../03_Engineering_Standards/KB_Integration_Standard.md)
  section 7.
- Prompt patterns: [prompts_tpl](../06_Projects/Templates/prompts/prompts_tpl.md)
- Command catalog: [command-catalog_tpl](../06_Projects/Templates/prompts/command-catalog_tpl.md)
- Context reset checklist:
  [context-reset_checklist_tpl](../06_Projects/Templates/prompts/context-reset_checklist_tpl.md)
- Related templates: [ai_context_pack_tpl](../06_Projects/Templates/ai/ai_context_pack_tpl.md), [plans_tpl](../06_Projects/Templates/project_root/plans_tpl.md),
  [exec_plan_tpl](../06_Projects/Templates/ai/exec_plan_tpl.md), [repo_orientation_skill_tpl](../06_Projects/Templates/ai/repo_orientation_skill_tpl.md), [skill_tpl](../06_Projects/Templates/ai/skill_tpl.md),
  [prompts_tpl](../06_Projects/Templates/prompts/prompts_tpl.md), [command-catalog_tpl](../06_Projects/Templates/prompts/command-catalog_tpl.md),
  [context-reset_checklist_tpl](../06_Projects/Templates/prompts/context-reset_checklist_tpl.md).

## 6. Verification

6.1 Verify that required artifacts exist for the chosen tier.  
6.2 Confirm links from README to charter, design, and spec artifacts.  
6.3 Record the initialization checklist in an issue or Quint decision.

# Implementation Notes

- Keep the repo lean; only add conditional docs when required.
- Use this workflow as the source of truth for repo bootstrap scripts.

# Continuous Improvement and Compliance Metrics

- Track time to repo readiness by tier.
- Track missing-doc findings during reviews.

# Compliance

New repositories that skip required artifacts for their tier are
non-compliant.

# Changelog

- 0.1.18 - Added CLAUDE.md tool discovery requirement to section 5 per
  STD-056 section 7.
- 0.1.17 - Made PRD optional for Tier 2 to align with SDLC tier definitions.
- 0.1.16 - Normalized skill paths to Claude Code as primary runtime.
- 0.1.15 - Updated skill paths to support both Claude Code and Codex runtimes.
- 0.1.14 - Clarified when CI pipeline docs are required.
- 0.1.13 - Set owner/reviewer/approver values.

- 0.1.12 - Replaced template paths with KB links.
- 0.1.11 - Made AI context and prompt assets mandatory for all repos.
- 0.1.10 - Added baseline repo-orientation skill template.
- 0.1.9 - Added repo-local skills guidance for AI-assisted work.
- 0.1.8 - Added PLANS.md and ExecPlan templates for AI-assisted work.
- 0.1.7 - Added Tier 3 project proposal requirement.
- 0.1.6 - Required AGENTS sudo policy alignment with template.
- 0.1.5 - Added KB pointer artifacts and pull request template.
- 0.1.4 - Linked AI and risk templates and added style guide.
- 0.1.3 - Added schema definition template requirement.
- 0.1.2 - Added wiki links for tier templates and operations artifacts.
- 0.1.1 - Added project roadmap requirement for Tier 2 and Tier 3.
- 0.1.0 - Initial draft.
