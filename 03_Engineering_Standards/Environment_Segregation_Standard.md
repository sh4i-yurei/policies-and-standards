---
id: STD-057
title: Environment segregation standard
version: 0.1.2
category: engineering
status: draft
approver: sh4i-yurei
reviewer: sh4i-yurei
owner: sh4i-yurei
last_updated: 2026-01-13
extends: [STD-000, STD-006, STD-030, STD-035]
tags: [environment, deployment, operations, release]
---
# Purpose

Define required environments and separation rules so testing and
production remain isolated.

# Scope

Applies to all governed projects that run code or host services.

# Standard

## 1. Required environments

1.1 Every governed project MUST define development, staging, and
production environments.

1.2 Development is for local or shared testing and MUST NOT host live
traffic or live data.

1.3 Staging is production-like and MUST be used to validate releases
before production promotion.

1.4 Production is the live environment serving users or systems of
record.

## 2. Environment location and ownership

2.1 Each project MUST document where each environment runs (local,
on-prem, or cloud) in the [deployment_tpl](../06_Projects/Templates/operations/deployment_tpl.md).

2.2 Production MAY be hosted on a local network or on the public web,
but its location MUST be explicit and traceable.

## 3. Container and resource labeling

3.1 If containers are used, they MUST be named or labeled with the
environment identifier `dev`, `staging`, or `prod`.

3.2 Recommended naming: `<service>-dev`, `<service>-staging`,
`<service>-prod`, or labels `env=dev|staging|prod`.

## 4. Change control

4.1 Promotions to staging or production MUST follow the
[release_workflow](../05_Dev_Workflows/release_workflow.md) and [Release_Management_Policy](../01_Governance/Release_Management_Policy.md).

4.2 Tests that alter data or availability MUST run in development or
staging only, not production.

## 5. Exceptions

5.1 If a staging environment cannot be maintained, the project MUST
record an exception in the [project_charter_tpl](../06_Projects/Templates/project_root/project_charter_tpl.md) or [deployment_tpl](../06_Projects/Templates/operations/deployment_tpl.md)
with risk acceptance and approval.

5.2 Exceptions MUST include alternative validation steps before
production promotion.

# Implementation Notes

- Use [deployment_tpl](../06_Projects/Templates/operations/deployment_tpl.md) and [operational_notes_tpl](../06_Projects/Templates/operations/operational_notes_tpl.md) to keep
  environment mapping current.

# Continuous Improvement and Compliance Metrics

- Track releases missing staging validation or unclear environment
  mapping.

# Compliance

Projects without defined environments or with unlabeled production
resources are non-compliant.

# Changelog
- 0.1.2 - Added traceability links for environment records and exceptions.
- 0.1.1 - Set owner/reviewer/approver values.

- 0.1.0 - Initial draft.
