---
id: STD-036
title: Incident response workflow
version: 1.0.3
category: workflow
status: active
approver: sh4i-yurei
reviewer: sh4i-yurei
owner: sh4i-yurei
last_updated: 2026-02-12
extends: [STD-003, STD-010]
tags: [incident, workflow, operations]
---

# Purpose

Define a lightweight incident response workflow for governed systems.

# Scope

Applies to operational incidents, outages, and security-impacting events.

# Standard

## 1. Severity levels

- Sev-1: critical outage, data loss, or security breach. Immediate
  response required.
- Sev-2: degraded service, major defect, or partial outage. Same-day
  response required.
- Sev-3: minor disruption or localized defect. Response within two
  business days.

## 2. Roles and responsibilities

- Incident lead (IC): owns coordination and decisions.
- Communications lead: manages stakeholder updates.
- Scribe: captures timeline, actions, and evidence.
- Subject matter owner: executes remediation steps.

In solo practice, one person may hold all roles but MUST capture the
same artifacts.

## 3. Workflow steps

1. Detect and triage the incident.
2. Declare severity and open an incident issue.
3. Contain impact and document immediate actions.
4. Mitigate or remediate, then validate the fix.
5. Confirm service recovery and monitor stabilization.
6. Record resolution, root cause, and follow-up actions.
7. Conduct a post-incident review for Sev-1 and Sev-2 incidents using
   [incident_postmortem_tpl](../06_Projects/Templates/operations/incident_postmortem_tpl.md).
8. Communicate status and impact to stakeholders.
9. Update runbooks, specs, and monitoring as needed.
10. If the incident is a vulnerability, follow
    [vulnerability-management-workflow](vulnerability-management-workflow.md) for remediation and release.

## 4. Incident checklist

- Issue created and linked to impacted services.
- Severity assigned and reviewed.
- Impacted systems and user paths identified.
- Mitigation actions recorded with timestamps.
- Validation evidence captured (logs, metrics, dashboards).
- Rollback readiness confirmed.
- Post-incident review recorded (Sev-1/2 required) using
  [incident_postmortem_tpl](../06_Projects/Templates/operations/incident_postmortem_tpl.md).
- Communication or status note recorded.
- Monitoring window confirmed.

## 5. Post-incident review requirements

5.1 Capture a timeline, root cause, and contributing factors using the
incident postmortem template.  
5.2 Identify detection gaps and update alerts or SLIs/SLOs.  
5.3 Record corrective actions with owners and due dates.  
5.4 Update runbooks and specs to prevent recurrence.

## Definition of done

- Incident resolved or contained.
- Root cause documented.
- Follow-up issues created and prioritized.
- Sev-1/2 review completed or scheduled.
- Runbook referenced or updated (use
  [runbooks_tpl](../06_Projects/Templates/operations/runbooks_tpl.md) for new scenarios).

## Links

- [Issue_and_Change_Management_Policy](../01_Governance/Issue_and_Change_Management_Policy.md)
- [SDLC_With_AI](SDLC_With_AI.md)
- [Release_Management_Policy](../01_Governance/Release_Management_Policy.md)
- [CI_CD_Pipeline_Model](CI_CD_Pipeline_Model.md)
- [vulnerability-management-workflow](vulnerability-management-workflow.md)
- Incident postmortem template:
  [incident_postmortem_tpl](../06_Projects/Templates/operations/incident_postmortem_tpl.md)
- Runbook template: [runbooks_tpl](../06_Projects/Templates/operations/runbooks_tpl.md)
- Related runbooks

# Implementation Notes

- Use time-shifted review if working solo.
- Capture evidence and decisions for traceability.
- Validate recovery with logs, metrics, or dashboards over a defined window.
- Record Quint decision notes for major incidents or hotfixes.

# Continuous Improvement and Compliance Metrics

- Track incident frequency, resolution time, and recurrence rate.
- Use findings to improve reliability.

# Compliance

Incidents without documented outcomes are non-compliant.

# Changelog
- 1.0.3 - Set owner/reviewer/approver values.

- 1.0.2 - Replaced template paths with KB links.
- 1.0.1 - Marked draft and added post-incident template reference.
- 1.0.0 - Activated after review with vulnerability linkage.
- 0.3.1 - Linked vulnerability workflow for security incidents.
- 0.3.0 - Expanded roles, review requirements, and evidence capture.
- 0.2.1 - Added review rule, comms, and monitoring window.
- 0.2.0 - Expanded incident workflow and checklist.
- 0.1.0 - Initial draft.
