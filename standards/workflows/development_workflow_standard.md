---
id: STD-006
title: Development Workflow Standard
version: 1.0.0
category: workflows
status: draft
last_updated: 2025-11-23
extends: [STD-001, STD-002]
tags: [workflow, branching, git, governance, compliance, development]
owner: @sh4i-yurei
reviewer: The Architect
approver: @sh4i-yurei
---

# Purpose
This standard defines the **branching, development, and release workflow** used across all organizational repositories.  
It establishes the canonical process for implementing features, managing commits, performing reviews, and merging code within the governance model defined by [STD-002 – Standards Governance Policy].  
All repositories under the `sh4i-yurei` organization MUST follow this workflow unless an exception is explicitly approved and documented.

# Scope
This standard applies to:
- All software, infrastructure, and documentation repositories within the organization.
- All contributors, whether human or automated (e.g., agents, CI/CD systems).
- All development branches, commits, pull requests, and release processes.

# Standard

## 1. Branch Model
All repositories MUST follow the **feature-branch model**, derived from GitHub Flow, with controlled merges to `main`.

| Branch Type | Purpose | Naming Convention | Example |
|--------------|----------|-------------------|----------|
| **Feature** | Adds new functionality tied to a GitHub Issue | `feature/{issue-id}-{short-desc}` | `feature/12-rag-hybrid-search` |
| **Fix** | Corrects a defect or issue | `fix/{issue-id}-{short-desc}` | `fix/22-auth-header` |
| **Refactor** | Internal restructuring without feature or fix | `refactor/{issue-id}-{short-desc}` | `refactor/19-agent-logging` |
| **Docs** | Documentation or standard updates | `docs/{issue-id}-{short-desc}` | `docs/25-governance-manual` |
| **Hotfix** | Emergency patches to main | `hotfix/{short-desc}` | `hotfix/docker-build` |

Branch names MUST:
- Use lowercase and hyphens.
- Reference their related GitHub Issue ID.
- Be created from the latest `main` branch.

## 2. Workflow Sequence
All development work MUST follow this sequence:

1. **Create or reference a GitHub Issue.**  
   - Each Issue MUST define deliverables, acceptance criteria, and links to roadmap sections.

2. **Create a feature branch.**  
   ```
   git checkout main && git pull
   git checkout -b feature/{issue-id}-{short-desc}
   ```

3. **Implement changes and commit.**  
   Commits MUST follow the **semantic commit convention**:
   - `feat:` for new functionality  
   - `fix:` for bug fixes  
   - `docs:` for documentation  
   - `refactor:` for restructuring  
   - `test:` for testing  
   - `chore:` for maintenance  

   Example:  
   `feat(rag): implement hybrid retrieval pipeline (#12)`

4. **Push branch and open Pull Request (PR).**  
   PRs MUST include:
   - Linked Issue reference (`#12`)  
   - Summary of changes and testing evidence  
   - Validation checklist (linting, tests, compliance)

5. **Governance Review.**  
   - The **Governance Agent** or designated Reviewer validates:
     - Commit format compliance  
     - Policy adherence (`/standards/`)  
     - Documentation completeness  
     - Branch and Issue linkage

6. **Approval and Merge.**  
   - Only Approvers may merge to `main`.
   - All merges MUST use “Squash and Merge” for clean history.
   - Merge messages MUST reference Issue and branch:
     ```
     Merge pull request #12 from feature/12-rag-hybrid-search — RAG hybrid retrieval implemented
     ```

7. **Tag and Release.**  
   - Major milestones or phase completions MUST be tagged (e.g., `v2.2`).
   - Tags MUST correspond to roadmap versions.
   - Release notes generated automatically from PR metadata.

## 3. Governance Integration

### 3.1 Policy Enforcement
The `/standards/` submodule defines:
- Commit message schema (`commit_rules.md`)
- Documentation format (`documentation_rules.md`)
- File hierarchy expectations
- Pull request templates (`pr_template.md`)

### 3.2 Cross-Repository Sync
- The Governance Agent monitors `policies-and-standards` for updates.
- When updates occur, the Agent:
  1. Validates all repositories against new standards.  
  2. Creates automatic PRs for non-compliant repos.  
  3. Generates compliance reports under `/reports/`.

### 3.3 Exception Handling
Any deviation from this workflow MUST:
- Be approved by the Owner and Approver of the affected repository.
- Be documented in a dedicated `exceptions.md` file.
- Reference the corresponding Issue and commit hash.

## 4. Compliance
Compliance with this standard is **mandatory** for all contributors.  
Non-compliance may result in:
- PR rejection by Governance Agent or human Reviewer.
- Flagging in compliance reports.
- Required corrective commits or documentation amendments.

---

# Implementation Notes
- Automation via Governance Agent (AG) will enforce branch, commit, and PR validation automatically in Phase II.
- GitHub Actions MAY serve as interim enforcement for CI/CD compliance.
- This document supersedes any previously informal or ad hoc branching practices.

# Changelog
- **1.0.0** — Initial draft version authored under Phase II Governance initiative.

# References
- [STD-001 – Documentation Standard]  
- [STD-002 – Standards Governance Policy]  
- [docs/roadmap_v2.1.md]  
- [Phase II GitHub Issue – RAG 2.0 Expansion & Governance Automation]