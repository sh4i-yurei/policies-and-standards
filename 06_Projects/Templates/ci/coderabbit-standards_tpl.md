---
id: TPL-CI-CODERABBIT-STANDARDS
title: CodeRabbit standards template
version: 0.1.0
category: template
status: active
owner: sh4i-yurei
reviewer: sh4i-yurei
approver: sh4i-yurei
last_updated: 2026-02-27
extends: [STD-030]
tags: [template, coderabbit, gate-g, review]
---

# Purpose

Provide a template for `.coderabbit/standards.md` — the file CodeRabbit
reads via `knowledge_base.code_guidelines` to apply project-specific
review rules. Used by both the local CLI and manual GitHub reviews.

# Scope

All governed repositories that have a `.coderabbit.yaml` configuration.

# Standard

Place this file at `.coderabbit/standards.md` in the project root.

Only include **specific, mechanically-checkable rules**. Vague
instructions like "write clean code" produce no improvement.

## How to populate

1. Identify the KB standards that apply to this project (check
   `AI_CONTEXT.md` for applicable rule packs).
2. For each standard, extract the rules that a code reviewer can
   verify by reading a diff — not rules that require running the code.
3. Write each rule as a single sentence with a clear pass/fail
   criterion.

## Document conventions

<!-- Replace with project-specific rules. Examples below. -->

- YAML frontmatter MUST include: id, version, last\_updated.
- Cross-references MUST use relative markdown links.
- Changelog entry REQUIRED when version is bumped.

## Code conventions

<!-- Replace with project-specific rules. Examples below. -->

- Type hints REQUIRED on all public function signatures.
- No bare `except:` or `except Exception: pass`.
- No `import *`.
- Errors MUST be wrapped with context (e.g.,
  `fmt.Errorf("context: %w", err)` in Go,
  `raise ValueError("context") from e` in Python).

## Architecture gates

<!-- Replace with project-specific ADR enforcement rules. Example: -->

- Flag imports of \<prohibited-library\> per ADR-NNN.

## Workflow conventions

- GitHub Actions MUST pin actions to SHA or major version tag.
- Shell scripts MUST use `set -euo pipefail`.
- No hardcoded secrets or tokens.

# Implementation Notes

- Keep rules concise — one sentence per rule.
- Avoid duplicating rules that linters already enforce (e.g., ruff
  handles import ordering, no need to add it here).
- Update this file when ADRs or standards change.

# Continuous Improvement and Compliance Metrics

- Track false positive rate from CodeRabbit findings referencing
  these rules. Remove rules that consistently produce false positives.

# Compliance

Governed repositories without `.coderabbit/standards.md` are missing a
required Gate G artifact per STD-030.

# Changelog

- 0.1.0 — Initial template.
