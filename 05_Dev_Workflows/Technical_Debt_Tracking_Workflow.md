---
id: STD-064
title: Technical Debt Tracking Workflow
version: 0.1.0
category: workflow
status: draft
approver: sh4i-yurei
reviewer: sh4i-yurei
owner: sh4i-yurei
last_updated: 2026-02-15
extends: [STD-003, STD-005, STD-032]
tags: [technical-debt, workflow, quality, maintenance, refactoring]
---
# Purpose

Define how technical debt is identified, classified, tracked, and
resolved so that debt accumulation is visible, intentional, and
manageable rather than hidden and compounding.

# Scope

Applies to all governed projects. Covers code-level debt, design debt,
documentation debt, test debt, and infrastructure debt.

# Standard

## 1. Identification

1.1 Technical debt MUST be recorded when discovered, whether during
development, review, incident response, or retrospective.
1.2 Debt items MUST be captured as issues per
[Issue_and_Change_Management_Policy](../01_Governance/Issue_and_Change_Management_Policy.md)
with the label `tech-debt`.
1.3 AI-assisted development sessions MUST flag debt introduced by
expedient choices in session reviews per
[session_review_standard](session_review_standard.md).

## 2. Classification

2.1 Each debt item MUST be classified by type:

| Type | Description |
|------|-------------|
| Code debt | Shortcuts, duplication, poor abstractions, missing error handling |
| Design debt | Architectural misalignment, violated boundaries, missing abstractions |
| Test debt | Missing coverage, brittle tests, untested critical paths |
| Documentation debt | Stale docs, missing specs, undocumented behavior |
| Infrastructure debt | Manual processes, outdated dependencies, unpatched systems |

2.2 Each debt item MUST be classified by origin:

| Origin | Description |
|--------|-------------|
| Deliberate | Conscious trade-off with documented rationale |
| Accidental | Discovered after the fact, no prior intent |
| Bit rot | Accumulated through environmental change over time |

2.3 Deliberate debt MUST include a rationale and a planned resolution
timeframe at the time of introduction.

## 3. Severity and prioritization

3.1 Debt items MUST be assigned a severity based on impact:

| Severity | Criteria |
|----------|----------|
| Critical | Blocks feature development or causes production incidents |
| High | Increases defect rate or significantly slows development |
| Medium | Increases maintenance cost or developer friction |
| Low | Cosmetic or minor inconvenience with no operational impact |

3.2 Prioritization MUST consider: severity, blast radius (number of
affected components), rate of compounding, and cost to resolve.
3.3 Critical and high severity debt MUST be scheduled for resolution
within two sprints of identification.

## 4. Tracking and visibility

4.1 Debt items MUST be tracked in the project issue tracker, not in
code comments alone.
4.2 A debt summary MUST be maintained and reviewed during sprint
planning or operational reviews.
4.3 Code-level markers (e.g., `TODO(debt)` or `HACK`) MAY supplement
issue tracking but MUST NOT replace it.
4.4 Each debt item MUST reference the originating issue, commit, or
incident that created or discovered it.

## 5. Resolution workflow

5.1 Debt resolution MUST follow the same development workflow as feature
work: design (if architectural), implement, test, review, merge.
5.2 Debt resolution MUST be validated by the same quality gates defined
in [CI_CD_Pipeline_Model](CI_CD_Pipeline_Model.md).
5.3 Resolved debt MUST be closed with a reference to the resolving
commit or PR.
5.4 Resolution MUST NOT introduce new debt of equal or greater severity.

## 6. Paydown scheduling

6.1 Teams MUST allocate a recurring portion of each sprint or cycle to
debt reduction.
6.2 The allocation percentage SHOULD be proportional to the debt
inventory severity: higher debt loads warrant larger allocations.
6.3 Paydown targets MUST be set during sprint planning and tracked
through completion.
6.4 Deferred paydown MUST be documented with rationale per
[Issue_and_Change_Management_Policy](../01_Governance/Issue_and_Change_Management_Policy.md).

## 7. Prevention

7.1 Design reviews per [design_review_workflow](design_review_workflow.md)
MUST assess whether proposed changes introduce avoidable debt.
7.2 Code reviews MUST flag patterns known to generate debt (duplication,
missing abstractions, hardcoded values).
7.3 AI-assisted code generation MUST be reviewed for debt introduction
per [AI_Assisted_Development_Standard](../03_Engineering_Standards/AI_Assisted_Development_Standard.md).

## 8. Metrics and reporting

8.1 Projects MUST track:

- Total open debt items by type and severity.
- Debt introduction rate (new items per sprint).
- Debt resolution rate (closed items per sprint).
- Mean age of open debt items.

8.2 Debt metrics MUST be reviewed during retrospectives and operational
reviews per [session_review_standard](session_review_standard.md) and
[observability_and_feedback](observability_and_feedback.md).

# Implementation Notes

- Use project issue tracker labels (`tech-debt`, `deliberate`,
  `accidental`, `bit-rot`) to enable filtering and reporting.
- Record debt-related risks in the
  [risk-register_tpl](../06_Projects/Templates/risk/risk-register_tpl.md)
  when debt threatens SLOs or delivery timelines.
- Consider automated detection tools (linters, dependency scanners) to
  surface accidental and bit-rot debt.

# Continuous Improvement and Compliance Metrics

- Track debt inventory trends over time (growing, stable, shrinking).
- Review paydown allocation effectiveness quarterly.
- Correlate debt severity with incident frequency to validate
  prioritization.

# Compliance

Projects without a tracked debt inventory or without recurring paydown
allocation are non-compliant. Deliberate debt introduced without
documented rationale is non-compliant.

# Changelog

- 0.1.0 — Initial draft.
