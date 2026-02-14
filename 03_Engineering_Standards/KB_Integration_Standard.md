---
id: STD-056
title: KB integration standard
version: 0.1.9
category: engineering
status: active
approver: sh4i-yurei
reviewer: sh4i-yurei
owner: sh4i-yurei
last_updated: 2026-02-14
extends: [STD-000, STD-001, STD-003, STD-004, STD-012, STD-032]
tags: [kb, governance, integration, ai, workflow]
---
# Purpose

Define how governed repositories reference the engineering knowledge
base (KB) without duplicating it, and how AI-assisted work must retrieve
KB context before design or implementation.

# Scope

Applies to all governed repositories and AI-assisted work performed
under this knowledge base.

# Standard

## 1. KB authority

1.1 The KB is the authoritative source of standards, workflows, and
required artifacts for governed repositories. See
[Vault_Schema_Definition](../02_Documentation_Standards/Vault_Schema_Definition.md).

1.2 Repositories MUST reference the KB and MUST NOT duplicate standards
or workflows unless an approved exception is recorded.

1.3 Repository-specific documentation MAY add implementation details but
MUST NOT conflict with KB standards.

## 2. Required pointer artifacts

Every governed repository MUST include the following files:

- AGENTS.md using [agents_tpl](../06_Projects/Templates/project_root/agents_tpl.md)
- `.kb/ai-context.yaml` using [kb-ai-context_tpl](../06_Projects/Templates/project_root/kb-ai-context_tpl.md)
- `AI_CONTEXT.md` using [ai_context_pack_tpl](../06_Projects/Templates/ai/ai_context_pack_tpl.md)
- `PLANS.md` using [plans_tpl](../06_Projects/Templates/project_root/plans_tpl.md)
- Repo-orientation skill using [repo_orientation_skill_tpl](../06_Projects/Templates/ai/repo_orientation_skill_tpl.md) at
  `.claude/skills/repo-orientation/SKILL.md`
- `.github/pull_request_template.md` using [pull-request-template_tpl](../06_Projects/Templates/project_root/pull-request-template_tpl.md)

2.1 AGENTS.md MUST include a sudo policy that requires privileged
operations to run through `/usr/local/sbin/codex-helper.sh` and forbids
direct `sudo` usage.

2.2 Repo-local skills MUST live under `.claude/skills`. Additional
repo-local skills SHOULD be added when tasks require specialized
guidance.

## 3. KB reference and pinning

3.1 `.kb/ai-context.yaml` MUST declare the KB source and reference (tag
or branch).

3.2 Repositories SHOULD pin to a KB release tag for stability. Use a
floating branch only for experiments or early-stage work.

3.3 Changes to the KB reference MUST be tracked in an issue per
[Issue_and_Change_Management_Policy](../01_Governance/Issue_and_Change_Management_Policy.md) or a decision record per
[architecture-decision-workflow](../05_Dev_Workflows/architecture-decision-workflow.md).

## 4. Retrieval before design or code

4.1 AI-assisted work MUST read AGENTS.md, `.kb/ai-context.yaml`,
`AI_CONTEXT.md`, and `PLANS.md` before producing designs, specs, or
code.

4.2 AI-assisted work MUST retrieve and cite relevant KB standards and
workflows in design notes or pull request descriptions.

4.3 If KB retrieval is unavailable or incomplete, AI-assisted work MUST
pause and request maintainer action.

4.4 Use context packs per [ai_context_pack_tpl](../06_Projects/Templates/ai/ai_context_pack_tpl.md) and keep
`AI_CONTEXT.md` current for the work in scope.

4.5 If `PLANS.md` indicates ExecPlan criteria apply to the current work,
the agent MUST verify an active ExecPlan exists before proceeding. If
none exists, create one per the
[exec_plan_tpl](../06_Projects/Templates/ai/exec_plan_tpl.md).

4.6 For multi-session work, read the most recent session handoff artifact
(if present) alongside `PLANS.md` to restore session context.

## 5. Conflicts and overrides

5.1 Repository-specific overrides are permitted only when explicitly
approved and recorded in `.kb/ai-context.yaml` under exceptions.

5.2 When conflicts are detected, default to the KB and request
resolution rather than infer new rules.

## 6. Traceability

6.1 Pull requests MUST list KB standards consulted and link required
artifacts using the [pull-request-template_tpl](../06_Projects/Templates/project_root/pull-request-template_tpl.md).

6.2 AI-assisted pull requests MUST summarize AI contributions and
validation performed.

## 7. Tooling independence

7.1 The KB retrieval mechanism is implementation-specific and MAY be
manual or automated. Indexing is optional and not required for
compliance.

# Implementation Notes

- Initialize new repositories using [project_repo_initialization_workflow](../05_Dev_Workflows/project_repo_initialization_workflow.md).
- Keep pointer artifacts minimal; do not embed KB content in repos.
- KB retrieval procedure for AI-assisted work:
  1. If a rag-service endpoint is configured in `.kb/ai-context.yaml`,
     query it with the task description.
  2. Otherwise, search the KB filesystem using file search and content
     search tools for relevant STD-*, workflow, and template keywords.
  3. If neither method is available, request the maintainer to provide
     relevant KB excerpts.
  4. Cite retrieved standards in design notes or PR descriptions per
     section 6.

# Continuous Improvement and Compliance Metrics

- Track adherence to pointer artifacts in repository audits.
- Track AI changes missing KB citations.

# Compliance

Repositories lacking the required pointer artifacts or AI work performed
without KB retrieval are non-compliant.

# Changelog

- 0.1.9 - Added ExecPlan verification gate and session handoff retrieval
  requirement.
- 0.1.8 - Added KB retrieval implementation procedure to notes.
- 0.1.7 - Normalized skill paths to Claude Code as primary runtime.
- 0.1.6 - Updated skill paths to support both Claude Code and Codex runtimes.
- 0.1.5 - Added traceability links for KB reference changes and PRs.
- 0.1.4 - Set owner/reviewer/approver values.

- 0.1.3 - Replaced template paths with KB links.
- 0.1.2 - Required AI context pack, PLANS.md, and repo-orientation skill.
- 0.1.1 - Added AGENTS sudo policy requirement.
- 0.1.0 - Initial draft.
