---
id: TOOLING-001
title: Tooling inventory
version: 1.2.0
category: reference
status: draft
approver: sh4i-yurei
reviewer: sh4i-yurei
owner: sh4i-yurei
last_updated: 2026-02-11
extends: [STD-003]
tags: [tooling, infrastructure, inventory]
---
# Purpose

This document defines the approved tools and infrastructure components available in the development environment. All development, testing, and documentation activities use tools from this inventory.

# Scope

This inventory applies to all activities within the development environment. Tool additions, replacements, or modifications follow [Issue_and_Change_Management_Policy](../01_Governance/Issue_and_Change_Management_Policy.md).

# Standard

## Languages and runtimes

- Java: OpenJDK 17.0.17 (`java`)
    
- JavaScript: Node.js v24.11.0 (`node`)
    
- TypeScript: TypeScript CLI (`tsc`)
    
- Python: 3.12.3 (`python3`)
    
- Rust: rustc 1.75.0 (`rustc`), cargo 1.75.0 (`cargo`)
    

## Build tools

- Maven: 3.8.7 (`mvn`)
    
- npm: 11.7.0 (`npm`)
    
- npx: 11.7.0 (`npx`)
    
- make: 4.3 (`make`)
    

## Documentation and validation tools

- markdownlint-cli - Markdown linting and style enforcement
    
- cspell - Spell checking across documentation
    
- markdown-link-check - Validate markdown links
    
- yamllint - YAML validation for frontmatter and configs
    
- pre-commit - Local hook runner aligned with CI gates
    
- Quint Code - Required for all code changes and validations
    

## Python development tools

- ruff - Fast Python linter
    
- black: 24.2.0 - Code formatter
    
- mypy: 1.9.0 - Type checking
    
- pytest: 7.4.4 - Testing framework
    

## Rust development tools

- rustfmt: 1.7.0 (`cargo fmt`) - Code formatter
    
- clippy: 0.1.75 (`cargo clippy`) - Linting and suggestions
    

## Core CLI utilities

- git - Version control
    
- ripgrep (`rg`) - Fast file searching
    
- jq - JSON processing and querying
    

## Containerization

- Docker Desktop: 28.5.1 - Client and server
    
- WSL Integration - Enabled for development
    

## LLM agents and AI tools

### Approved agents

- Claude Code (primary) - High-level observation, code review, task execution, multi-agent orchestration, and CLI assistance

- Codex CLI - High-level observation, code review, task execution, and CLI assistance


### Available tools

- ChatGPT - General AI assistance and ideation
    
- Perplexity - AI-assisted research and analysis
    
- GitHub Copilot - In-line code suggestions and completion
    
- KB RAG service (rag-service) - KB retrieval and source quoting
    

## Tool integration requirements

1. All tools MUST be configured to enforce standards defined in [Coding_Standards_and_Conventions](Coding_Standards_and_Conventions.md) and [Documentation_Standard](../02_Documentation_Standards/Documentation_Standard.md).
    
2. Tool configuration files MUST be version-controlled and reviewed as code.
    
3. Linting, type checking, and testing MUST execute in development workflows before merge.
    
4. Tool violations MUST block merge and release; violations MUST NOT be suppressed or overridden.
    

# Implementation Notes

- Update this inventory when approved tooling changes.
- Decommissioned tools should be moved to an archive note.

# Continuous Improvement and Compliance Metrics

- Track tooling drift and exceptions requested per quarter.

# Compliance

Use of unapproved tools or bypassing required checks is non-compliant.

# Changelog
- 1.2.0 - Removed Aider from approved agents (replaced by Claude Code agent teams).
- 1.1.0 - Added Claude Code as primary approved CLI agent.
- 1.0.4 - Added pre-commit and relocated tooling inventory.
- 1.0.3 - Set owner/reviewer/approver values.

- 1.0.2 - Added required extends metadata.
- 1.0.1 - Replaced NotebookLM with KB RAG service entry.
- 1.0.0 - Initial release. Documents current development environment tooling.
