---
id: TPL-CI-CODERABBIT-STANDARDS
title: CodeRabbit standards template
version: 0.1.0
category: template
status: active
owner: "<owner>"
reviewer: "<reviewer>"
approver: "<approver>"
last_updated: "<YYYY-MM-DD>"
tags: [template, coderabbit, gate-g, review]
---

# CodeRabbit Standards — \<project-name\>

Place this file at `.coderabbit/standards.md` in the project root.
CodeRabbit reads it via `knowledge_base.code_guidelines` and applies
these rules during review (both CLI and manual GitHub review).

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

# Changelog

- 0.1.0 — Initial template.
