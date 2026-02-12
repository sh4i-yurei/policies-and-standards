---
id: TPL-PRJ-KB-CONTEXT
title: KB AI context config template
version: 0.1.3
category: project
status: active
owner: sh4i-yurei
reviewer: sh4i-yurei
approver: sh4i-yurei
last_updated: 2026-02-12
extends: [STD-001, STD-056]
tags: [template, kb, config, ai]
---
# Purpose

Provide a repo-local configuration file that points to the KB and lists
applicable standards for AI-assisted work.

# Scope

Use in all governed repositories. Save as `.kb/ai-context.yaml`.

# Standard

## Template

```yaml
kb:
  source: "<kb repo, URL, or local path>"
  ref: "<tag or branch>"
  root: "<kb root path>"
  index: "<none or path>"

governance:
  applicable_standards:
    - "<STD-000>"
    - "<STD-004>"
    - "<STD-032>"
  required_artifacts:
    - "<project_charter>"
    - "<technical_spec>"
  exceptions:
    - scope: "<optional>"
      rationale: "<optional>"
      approved_by: "<name>"
      approved_on: "<date>"

agent_workflow:
  retrieval_required: true
  cite_kb_sources: true
  context_pack_required: true
  context_pack_path: "AI_CONTEXT.md"
```

# Implementation Notes

- Keep this file small and update it when KB references change.

# Continuous Improvement and Compliance Metrics

- Track repos missing or drifting from the KB reference.

# Compliance

Repositories without a `.kb/ai-context.yaml` are non-compliant.

# Changelog

- 0.1.3 - Set owner/reviewer/approver values.
- 0.1.2 - Added owner/reviewer/approver frontmatter fields.

- 0.1.1 - Added context pack path to align with AI context template.
- 0.1.0 - Initial draft.
