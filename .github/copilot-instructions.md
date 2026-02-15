# Copilot Review Instructions

## Repository Purpose

This repository is an **engineering knowledge base (KB)** containing
standards, workflows, templates, and governance documents. The primary
content is Markdown, YAML, and JSON configuration. The repo also
contains shell scripts (under `scripts/`) and CI workflow definitions
(under `.github/workflows/`) — review these for correctness and
security when changed.

Review PRs for document structure, cross-reference accuracy, version
discipline, and formatting compliance. For script and workflow changes,
also review for correctness and safe shell practices.

## Repository Structure

| Directory | Content |
|-----------|---------|
| `00_Orientation/` | Onboarding and getting-started guides |
| `01_Governance/` | Policies (release, issue management, change control) |
| `02_Documentation_Standards/` | Documentation quality and structure rules |
| `03_Engineering_Standards/` | Coding standards, testing, security, AI rules |
| `04_Design_Framework/` | Design-first model, specs, ADRs, review checklists |
| `05_Dev_Workflows/` | SDLC, CI/CD, git workflow, doc change workflow |
| `06_Projects/Templates/` | Templates for all artifact types |

## Document Structure (STD-001)

Every governed document MUST have YAML frontmatter with these fields:

```yaml
---
id: STD-XXX          # unique identifier
title: Document Title
version: X.Y.Z       # semver
category: governance|engineering|design|workflow|project|core|orientation|reference
status: draft|review|active|deprecated
approver: sh4i-yurei
reviewer: sh4i-yurei
owner: sh4i-yurei
last_updated: YYYY-MM-DD
extends: [STD-000]       # parent standard(s)
tags: [relevant, tags]
---
```

Required top-level sections in governed documents:

1. Purpose
2. Scope
3. Standard (main body)
4. Implementation Notes
5. Continuous Improvement and Compliance Metrics
6. Compliance
7. Changelog

Flag documents missing any of these sections.

## Version and Changelog Discipline (STD-033)

- Version format is **semver** (MAJOR.MINOR.PATCH).
- The most recent Changelog entry MUST match the `version` in frontmatter.
- The `last_updated` date MUST reflect when the version was last changed.
- Substantive content changes require a version bump. Typo fixes and
  formatting-only changes do not.
- If the PR changes document content but does not bump the version or
  update the changelog, flag it.

## Cross-Reference Validation

- Internal links between documents MUST use **relative paths** from the
  linking document's location (e.g., `../01_Governance/Policy.md`).
- Standard IDs referenced in prose (e.g., "per STD-032") MUST correspond
  to a real document in this repository. Flag references to nonexistent
  standard IDs.
- Template references MUST point to existing files under
  `06_Projects/Templates/`.
- Links MUST NOT use absolute filesystem paths or bare URLs to other
  documents within this repo.

## Template Standards

Templates live in `06_Projects/Templates/` and have their own frontmatter
conventions:

```yaml
---
id: TPL-XXX-NAME      # TPL- prefix, not STD-
title: Template Name
version: X.Y.Z
category: project|design|architecture|governance|template|reference
status: active
owner: sh4i-yurei
reviewer: sh4i-yurei
approver: sh4i-yurei
last_updated: YYYY-MM-DD
extends: [STD-001, ...]
tags: [template, ...]
---
```

- Template `id` MUST use the `TPL-` prefix.
- Placeholder syntax should be consistent within each template (e.g.,
  `<placeholder>` or `[placeholder]`).
- Templates MUST include Purpose and Scope sections explaining when and
  how to use the template.

## Formatting and Linting Rules

This repo enforces markdownlint (see `.markdownlint.yaml`) and cspell
(see `.cspell.json`). Key rules to watch for:

- **ATX-style headings only** — use `#` syntax, never underline style.
- **Bold text as pseudo-headings is allowed** (MD036 disabled) — the
  repo uses emphasis for classification labels. Do not flag this pattern.
- **No trailing whitespace.** Files MUST end with a single newline.
- **Inline HTML is allowed** (MD033 disabled) for template placeholders.
- **Duplicate headings are allowed** (MD024 disabled) since gates and
  standards reuse headings like "Purpose" and "Scope."
- **Long lines are allowed** (MD013 disabled) for URLs and tables.

If a PR introduces words not in `.cspell.json` and those words are
legitimate technical terms, suggest adding them to the dictionary rather
than flagging as errors.

## YAML Files

- All YAML files (including frontmatter blocks) MUST be valid YAML.
- Frontmatter delimiters are `---` on their own lines.
- yamllint validation is enforced in CI. Watch for trailing spaces,
  inconsistent indentation, and missing quotes around special characters.

## Commit and PR Conventions

- **Conventional Commits**: `type(scope): summary`
- Common types for this repo: `docs`, `chore`, `fix`, `feat`
- PR descriptions should state which standards (by ID) are added or
  modified.
- One logical change per PR is preferred. A PR that modifies five
  unrelated standards should be questioned.

## What NOT to Flag

- This is a documentation-only repo. Do not flag the absence of unit
  tests, type annotations, or code coverage.
- Do not suggest converting Markdown content into code or data structures.
- Do not flag the use of RFC 2119 keywords (MUST, SHOULD, MAY) as style
  issues — they are intentional normative language.
- Do not flag `extends` as a list in frontmatter — it is intentionally
  an array.

## Review Priorities

When reviewing a PR, prioritize issues in this order:

1. **Structural compliance** — missing frontmatter fields, missing
   required sections, malformed YAML
2. **Version/changelog consistency** — version bump without changelog,
   changelog without version bump, date mismatches
3. **Cross-reference accuracy** — broken links, references to
   nonexistent standards or templates
4. **Content accuracy** — contradictions with other standards,
   underspecified requirements, ambiguous normative language
5. **Formatting** — markdownlint violations, spelling, whitespace
