---
id: TPL-PRJ-ARCH-OPTIONS
title: Architecture options analysis template
version: 0.1.2
category: project
status: draft
owner: sh4i-yurei
reviewer: sh4i-yurei
approver: sh4i-yurei
last_updated: 2026-01-13
extends: [STD-001, STD-021]
tags: [template, architecture, options, decision]
---
# Purpose

Provide a structured template to compare architecture options and record
the decision rubric that drives selection.

# Scope

Use for Tier 2 and Tier 3 changes or any decision that alters system
architecture, boundaries, or non-functional requirements.

# Standard

## Decision context

Describe the decision being made, why now, and what triggers it.

## Requirements and constraints

Summarize key requirements, constraints, and assumptions from the PRD,
System Design, and security/operability standards.

## Options overview

- Option A: <summary>
- Option B: <summary>
- Option C: <summary> (optional)

## Evaluation criteria (decision rubric)

List criteria and how each will be scored or assessed. Include SLI/SLO,
security, operability, cost, and delivery risk considerations as
applicable.

| Criteria | Weight | Option A | Option B | Option C |
| --- | --- | --- | --- | --- |
| <criterion> | <weight> | <score> | <score> | <score> |

## Option analysis

For each option, capture trade-offs, risks, and impacts on operability
and security.

### Option A

- Strengths:
- Risks:
- Trade-offs:
- Open questions:

### Option B

- Strengths:
- Risks:
- Trade-offs:
- Open questions:

## Recommendation and rationale

State the selected option, why it wins given the rubric, and what risks
must be mitigated.

## Links and evidence

- System Design: <link>
- ADRs: <list>
- Threat model: <link>
- SLI/SLO artifacts: <link>
- Supporting data or benchmarks: <links>

# Implementation Notes

- Keep one decision per analysis to maintain traceability.
- Update the analysis if constraints or requirements change.

# Continuous Improvement and Compliance Metrics

- Track how often decisions are reversed or reworked.

# Compliance

Significant architectural decisions without an options analysis are
non-compliant.

# Changelog

- 0.1.2 - Set owner/reviewer/approver values.
- 0.1.1 - Added owner/reviewer/approver frontmatter fields.

- 0.1.0 - Initial draft.
