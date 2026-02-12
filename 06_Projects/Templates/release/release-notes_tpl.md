---
id: TPL-PRJ-RELEASE-NOTES
title: Release notes template
version: 0.1.2
category: project
status: active
owner: sh4i-yurei
reviewer: sh4i-yurei
approver: sh4i-yurei
last_updated: 2026-02-12
extends: [STD-001, STD-006, STD-035]
tags: [template, release, notes]
---
# Purpose

Provide a standard release notes template to document changes and
validation evidence for each release.

# Scope

Use for all governed releases.

# Standard

## Release metadata

- Version: <semver>
- Release type: <major|minor|patch|hotfix>
- Date: <YYYY-MM-DD>
- Owner: <name>
- Environments: <dev|stage|prod>

## Summary

One paragraph describing what changed and why.

## Changes included

- Feature: <summary and link>
- Fix: <summary and link>
- Docs: <summary and link>

## Validation evidence

- CI status: <link or summary>
- Tests run: <list>
- Quint records: <links>

## Risks and mitigations

List known risks and mitigations or follow-ups.

## Rollback plan

Summarize rollback steps and data considerations.

## Post-release monitoring

Define monitoring window and key signals to watch.

# Implementation Notes

- Store release notes with the release record or tag.
- Link to the release checklist and deployment guide.

# Continuous Improvement and Compliance Metrics

- Track release note completeness and accuracy.

# Compliance

Releases without release notes are non-compliant.

# Changelog

- 0.1.2 - Set owner/reviewer/approver values.
- 0.1.1 - Added owner/reviewer/approver frontmatter fields.

- 0.1.0 — Initial draft.
