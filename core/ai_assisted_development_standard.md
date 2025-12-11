---
id: STD-004
title: AI Assisted Development Standard
version: 1.0.1
category: ai_tooling
status: active
last_updated: 2025-12-10
extends: []
tags: [ai, assisted_development, tooling, governance]
owner: AI Standards Council
review_date: 2026-05-01
audience: Technical Writing GPTs, Documentation Engineers
description: Standards governing the safe, compliant, and maintainable use of AI systems for assisted software development across all IDEs and LLM environments.
---

# Purpose
This standard instructs AI-assisted development systems how to generate code
that meets organizational coding standards. It defines prompt expectations,
naming rules, formatting constraints, and language conventions for
IDE-embedded AI models and LLM agents.

# Scope
This standard applies to every AI-assisted development suggestion that targets
files under the `src/` and `tests/` directories across all supported languages
(Python, JavaScript, TypeScript, and others). The guidance governs both inline
completions and multi-file proposals issued within organizational repositories.

# Standard

## 1. Instruction Block
1.1 AI-assisted development guidance MUST be encapsulated between `###Instruction###` and
`###EndInstruction###` markers so IDE agents can parse policies consistently.
1.2 The instruction block MUST direct AI-assisted development tooling to enforce every clause contained
in this standard as well as the repository-wide conventions defined in STD-005.
1.3 Each iteration of the instruction block MUST include the statement "As an
AI-assisted development agent, your job is to generate code suggestions that
strictly adhere to the coding standards defined herein."

## 2. Role-Based Guidance
2.1 AI-assisted development agents MUST assume that developers have already scaffolded the project
structure and ONLY provide helper functions, classes, modules, or tests that fit
within that scaffold.
2.2 AI-assisted development agents MUST favor descriptive commit-style comments such as
`// Refactored to meet SRP: separated concerns` whenever commentary is needed.
2.3 AI-assisted development agents MUST base every recommendation on the principle that the code will
be reviewed and executed inside enterprise-controlled CI pipelines.

## 3. Output Primer
3.1 When responding in Python, AI-assisted development agents MUST use snake_case names for functions
and variables and limit each function to ten lines with no more than three
parameters.
3.2 When defining Python classes, AI-assisted development agents MUST apply PascalCase naming and keep
public members at or below seven.
3.3 AI-assisted development agents MUST map casing conventions to other languages (camelCase for
JavaScript functions, PascalCase for C# classes, and so on) and ensure each
language variant honors the same line-count and parameter constraints.

## 4. Few-Shot Examples
4.1 AI-assisted development agents MUST treat the following Python example as canonical guidance:

```python
# Process raw input data according to config and return cleaned dataset

def process_data(input_dataset, configuration):
    cleaned_dataset = _validate_and_transform(input_dataset, configuration)
    return cleaned_dataset
```

4.2 AI-assisted development agents MUST treat the following JavaScript example as canonical guidance:

```javascript
/**
 * UserService
 * Manages user creation, retrieval, and deletion. Adheres to SRP.
 */
class UserService {
    constructor(userRepository) {
        this.userRepository = userRepository
    }

    async createUser(userData) {
        return await this.userRepository.add(userData)
    }
}
```

## 5. Workspace Rules
5.1 AI-assisted development agents MUST only emit completions that target the following workspace
globs: `src/**/*.py`, `src/**/*.js`, `tests/**/*.py`, and `tests/**/*.js`.
5.2 Suggestions for other directories MUST be declined with a note directing the
user to repository owners for approval.
5.3 Generated content MUST assume dependencies already exist and therefore MUST
avoid altering package manifests unless an explicit snippet requests it.

## 6. Compliance Limits
6.1 AI-assisted development agents MUST track function length, parameter count, and public member
limits as described in clauses 3.1 through 3.3 and MUST refuse partial
completions that violate those limits.
6.2 AI-assisted development agents MUST decline to introduce global state, MUST surface dependency
injection patterns whenever shared resources are referenced, and MUST point
users to STD-005 for project-wide conventions.

## 7. AI-Assisted Development Prompt Block
7.1 The following instruction block MUST be provided verbatim to AI-assisted
development tooling in IDE configuration so the assistant can enforce clauses
1.1 through 6.2.

<!-- markdownlint-disable MD020 -->
###Instruction###
As an AI-assisted development agent, follow all organizational coding and
governance standards.
As an AI-assisted development agent, your job is to generate code suggestions
that strictly adhere to the coding standards defined herein. Use the guidance in
this document when generating or completing code and treat clauses 1.1 through
6.2 as binding requirements.
###EndInstruction###
<!-- markdownlint-restore -->

# Implementation Notes

- This document resides under `core/` so it inherits repository governance and
  version control. IDE-level prompt files SHOULD reference this standard by ID.
- Teams MAY mirror the `###Instruction###` block inside `.github/copilot.yml`
  or equivalent IDE configuration so AI-assisted development tooling always loads the latest guidance.
- Authors SHOULD keep examples under 100 lines to preserve token efficiency.

# Compliance

- Markdown content MUST pass `npx markdownlint "**/*.md"` and `npx cspell
  "**/*.md"` before review. Repeat findings in other documents do not exempt
  this standard.
- Pull requests referencing this standard MUST cite Issue and PR links per
  STD-003 and note reviewer sign-off by the AI Standards Council.

# Changelog

- 1.0.1 — Renamed to AI Assisted Development Standard and expanded scope beyond Copilot on 2025-12-10.
- 1.0.0 — Initial release authored by the AI Standards Council on 2025-11-17.

Reference: core/ai_assisted_development_standard.md (STD-004)
