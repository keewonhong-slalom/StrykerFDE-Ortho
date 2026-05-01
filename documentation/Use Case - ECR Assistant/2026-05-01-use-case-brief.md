# Ortho ECR Assistant — Use Case Brief

**Date:** May 1, 2026
**Audience:** Internal AI Consulting Team
**Source Meeting:** Ortho ECR Assistant Deep Dive — May 1, 2026
**Source References:** Meeting Transcript (AI CoE FDE Deep Dive Ortho ECR Assistant); Raw Notes (ECR Assistant KH; ECR Assistant Deep Dive - VA)
**Stryker Attendees:** Ehsan Soodmand, Ryan Moss, Richie Willard
**Author:** AI Consulting Team

---

## Executive Summary

The T&E (Trauma & Extremity) division has already built and piloted an **ECR Assistant** — a Power Apps + Copilot Studio agent that reduces ECR description creation time from 15–20 minutes to 5 minutes and directly targets the root cause of **25% of all non-conformities (NCs)** in the division. The solution is working: change owners are happy, feedback loops are shortening, and the team has asked for more questions. What they need now is a **solution architecture review, proper Power Platform environment setup, and productionization hardening** to take this from a scrappy sandbox build to an enterprise-grade tool ready for rollout across 3–10 additional Stryker divisions.

---

## Background & Attendees

**Stryker SMEs:**
- **Ehsan Soodmand** — Associate Manager, R&D; Tech Lead for the AIML workstream within Falcon 2.0 (T&E digitalization program); primary use case owner; also owns change control process responsibility
- **Ryan Moss** — Developer; built the Power Apps UI and Power Automate workflow; primary technical builder and point of contact for pilot users

**Consulting Team:** Victoria Austin, Rachel James, Richie Willard, Kee-Won Hong

**Organizational Context:**
- T&E (Trauma & Extremity) and Joint Replacement divisions sit together under Ortho. Ehsan has also presented this use case to endoscopy, medical, and instruments — all expressed interest.
- This use case is part of **Falcon 2.0**, T&E's digitalization program, under the AIML workstream. The broader vision is an **AI-Powered Change Control Pipeline** that connects ECR creation through execution in a single environment.

---

## Problem Statement

### What Is an ECR?
An Enterprise Change Request (ECR) is the formal entry point into Stryker's **change control process** — any modification to an existing product, component, material, or manufacturing process must begin with an ECR. Everything is documented in **onePLM**, Stryker's product documentation system.

**Critical constraint:** ECR descriptions must describe the situation only — not proposed solutions. If a solution is mentioned in the description and the team later does not perform it, an auditor will cite it as an NC.

---

### The Core Problem: Incomplete ECR Descriptions

| Dimension | Current State |
|-----------|--------------|
| **NC Root Cause** | 25% of all NCs originate from incomplete or inaccurate ECR descriptions |
| **NC Definition** | Non-conformity: any discrepancy from defined process — e.g., laser mark placed 2mm off spec, missing approval signatures, or a description that doesn't match the action taken |
| **NC Resolution Cost** | ~3 resources × 5 hours each = **15–20 hours** per NC to document root cause, perform analysis, correct, and close — plus leadership focus and audit risk |
| **NC Threshold** | T&E dashboard: green < 5 NCs/year; yellow = 5–10; red > 10. Zero NCs at audit is the benchmark. |
| **NC Volume** | 99 of 400 changes (2025) produced NCs — a large proportion traceable back to poor ECR descriptions |
| **Back-and-Forth Loops** | CA2 (change owner) submits description → CA3 (reviewer) returns it for revision → repeat. Each loop extends change processing time. |
| **Audit Frequency** | 4–5 external audits per year in T&E alone (notified bodies: TUV, BSI, and others by country). Auditors open onePLM first; ECR description is their first review target. |

Ehsan: *"25% of the NCs that we have was just because the ECR in onePLM had no good description, and usually the auditor comes and says, 'The description was not accurate.'"*

Ryan: *"A lot of the generated responses are going to already meet all the criteria they need. So it's going to save a lot of that rework time."*

---

## What Has Been Built

The team has already built and piloted a functional ECR Assistant. The architecture is:

```
PowerApps UI  →  Power Automate  →  Copilot Studio Agent  →  Generated Description
(Change owner inputs)   (Workflow)    (15-question knowledge base + Gen AI)   (User reviews & pastes to onePLM)
```

### How It Works
1. **Change owner (CA2)** opens the PowerApps interface and fills in structured inputs: location, scope, change type (material, process, etc.), contact material change flag, and other guided fields
2. **Power Automate** orchestrates the data flow from PowerApps into the Copilot Studio agent
3. **Copilot Studio agent** leverages a knowledge base (SharePoint) and 15 guided Q&A prompts — developed with the divisional process owner (DPO) — to generate a comprehensive, compliant ECR description
4. **Human in the loop:** The generated description is surfaced to the user for review and optional manual edits. The user then copies it into onePLM.

### Human-in-the-Loop Design (Low-Risk by Design)
- The agent outputs a **description recommendation only** — it does not submit anything to onePLM automatically
- The change owner always reviews, edits, and takes ownership of the final description
- Risk is minimal because the output is advisory text, not an automated process action

### Pilot Feedback
- Change owners tested the app, provided feedback, and the team iterated
- A Power Apps UI update was released based on user feedback
- Positive NPS: users are happy with the outputs; some have requested additional questions (not fewer)
- Not yet fully launched — currently in piloting phase with targeted change owners

---

## Value Quantification

| Metric | Before | After | Savings |
|--------|--------|-------|---------|
| ECR description time | 15–20 min | ~5 min | ~15 min/ECR |
| Annual ECR volume (T&E) | 400/year | 400/year | — |
| **Annual time saved (description)** | — | — | **~100 hours/year** (400 × 15 min) |
| NC resolution effort (per NC) | 3 resources × 5 hrs = 15–20 hrs | Targeted reduction | Up to 1,500+ hrs/year avoided at full NC elimination |
| NCs caused by bad ECR descriptions | 25% of total (99 of 400) | Target: 0 | Direct KPI impact |
| Clarification loop (CA2 ↔ CA3) | Multiple rounds | Near-zero | Reduced lead time |
| Leadership distraction per NC | Significant (Richie: *"taking your eye off other things"*) | Reduced | Qualitative |

**Scale opportunity:** 15 questions are generic across all Stryker divisions — no per-division customization required for the agent knowledge base. Ehsan has already presented to endoscopy, medical, and instruments; **3–10 additional divisions** are potential adopters.

---

## Use Case: ECR Description Assistant

### What It Is
An AI agent that guides change owners through a structured 15-question input form and generates a compliant, comprehensive ECR description — reducing write time from 15–20 minutes to 5 minutes, eliminating description-related NCs, and cutting clarification back-and-forth between CA2 and CA3.

### Current State Pain Points (Summary)
- Change owners with varying expertise write descriptions of inconsistent quality
- No guardrails prevent the inclusion of proposed solutions in descriptions (which creates NC exposure)
- Reviewers (CA3) catch issues only after submission, triggering correction loops
- 99 NCs in 2025 traced back to description quality — each requiring 15–20 hours of resolution effort

### The AI's Job

| Input | Output |
|-------|--------|
| 15-question structured form (change type, scope, location, material change flag, etc.) | Generated ECR description (compliant, comprehensive) |
| DPO-approved guidance embedded in agent knowledge base | No solution-language included (architectural enforcement) |
| Historical ECR descriptions (future: AI Builder classification) | User-editable draft for copy/paste into onePLM |

### Design Principles
- **Strictly advisory** — AI generates the description; human reviews and submits
- **Situation only, no solutions** — agent is instructed to describe the change situation, never propose actions (audit-critical constraint)
- **Maintain one-PLM parity** — the 15 questions mirror the fields and considerations already expected in a good onePLM ECR entry; no new cognitive load for the user

---

## Architecture State & Known Risks

### Current Tech Stack
| Component | Tool | Status |
|-----------|------|--------|
| UI | Power Apps | Built, piloted, updated |
| Workflow | Power Automate | Built |
| AI Agent | Copilot Studio | Built; knowledge base being expanded |
| Knowledge Base | SharePoint | Active |
| System of Record | onePLM | Human pasted in; no API integration |
| AI Enhancement (planned) | AI Builder (classification, prediction, extraction) | Not yet implemented |
| Review agent (planned) | Copilot Studio agent-in-loop | Not yet implemented |

### Architecture Pain Points

| Pain Point | Detail |
|------------|--------|
| **Individual account ownership** | Power Apps components owned by individual employee accounts (Ehsan, Ryan). Person leaves → solution may break. Already happened once. |
| **Environment fragmentation** | Mix of generic Stryker env and solution-based envs. No departmental visibility into token usage, ownership, or cost. |
| **Power Apps delegation limit** | 2,001-row delegation ceiling. Other apps in the portfolio already exceed 50,000 rows. Risk increases with scale. |
| **No dev/QA/prod pipeline** | Currently sandbox/scrappy. Stryker IT offers a co-build process (dev → validation → prod), but it hasn't been formally engaged for this solution. |
| **Scrappy environment** | No formal environment provisioning — limits ability to control access, enable auditing, or support rollout to other divisions. |

Ryan: *"If it reaches a certain size, it just has to be set up a certain way."*
Ehsan: *"If they leave, I already have that issue. We came up with a very good AI solution. That person left the company and everything was gone."*

### Ehsan's Proposed Environment Model
Each department should have its own **dedicated Power Platform environment** with:
- A clearly assigned cost center (token usage, premium licenses trackable per department)
- Defined admins and access controls (not tied to individuals)
- All apps, agents, and automations owned by the environment — not by accounts

---

## What the Team Needs from Us

| Need | Detail | Priority |
|------|--------|----------|
| **Solution architecture review** | Validate current approach (PowerApps + Power Automate + Copilot Studio + SharePoint KB). Is this the right structure? What's missing? | High |
| **Environment setup guidance** | Help design and implement a proper Power Platform environment — department-scoped, with service accounts, proper admin controls, cost center assignment | High |
| **Productionization hardening** | Service accounts instead of personal accounts, dev/QA/prod pipeline via Stryker co-build process, removing single-point-of-failure dependencies | High |
| **AI Builder integration** | Extend the agent by coupling a Copilot Studio agent to AI Builder for: (1) ECR classification by type/complexity, (2) resource prediction based on historical data, (3) extraction of structured info from legacy ECRs | Medium |
| **Review agent (in-loop)** | Add a Copilot Studio agent at output stage to validate the generated description against defined criteria before surfacing to the user — catches solution language, completeness, etc. | Medium |
| **Scale roadmap** | Define the replication model for 3–10 additional divisions. The 15 questions appear generic; confirm and document the rollout pattern. | Medium |

---

## Bigger Picture: AI-Powered Change Control Pipeline

The ECR Assistant is **step 1** of a broader vision Ehsan is driving:

| Stage | Solution | Status |
|-------|----------|--------|
| **Step 1** | ECR Assistant — description generation | Built, piloting |
| **Step 2** | Real App — resource forecasting, change routing | Built (1,000+ users) |
| **Step 3** | Catalyst — GQO process improvement program | In progress |
| **Step 4** | Change Control Toolbox — process automation (no AI) | Built within Falcon |
| **Vision** | Unified entry point: change owner enters once, is guided from ECR creation through execution | Not yet built |

Ehsan: *"My ultimate goal is that I bring everything together — the user enters the process from here and goes out after execution is finished."*

---

## Open Questions

- [ ] Can we get the architecture diagram Ehsan prepared for Stryker IT? (Requested by Rachel; Ehsan agreed to include in slide deck)
- [ ] What is the actual NC breakdown by type (Major vs. IFO) for T&E 2024–2025? Process owners can provide.
- [ ] What is Stryker IT's co-build process timeline / intake requirements for a new Power Platform environment?
- [ ] Which specific divisions have been presented to (endoscopy, medical, instruments) — who are the contacts for next steps on scaling?
- [ ] Is there existing AI Builder capacity within the Stryker enterprise Power Platform subscription, or would this require additional licensing?
- [ ] What is the current content of the Copilot Studio knowledge base (SharePoint)? What additional historical ECR data is available for AI Builder training?
- [ ] Confirm: are the 15 DPO questions truly generic across all divisions, or are there division-specific variants?
- [ ] Next step: *"Connect internally, chat with Alfonso, figure out next steps."* (Victoria) — who else from the consulting team should be looped in?
