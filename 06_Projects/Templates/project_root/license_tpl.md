---
id: TPL-PRJ-LICENSE
title: License template
version: 0.1.2
category: project
status: draft
owner: sh4i-yurei
reviewer: sh4i-yurei
approver: sh4i-yurei
last_updated: 2026-01-13
extends: [STD-001]
tags: [template, license, legal]
---
# Purpose

Provide a placeholder template for selecting and recording a project
license.

# Scope

Use for all governed repositories.

# Standard

## Template

### License

Replace this file with the full text of the chosen license. The filename
should normally be `LICENSE`.

- License: <MIT | Apache-2.0 | other>
  - MIT: simplest and maximizes reuse.
  - Apache-2.0: adds explicit patent protection and is more
    corporate-friendly.
- Copyright: <year, owner>
- Additional notices: <if any>

Optionally add a short note near the top of the repo explaining why this
license was chosen for this project.

# Implementation Notes

- Confirm license selection before release.
- Keep the license text unchanged after selection.

# Continuous Improvement and Compliance Metrics

Track license selection during project kickoff reviews.

# Compliance

Projects without a license file are non-compliant.

# Changelog

- 0.1.2 - Set owner/reviewer/approver values.
- 0.1.1 - Added owner/reviewer/approver frontmatter fields.

- 0.1.0 — Initial draft.
