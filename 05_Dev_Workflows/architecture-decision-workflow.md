---
id: STD-047
title: Architecture decision workflow
version: 0.1.3
category: workflow
status: draft
approver: sh4i-yurei
reviewer: sh4i-yurei
owner: sh4i-yurei
last_updated: 2026-01-13
extends: [STD-020, STD-021, STD-024]
tags: [adr, decisions, design, workflow]
---
# Purpose

Define how architectural decisions are captured, reviewed, and linked so
system intent remains explicit and traceable.

# Scope

Applies to all significant architectural decisions for Tier 2 and Tier 3
changes.

# Standard

## Workflow steps

1. Identify a decision that affects architecture, boundaries, or
   non-functional requirements.
2. Capture options and evaluation criteria using
   [architecture-options-analysis_tpl](../06_Projects/Templates/architecture/architecture-options-analysis_tpl.md).
3. Draft an ADR using [adr_tpl](../06_Projects/Templates/architecture/adr_tpl.md).
4. Link the ADR and options analysis to the System Design.
5. Review the ADR with the Design Review Checklist.
6. Record approval or rejection and update decision status.

## Definition of done

- Architecture options analysis exists and follows the approved template.
- ADR exists and follows the approved template.
- ADR and options analysis are linked from the System Design.
- Review outcome recorded with date and approver.
- Any follow-up actions are logged as issues.
- Superseded ADRs are marked and linked when decisions change.

# Implementation Notes

- Use one ADR per decision and avoid bundling unrelated choices.
- For Tier 1 changes, capture decisions inline only when needed.

# Continuous Improvement and Compliance Metrics

- Track ADR creation latency and rework frequency.
- Review how often ADRs are revisited or superseded.

# Compliance

Architectural changes without a recorded ADR are non-compliant.

# Changelog
- 0.1.3 - Set owner/reviewer/approver values.

- 0.1.2 - Replaced template paths with KB links.
- 0.1.1 - Added superseded ADR recording.
- 0.1.0 - Initial draft.
