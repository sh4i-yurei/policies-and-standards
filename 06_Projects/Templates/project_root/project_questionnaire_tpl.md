---
id: TPL-PRJ-QUESTIONNAIRE
title: Project questionnaire template
version: 0.1.0
category: project
status: active
owner: sh4i-yurei
reviewer: sh4i-yurei
approver: sh4i-yurei
last_updated: 2026-02-25
extends: [STD-001, STD-032]
tags: [template, project, questionnaire, planning]
---

# Purpose

Pre-coding interview to capture project context, constraints, and
decisions before chartering or implementation. Filling this out prevents
scope drift and missed requirements.

# Scope

Fill once per project, before writing a Charter or starting Tier 2+
work. Save as `requirements.md` or attach as a Charter appendix.

# Standard

## Project questionnaire

Answer each question before starting design or implementation.

### 1. What problem does this solve?

\<Describe the problem in one paragraph. Who has this problem? How do
they cope today?\>

### 2. What does success look like?

\<Describe the end state. What can users do that they could not before?
How will you know you succeeded?\>

### 3. What is the smallest thing we can build to test the idea?

\<Describe the POC scope. What is the one feature that proves the
approach works?\>

### 4. What existing systems does this touch?

\<List repos, services, databases, APIs, and external dependencies.
Note which are owned vs. external.\>

### 5. What are the hard constraints?

\<Language, framework, hosting, budget, timeline, compliance
requirements, security mandates, or compatibility requirements.\>

### 6. What data does this handle?

\<Data types, sensitivity levels, storage requirements, retention
policies. Note PII, credentials, or regulated data.\>

### 7. Who are the users and how do they interact?

\<User types (human, agent, API consumer). Interaction patterns (UI,
CLI, API, event-driven). Expected load.\>

### 8. What are the known risks?

\<Top 3-5 risks. What could go wrong? What assumptions are unvalidated?
What dependencies could slip?\>

### 9. What prior art exists?

\<Internal: ADRs, DRRs, prior attempts, related projects. External:
open-source libraries, similar products, research papers.\>

### 10. What is explicitly out of scope?

\<List features, integrations, or behaviors that are NOT being built.
Prevents scope creep during implementation.\>

# Implementation Notes

- Not all questions need long answers. A one-sentence answer is fine
  when the answer is obvious.
- Revisit the questionnaire when scope changes significantly.
- Use answers to inform Charter sections and ExecPlan context.

# Continuous Improvement and Compliance Metrics

- Track questionnaire completion rates for Tier 2+ work.

# Compliance

The questionnaire is recommended for Tier 2 and required for Tier 3.

# Changelog

- 0.1.0 - Initial draft.
