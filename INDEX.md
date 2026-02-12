# Knowledge Base Index

Quick-reference registry of all governed documents. Read this first to
find the standard, workflow, or template you need.

**Entry point:** [Onboarding](00_Orientation/Onboarding.md)
**Authoritative workflow:** [SDLC with AI](05_Dev_Workflows/SDLC_With_AI.md)

---

## 00 Orientation

| Document | ID | Purpose |
|----------|----|---------|
| [Core Principles](00_Orientation/Core_Principles.md) | STD-013 | Ten core principles governing all decisions and activities. |
| [Mission Statement](00_Orientation/Mission_Statement.md) | STD-010 | Mission, guiding principles, and strategic direction. |
| [Onboarding](00_Orientation/Onboarding.md) | STD-015 | Quick-start reading path for new contributors. |
| [Pipeline Phases Overview](00_Orientation/Pipeline_Phases_Overview.md) | STD-016 | At-a-glance delivery pipeline and phase terminology. |
| [Terminology](00_Orientation/Terminology.md) | STD-011 | Authoritative vocabulary used throughout the KB. |
| [Vision and Long-Term Goals](00_Orientation/Vision_and_Long_Term_Goals.md) | STD-014 | Long-term vision and strategic goals. |

## 01 Governance

| Document | ID | Purpose |
|----------|----|---------|
| [Software Engineering Governance Overview](01_Governance/Software_Engineering_Governance_Overview.md) | STD-000 | Root governance reference for all downstream standards. |
| [Standards Governance Policy](01_Governance/Standards_Governance_Policy.md) | STD-002 | Creation, review, approval, versioning, and retirement of standards. |
| [Issue and Change Management Policy](01_Governance/Issue_and_Change_Management_Policy.md) | STD-003 | Mandatory issue and change management process. |
| [Release Management Policy](01_Governance/Release_Management_Policy.md) | STD-006 | Governance controls for releasing software and documentation. |
| [KB Issue Log](01_Governance/KB_Issue_Log.md) | KB-ISSUE-LOG-001 | Local issue log when no external tracker is used. |

## 02 Documentation Standards

| Document | ID | Purpose |
|----------|----|---------|
| [Documentation Standard](02_Documentation_Standards/Documentation_Standard.md) | STD-001 | Mandatory structure, metadata, and linking requirements for all docs. |
| [Vault Schema Definition](02_Documentation_Standards/Vault_Schema_Definition.md) | STD-012 | Structural schema of the knowledge base repository. |

## 03 Engineering Standards

| Document | ID | Purpose |
|----------|----|---------|
| [AI Assisted Development Standard](03_Engineering_Standards/AI_Assisted_Development_Standard.md) | STD-004 | Constraints and rules for AI-assisted software development. |
| [Coding Standards and Conventions](03_Engineering_Standards/Coding_Standards_and_Conventions.md) | STD-005 | Mandatory coding practices and quality expectations. |
| [Security and Threat Modeling Standard](03_Engineering_Standards/Security_and_Threat_Modeling_Standard.md) | STD-007 | Security and threat-modeling requirements for design and implementation. |
| [Testing and Quality Standard](03_Engineering_Standards/Testing_and_Quality_Standard.md) | STD-008 | Mandatory testing and quality requirements. |
| [SLI/SLO Standard](03_Engineering_Standards/SLI_SLO_Standard.md) | STD-043 | Service level indicators and objectives. |
| [Data Management Standard](03_Engineering_Standards/Data_Management_Standard.md) | STD-044 | Data classification, retention, backups, and recovery. |
| [KB Integration Standard](03_Engineering_Standards/KB_Integration_Standard.md) | STD-056 | How repos reference the KB and how AI retrieves KB context. |
| [Environment Segregation Standard](03_Engineering_Standards/Environment_Segregation_Standard.md) | STD-057 | Required environments and separation rules. |
| [Agent Skills Standard](03_Engineering_Standards/Codex_Skills_Standard.md) | STD-058 | How agent skills are authored, stored, and governed. |
| [AI Data Handling Standard](03_Engineering_Standards/AI_Data_Handling_Standard.md) | STD-060 | **Stub.** Placeholder for AI data handling policy. Do not enforce. |
| [Tooling Inventory](03_Engineering_Standards/Tooling_Inventory.md) | TOOLING-001 | Approved tools and infrastructure components. |

### AI Rule Packs

| Document | ID | Purpose |
|----------|----|---------|
| [Rules Index](03_Engineering_Standards/AI_Rules/rules-index.md) | STD-048 | Modular rules index — read this to select rule packs. |
| [Frontend Rules](03_Engineering_Standards/AI_Rules/rules-frontend.md) | STD-049 | UI, accessibility, and frontend performance rules. |
| [API Rules](03_Engineering_Standards/AI_Rules/rules-api.md) | STD-050 | API contracts, boundaries, and observability rules. |
| [Data Rules](03_Engineering_Standards/AI_Rules/rules-data.md) | STD-051 | Data modeling, storage, and migration rules. |
| [Operations Rules](03_Engineering_Standards/AI_Rules/rules-operations.md) | STD-052 | Deployment, monitoring, and release rules. |
| [Security Rules](03_Engineering_Standards/AI_Rules/rules-security.md) | STD-053 | Authentication, secrets, and sensitive data rules. |

## 04 Design Framework

| Document | ID | Purpose |
|----------|----|---------|
| [Design-First Development Model](04_Design_Framework/Design_First_Development_Model.md) | STD-020 | Architectural intent must be defined and approved before implementation. |
| [System Design Standard](04_Design_Framework/System_Design_Standard.md) | STD-021 | Required structure of System Design artifacts. |
| [Module Design Standard](04_Design_Framework/Module_Design_Standard.md) | STD-022 | Required structure of Module Design artifacts. |
| [Technical Specification Standard](04_Design_Framework/Technical_Specification_Standard.md) | STD-023 | Required structure of Technical Specifications (permits code). |
| [Design Review Checklist](04_Design_Framework/Design_Review_Checklist.md) | STD-024 | Quality gate checklist for design artifact review. |
| [Schema Definition Standard](04_Design_Framework/schema-definition-standard.md) | STD-055 | How schemas are documented and constrained. |

## 05 Development Workflows

| Document | ID | Purpose |
|----------|----|---------|
| [SDLC with AI](05_Dev_Workflows/SDLC_With_AI.md) | STD-032 | Authoritative AI-assisted SDLC with tiered workflows. |
| [Git and Branching Workflow](05_Dev_Workflows/git_and_branching_workflow.md) | STD-031 | Mandatory git workflow (squash merge, PR-based). |
| [Git Workflow Checklist](05_Dev_Workflows/Git_Workflow_Checklist.md) | STD-042 | Validation checklist for git workflow compliance. |
| [CI/CD Pipeline Model](05_Dev_Workflows/CI_CD_Pipeline_Model.md) | STD-030 | Intended CI/CD pipeline and validation gates. |
| [Documentation Change Workflow](05_Dev_Workflows/documentation_change_workflow.md) | STD-033 | How governed documentation changes are managed. |
| [Design Review Workflow](05_Dev_Workflows/design_review_workflow.md) | STD-034 | How design reviews are executed and recorded. |
| [Architecture Decision Workflow](05_Dev_Workflows/architecture-decision-workflow.md) | STD-047 | How architecture decisions are captured via ADRs. |
| [Release Workflow](05_Dev_Workflows/release_workflow.md) | STD-035 | Operational release workflow. |
| [Incident Response](05_Dev_Workflows/incident_response.md) | STD-036 | Incident management, recording, and learning. |
| [Observability and Feedback](05_Dev_Workflows/observability_and_feedback.md) | STD-037 | Monitoring and operational feedback loop. |
| [Operational Readiness Review](05_Dev_Workflows/operational-readiness-review-checklist.md) | STD-045 | Pre-production readiness checklist. |
| [Vulnerability Management](05_Dev_Workflows/vulnerability-management-workflow.md) | STD-046 | Vulnerability identification, tracking, and remediation. |
| [Repo Initialization Workflow](05_Dev_Workflows/project_repo_initialization_workflow.md) | STD-054 | How new project repositories are set up. |
| [Governance Process Audit](05_Dev_Workflows/governance-process-audit-checklist.md) | STD-059 | Checklist for auditing governance compliance. |

## 06 Templates

### AI

| Template | Purpose |
|----------|---------|
| [AI Context Pack](06_Projects/Templates/ai/ai_context_pack_tpl.md) | Bundle KB references, rules, and constraints for a task. |
| [ExecPlan](06_Projects/Templates/ai/exec_plan_tpl.md) | Execution plan for complex AI-assisted work. |
| [Repo Orientation Skill](06_Projects/Templates/ai/repo_orientation_skill_tpl.md) | Skill for automated repo context discovery. |
| [Skill Template](06_Projects/Templates/ai/skill_tpl.md) | Author agent skills per STD-058. |

### Architecture

| Template | Purpose |
|----------|---------|
| [ADR](06_Projects/Templates/architecture/adr_tpl.md) | Architecture Decision Record. |
| [Options Analysis](06_Projects/Templates/architecture/architecture-options-analysis_tpl.md) | Architectural options with trade-off assessment. |

### CI

| Template | Purpose |
|----------|---------|
| [CI Pipeline](06_Projects/Templates/ci/ci_pipeline_tpl.md) | CI/CD pipeline configuration. |

### Design

| Template | Purpose |
|----------|---------|
| [System Design](06_Projects/Templates/design/system_design_tpl.md) | System scope, boundaries, and architecture. |
| [Module Design](06_Projects/Templates/design/module_design_tpl.md) | Module responsibilities and dependencies. |
| [Technical Specification](06_Projects/Templates/design/technical_specification_tpl.md) | Implementation instructions from approved designs. |
| [Lightweight Design](06_Projects/Templates/design/lightweight-design_tpl.md) | Tier 2 design: problem, approach, rollback. |
| [Schema Definition](06_Projects/Templates/design/schema-definition_tpl.md) | Data, API, and configuration schemas. |

### Governance

| Template | Purpose |
|----------|---------|
| [Issue Log](06_Projects/Templates/governance/issue_log_tpl.md) | Local issue log when no external tracker is used. |

### Operations

| Template | Purpose |
|----------|---------|
| [Deployment](06_Projects/Templates/operations/deployment_tpl.md) | Deployment procedures and environment config. |
| [Design Postmortem](06_Projects/Templates/operations/design-postmortem_tpl.md) | Post-release design review (assumptions vs. reality). |
| [Incident Postmortem](06_Projects/Templates/operations/incident_postmortem_tpl.md) | Incident analysis, root causes, and remediation. |
| [Observability Checklist](06_Projects/Templates/operations/observability_checklist_tpl.md) | Validate monitoring, dashboards, and alerts. |
| [Operational Notes](06_Projects/Templates/operations/operational_notes_tpl.md) | Operational procedures, SLOs, and ownership. |
| [Runbooks](06_Projects/Templates/operations/runbooks_tpl.md) | Operational procedures and troubleshooting. |

### Planning

| Template | Purpose |
|----------|---------|
| [Project Intake](06_Projects/Templates/planning/project-intake_tpl.md) | Capture intent and scope before formal chartering. |
| [Project Proposal](06_Projects/Templates/planning/project-proposal_tpl.md) | Justification, scope, and resource requirements. |
| [Requirements PRD](06_Projects/Templates/planning/requirements-prd_tpl.md) | Goals, users, and acceptance criteria. |
| [Project Roadmap](06_Projects/Templates/planning/project-roadmap_tpl.md) | Timeline, phases, and success criteria. |
| [Backlog and Milestones](06_Projects/Templates/planning/backlog-milestones_tpl.md) | Work backlog with prioritization and dependencies. |

### Project Root Files

| Template | Purpose |
|----------|---------|
| [AGENTS.md](06_Projects/Templates/project_root/agents_tpl.md) | AI agent configuration and constraints. |
| [PLANS.md](06_Projects/Templates/project_root/plans_tpl.md) | ExecPlan rules and when plans are required. |
| [KB AI Context](06_Projects/Templates/project_root/kb-ai-context_tpl.md) | KB references and pinning for governed repos. |
| [Project Charter](06_Projects/Templates/project_root/project_charter_tpl.md) | Scope, goals, constraints, and risks. |
| [PR Template](06_Projects/Templates/project_root/pull-request-template_tpl.md) | Standardized PR descriptions with required references. |
| [README](06_Projects/Templates/project_root/readme_tpl.md) | Project overview and quick start. |
| [Contributing](06_Projects/Templates/project_root/contributing_tpl.md) | Contribution guidelines and workflow. |
| [Code of Conduct](06_Projects/Templates/project_root/code_of_conduct_tpl.md) | Community standards and conduct expectations. |
| [Security Policy](06_Projects/Templates/project_root/security_tpl.md) | Security policy and vulnerability reporting. |
| [License](06_Projects/Templates/project_root/license_tpl.md) | Software license terms. |
| [Style Guide](06_Projects/Templates/project_root/style_guide_tpl.md) | Project-specific style conventions. |
| [Testing Guide](06_Projects/Templates/project_root/testing_tpl.md) | Testing strategy and coverage expectations. |

### Prompts

| Template | Purpose |
|----------|---------|
| [Command Catalog](06_Projects/Templates/prompts/command-catalog_tpl.md) | Custom commands and CLI shortcuts. |
| [Context Reset Checklist](06_Projects/Templates/prompts/context-reset_checklist_tpl.md) | Validate context completeness for new AI sessions. |
| [Prompt Patterns](06_Projects/Templates/prompts/prompts_tpl.md) | Reusable prompt templates and execution patterns. |

### Release

| Template | Purpose |
|----------|---------|
| [Release Checklist](06_Projects/Templates/release/release_checklist_tpl.md) | Validate release readiness across all gates. |
| [Release Notes](06_Projects/Templates/release/release-notes_tpl.md) | Changes, validation evidence, and rollback guidance. |

### Risk

| Template | Purpose |
|----------|---------|
| [Risk Register](06_Projects/Templates/risk/risk-register_tpl.md) | Identified risks, severity, and mitigation status. |
| [Vulnerability Report](06_Projects/Templates/risk/vulnerability_report_tpl.md) | Vulnerability details, impact, and remediation. |
