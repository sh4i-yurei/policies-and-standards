---
id: STD-053
title: Security and privacy rules pack
version: 1.0.4
category: reference
status: active
approver: sh4i-yurei
reviewer: sh4i-yurei
owner: sh4i-yurei
last_updated: 2026-02-12
extends: [STD-004, STD-007, STD-032]
tags: [rules, security, privacy, prompts]
---
# Purpose

Define security and privacy rules for AI-assisted changes.

# Scope

Apply when handling authentication, authorization, secrets, or sensitive
information.

# Standard

## Governing standards

- [Security_and_Threat_Modeling_Standard](../Security_and_Threat_Modeling_Standard.md)
- [vulnerability-management-workflow](../../05_Dev_Workflows/vulnerability-management-workflow.md)
- [Coding_Standards_and_Conventions](../Coding_Standards_and_Conventions.md)
- [Data_Management_Standard](../Data_Management_Standard.md)

## 1. Threat modeling and risk

1.1 Threat models MUST be updated when security posture changes.  
1.2 Security risks MUST be recorded in the risk register.  
1.3 High-risk changes MUST include explicit mitigations.

## 2. Access control

2.1 Enforce least privilege and explicit access control checks.  
2.2 Authorization logic MUST be tested for negative cases.  
2.3 Privileged actions MUST require explicit approval.

## 3. Secrets handling

3.1 Secrets MUST be stored in approved secret managers.  
3.2 Never log secrets or sensitive data.  
3.3 Secret rotation procedures MUST be documented.

## 4. Dependencies and supply chain

4.1 New dependencies require approval and documented rationale.  
4.2 Vulnerabilities MUST be tracked and remediated per
[vulnerability-management-workflow](../../05_Dev_Workflows/vulnerability-management-workflow.md).  
4.3 Third-party licenses MUST be reviewed for compliance.

## 5. Secure coding practices

5.1 Input validation MUST occur at trust boundaries.  
5.2 Avoid dynamic code execution or unsafe deserialization.  
5.3 Sensitive data MUST be encrypted in transit and at rest.

## 6. Logging and privacy

6.1 Logs MUST exclude PII, secrets, and regulated data.  
6.2 Audit logs MUST be retained for security-relevant actions.  
6.3 Privacy requirements MUST be reflected in specs and runbooks.

## 7. Verification

7.1 Security validation MUST run for high-risk changes.  
7.2 Penetration or abuse testing SHOULD be scheduled for major releases.  
7.3 Findings MUST be recorded with owners and remediation dates.

# Implementation Notes

- Include this rule pack for any auth or sensitive data work.
- Align with [Security_and_Threat_Modeling_Standard](../Security_and_Threat_Modeling_Standard.md).

# Continuous Improvement and Compliance Metrics

Track security defects, vulnerability remediation time, and audit
findings.

# Compliance

Security-relevant changes that ignore this rule pack are non-compliant.

# Changelog

- 1.0.4 - Updated links for renamed engineering standards.
- 1.0.3 - Set owner/reviewer/approver values.

- 1.0.2 - Added governing standards links.
- 1.0.1 - Marked draft pending rules index activation.
- 1.0.0 - Promoted to active after review.
- 0.2.1 - Linked vulnerability workflow.
- 0.2.0 - Expanded security and privacy requirements.
- 0.1.0 - Initial draft.
