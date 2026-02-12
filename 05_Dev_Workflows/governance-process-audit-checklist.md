---
id: STD-059
title: Governance process audit checklist
version: 0.1.2
category: workflow
status: active
approver: sh4i-yurei
reviewer: sh4i-yurei
owner: sh4i-yurei
last_updated: 2026-02-12
extends: [STD-002, STD-003, STD-032]
tags: [governance, audit, checklist, workflow]
---

# Purpose

Provide a lightweight checklist to verify governance and process
compliance across standards, workflows, and required artifacts.

# Scope

Use quarterly or before major releases to spot gaps in governance,
workflow readiness, and AI-assisted development compliance.

# Standard

## Audit checklist

### Governance and standards

- Active/review standards have current `last_updated` dates.
- Draft standards are not referenced as mandatory controls.
- Required templates exist for each standard that calls for one.
- Cross-links resolve correctly (no missing or renamed targets).

### Workflow readiness

- Release, incident, and vulnerability workflows align in status.
- Operational readiness checklist is present and referenced by releases.
- Design review checklist is used in Tier 2/3 design flow.

### Required artifacts and pointers

- Repos include `AGENTS.md`, `.kb/ai-context.yaml`, and PR templates.
- KB integration standard is linked from SDLC and contributing docs.
- Context packs exist for active projects and are current.

### Tooling and checks

- [Tooling_Inventory](../03_Engineering_Standards/Tooling_Inventory.md) reflects current approved tools.
- Linting/spell-check expectations are explicit or intentionally scoped.

### AI-assisted development controls

- Prompts reference approved specs and standards.
- Schema definitions exist for changed contracts or models.
- ADRs are recorded for breaking or cross-boundary changes.

# Implementation Notes

- Keep findings short and actionable; open follow-up issues for gaps.
- Re-run after major updates to governance standards or workflows.

# Continuous Improvement and Compliance Metrics

- Track audit completion rate and closure time for findings.

# Compliance

Projects that skip required audits or fail to address critical gaps are
non-compliant.

# Changelog
- 0.1.2 - Linked tooling inventory.
- 0.1.1 - Set owner/reviewer/approver values.

- 0.1.0 - Initial draft.
