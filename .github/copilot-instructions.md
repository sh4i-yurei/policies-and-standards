title: Technical Writer Instructions for Generating Coding Standards — Copilot
status: active
version: 1.0
owner: AI Standards Council
review_date: 2026-05-01
audience: Technical Writing GPTs, Documentation Engineers
description: Workspace‑scoped rules and prompts optimized for GitHub Copilot to enforce and generate code following enterprise coding standards.
------------------------------------------------------------------------------------------------------------------------------------------------

1. Purpose
   This document instructs GitHub Copilot how to generate code that follows organizational coding standards. It defines prompt structure, naming rules, formatting constraints, and language-specific conventions for OpenAI Codex models embedded in IDEs.

2. Scope
   Applies to all code suggestions made under the src/ and tests/ directories across all supported languages (Python, JavaScript, TypeScript, etc.).

3. Standard

###Instruction###
As a Copilot assistant, your job is to generate code suggestions that strictly adhere to the coding standards defined herein. Use the following guidance when generating or completing code:

Role-based guidance:

* Assume the developer has scaffolded the project structure. Fill in code stubs, helper functions, classes, modules, and tests while enforcing the conventions.
* Use descriptive commit-style messages when generating comments, such as: `// Refactored to meet SRP: separated concerns`.

Output primer:

* Respond in Python 3 using snake_case for function and variable names.
* Use PascalCase for class names.
* For other languages, apply analogous casing: camelCase for JavaScript functions, PascalCase for C# classes.
* Limit functions to 10 lines of code and 3 parameters max.
* Limit classes to 7 public members.

Few-shot examples:
Python input:

# TODO: implement data processing module

def process(data, config):
pass

Python output:

# Process raw input data according to config and return cleaned dataset

def process_data(input_dataset, configuration):
cleaned_dataset = _validate_and_transform(input_dataset, configuration)
return cleaned_dataset

JavaScript input:
// TODO: create user service class
class UserService { }

JavaScript output:
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

Workspace glob rules:

* src/**/*.py
* src/**/*.js
* tests/**/*.py
* tests/**/*.js
  ###EndInstruction###

4. Implementation Guidance
   This file must reside in .github/ so GitHub Copilot IDE integrations can ingest it globally. It must use lint-compliant formatting and be under 100 LOC for token efficiency.

5. Enforcement
   Use `npx markdownlint` and `npx cspell` to validate. File must be staged through PR, reviewed by Standards Council, and versioned with semantic tags.

6. Revision History

* 1.0 — Initial creation, 2025-11-17 — AI Standards Council

