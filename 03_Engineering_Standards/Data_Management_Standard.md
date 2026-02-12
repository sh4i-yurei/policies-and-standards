---
id: STD-044
title: Data management standard
version: 0.2.4
category: engineering
status: draft
approver: sh4i-yurei
reviewer: sh4i-yurei
owner: sh4i-yurei
last_updated: 2026-01-13
extends: [STD-000, STD-007]
tags: [data, retention, backup, recovery, governance]
---
# Purpose

Define mandatory requirements for data classification, retention,
backups, and recovery so data handling is explicit and auditable.

# Scope

Applies to all systems that store, process, or transmit data under this
governance model.

# Standard

## 1. Data classification and inventory

1.1 Data MUST be classified (public, internal, confidential, restricted)
and documented in System Design artifacts per [System_Design_Standard](../04_Design_Framework/System_Design_Standard.md).  
1.2 Systems MUST maintain a data inventory listing datasets, owners,
classification, and storage location.  
1.3 Data classification MUST be referenced in Module Design and
Technical Specification artifacts per [Module_Design_Standard](../04_Design_Framework/Module_Design_Standard.md) and
[Technical_Specification_Standard](../04_Design_Framework/Technical_Specification_Standard.md) when data handling changes.
1.4 Data schemas MUST be captured in schema definition artifacts per
[schema-definition-standard](../04_Design_Framework/schema-definition-standard.md).

## 2. Data ownership and lifecycle

2.1 Each dataset MUST have a named owner responsible for quality and
access approvals.  
2.2 Lifecycle stages MUST be documented, including creation, mutation,
archival, and deletion responsibilities.  
2.3 Deletion requirements MUST specify triggers, retention, and
verification steps.  
2.4 Legal hold or compliance exceptions MUST be documented with
expiration criteria in the [risk-register_tpl](../06_Projects/Templates/risk/risk-register_tpl.md) and referenced in
[operational_notes_tpl](../06_Projects/Templates/operations/operational_notes_tpl.md).

## 3. Storage, encryption, and transmission

3.1 Data at rest MUST be encrypted for confidential and restricted
classes.  
3.2 Data in transit MUST use approved encryption protocols.  
3.3 Key management MUST align with [Security_and_Threat_Modeling_Standard](Security_and_Threat_Modeling_Standard.md).

## 4. Access control and audit

4.1 Access controls MUST follow least-privilege principles.  
4.2 Access must be logged and auditable for confidential and restricted
data.  
4.3 Access reviews MUST occur quarterly for confidential or restricted
data and annually for internal data, or after major role changes.

## 5. Retention and deletion

5.1 Retention periods MUST be defined for each data class and enforced
by policy or automation.  
5.2 Deletion workflows MUST be documented and tested for regulated
datasets.  
5.3 Retention policy changes MUST be approved by the data owner and
recorded in the change log.

## 6. Backup and recovery

6.1 Backup requirements MUST specify frequency, storage location, and
encryption expectations.  
6.2 Recovery requirements MUST define RPO and RTO targets.  
6.3 Restore tests MUST be performed quarterly for production data and
semi-annually for non-production data, and after major schema changes.

## 7. Data quality and integrity

7.1 Data validation rules MUST be documented for critical datasets.  
7.2 Data integrity checks MUST be included in pipelines or jobs that
modify critical data.  
7.3 Data quality metrics MUST be reviewed during operational reviews.

## 8. Data migrations and change management

8.1 Data migrations MUST be documented in
[Technical_Specification_Standard](../04_Design_Framework/Technical_Specification_Standard.md) and include rollback plans.  
8.2 Backfills MUST be scoped, reversible, and validated with sampling.  
8.3 Schema compatibility MUST be maintained during staged rollouts.

## 9. Third-party data and exports

9.1 Third-party data ingestion or exports MUST document contracts,
retention, and access expectations.  
9.2 Data sharing MUST be approved through change management per
[Issue_and_Change_Management_Policy](../01_Governance/Issue_and_Change_Management_Policy.md) when it affects confidentiality
or retention.

## 10. Incident handling

10.1 Data loss or corruption incidents MUST be recorded in
[incident_response](../05_Dev_Workflows/incident_response.md) workflows and linked to remediation actions.

# Implementation Notes

- Use [operational_notes_tpl](../06_Projects/Templates/operations/operational_notes_tpl.md) and [deployment_tpl](../06_Projects/Templates/operations/deployment_tpl.md) to capture backup
  and recovery procedures.  
- Include retention and deletion strategies in
  [Technical_Specification_Standard](../04_Design_Framework/Technical_Specification_Standard.md) for data changes.  
- Track data risks in the [risk-register_tpl](../06_Projects/Templates/risk/risk-register_tpl.md) when introducing new
  storage systems.

# Continuous Improvement and Compliance Metrics

- Track backup success rates, restore test frequency, and recovery
  outcomes.
- Review retention policy adherence during quarterly audits.

# Compliance

Systems without documented data classification, retention, and recovery
requirements are non-compliant.

# Changelog
- 0.2.4 - Added traceability links and exception recording locations.
- 0.2.3 - Set owner/reviewer/approver values.

- 0.2.2 - Linked schema definition standard for data schemas.
- 0.2.1 - Added balanced access review and restore test cadences.
- 0.2.0 - Expanded classification, lifecycle, and recovery requirements.
- 0.1.0 - Initial draft.
