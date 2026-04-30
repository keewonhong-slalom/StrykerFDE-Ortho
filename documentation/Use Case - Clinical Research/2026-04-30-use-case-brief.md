# Ortho Clinical Research AI — Use Case Brief

**Date:** April 30, 2026
**Audience:** Internal AI Consulting Team
**Source Meeting:** Ortho Clinical Research Deep Dive — April 30, 2026
**Source Reference:** Clinical Research AI Use Case.pptx
**Author:** AI Consulting Team

---

## Executive Summary

The Stryker JR Clinical Research team performs first-pass review of clinical collateral to verify that every claim is accurate and supported by scientific evidence — a process that takes up to 5 hours per review, cannot scale, and carries direct client-facing reputational risk. Two AI use cases are scoped: **UC1: Claim Verification & Evidence Grounding** (prototype-ready, requirements already written) and **UC2: Literature Search & Reference Discovery** (gated on ReadCube API access). Notably, the team has already drafted formal user requirements for both use cases, and the internal AI team has completed a very similar prior build — the first action is to brief with Jada Berenguer before any scoping begins.

---

## Background

The JR Clinical Research team reviews marketing and product development collateral to confirm that every clinical, performance, or outcome claim is accurately supported by a referenced source. The current workflow is centered on Adobe Workfront for intake and file management, PDFs as the primary document format, and ReadCube Papers as the literature repository.

**Current workflow chain:**
1. **Intake** — Collateral document (PDF, Word, occasionally video) enters via Adobe Workfront
2. **Claim Identification** — Reviewer reads sentence by sentence, flagging all citation-relevant claims
3. **Reference Verification** — Reviewer opens each reference, finds the exact supporting passage, and verifies alignment; best practice is to highlight the passage in the paper
4. **Missing Reference Investigation** — If a reference is missing or insufficient, reviewer searches ReadCube for supporting literature and creates a reference folder in Workfront
5. **Output** — Reviewed document with Supported / Partially Supported / Not Supported designations per claim; references organized in Workfront

**Key context:**
- **Adobe Workfront integration** is possible but expensive — direct file upload is the pragmatic near-term path; Workfront is Phase 2
- **ReadCube** is the licensed literature repository; API access appears to be included in the subscription but ToS for programmatic access and non-licensed user access must be confirmed
- **Accuracy is paramount** — output is client-facing; a missed or unsupported claim is a reputational risk
- **No formal accuracy rubric today** — Supported / Partially Supported / Not Supported designations are currently semi-subjective
- **Prior internal work exists** — a chatbot on research papers for claim verification was built; contact is Jada Berenguer (AI excellence team)

---

## Use Case #1: Claim Verification & Evidence Grounding

### What It Is
AI ingests a collateral document and its reference set, automatically identifies all sentence-level citation-relevant claims, maps each claim to its supporting reference(s), highlights where in the reference the support is found, and produces a structured Reviewer Summary Table with a support classification, rationale, and AI confidence level per claim.

> *"This capability is strictly assistive. All final decisions remain with the Clinical Research reviewer."* — Case Study Deck

### Current State
- Reviewers read documents sentence by sentence — entirely manual
- Best practice is to open each reference and highlight the exact supporting passage — time-intensive
- Missing references require manual search in ReadCube
- **1 review takes up to 5 hours per group** — volume is the core scaling problem
- Limited traceability: no structured record of which passage in which reference supports which claim
- Accuracy criteria are informal; no standardized rubric exists

### AI's Job
| Input | Output |
|-------|--------|
| Collateral document (PDF / Word) | Reviewer Summary Table (see requirements below) |
| Reference folder (PDFs) | Per-claim classification: Supported / Partially Supported / Not Supported |
| | Rationale and AI confidence level per claim |
| | Highlighted passage in each reference showing where support is found |
| | Flagged claims with missing or insufficient references |

### Formal User Requirements (from Case Study Deck)

| UR# | Requirement |
|-----|-------------|
| **UR#001** | Standalone application interface that automates first-pass review. Shall not automate, replace, or bypass Regulatory, Legal, or Marketing Quality review or approval activities. |
| **UR#002** | Upload one or more collateral documents for ingestion. Upload supporting references as a separate reference folder. |
| **UR#003** | Automatically identify sentence-level clinical or performance claims (ignoring general knowledge statements), with traceability to original page/slide. Evaluate whether references support each claim. Classify as Supported / Partially Supported / Not Supported with rationale and AI confidence level. Generate Reviewer Summary Table with: page/slide number, claim text, associated reference(s), classification, rationale, AI confidence level. |

### Reviewer Summary Table — Required Columns
| Page / Slide | Claim Text | Reference(s) | Classification | Rationale | AI Confidence |
|---|---|---|---|---|---|

### Key Design Considerations
- **Accuracy rubric is a prerequisite**: The team must formally define Supported / Partially Supported / Not Supported with examples before the AI can be evaluated — this is the single highest-risk undefined requirement
- **Strictly assistive**: UR#001 explicitly prohibits bypassing Regulatory, Legal, or Marketing Quality review — scope the AI as a first-pass tool only
- **Claim identification boundary**: AI must distinguish citation-relevant claims from general knowledge statements — needs test cases to define this boundary
- **Interface**: Direct upload UI for V1 (doc + reference folder → summary table + highlights); Workfront integration is Phase 2
- **False negative risk**: Missed unsupported claim reaches client — warrants human-in-the-loop review of AI output
- **Second AI reviewer**: The team raised the idea of a second AI pass as a confidence backstop, similar to the dual-review model in the JR Labeling use case
- **Internal precedent**: Jada Berenguer built a very similar claim verification chatbot — must brief before scoping anything new

### Open Questions
- [ ] What is the current volume — how many reviews per month/quarter? How many claims per average document?
- [ ] Can we get 2–3 example collateral documents with full reference sets to prototype against?
- [ ] What are the formal criteria for Supported / Partially Supported / Not Supported? Worked examples?
- [ ] How are general knowledge statements distinguished from citation-relevant claims today?
- [ ] Is Workfront integration a V1 requirement or Phase 2?
- [ ] What did Jada Berenguer build — what model, what data, what outputs? What can be reused?
- [ ] Does Workfront have a test environment for future integration work?

---

## Use Case #2: Literature Search & Reference Discovery

### What It Is
When a claim is flagged as Partially Supported or Not Supported (or missing a reference entirely), AI searches the ReadCube library to surface up to three candidate references per claim, flags potentially outdated references where newer evidence may exist, and presents results in a structured report. In future state, the system also suggests alternative wording for unsupported claims aligned to available evidence.

### Current State
- Missing reference investigation is entirely manual via ReadCube Papers
- ReadCube's AI Assistant currently allows chatting across **only 20 documents at a time** — insufficient for full-library search
- ReadCube has an **Auto Deposit Search** feature that can automatically import new content matching saved search terms into a library — a native capability available today
- Non-CR colleagues (Marketing, Product Development) currently cannot self-serve literature requests — must route through the CR team

### AI's Job
| Input | Output |
|-------|--------|
| Claims flagged as Partially Supported, Not Supported, or missing a reference | Structured reference discovery report (see requirements below) |
| ReadCube library | Up to 3 candidate references per claim with publication date and confidence |
| | Flag for potentially outdated references where newer evidence exists |
| | Alternative claim wording suggestions aligned to available evidence (UR#004) |

### Formal User Requirements (from Case Study Deck)

| UR# | Requirement |
|-----|-------------|
| **UR#004** | For claims classified as Partially Supported or Not Supported, suggest alternative wording aligned to available evidence. |
| **UR#005** | Search ReadCube for claims missing references or supported by potentially outdated references. Suggest up to 3 candidate references per claim. Present results in a structured report including: claim identifier, page/slide number, reason for flagging, existing reference(s), suggested ReadCube reference(s) (max 3), publication date, indicator of newer evidence (Yes/No), AI confidence level, rationale. |

### Reference Discovery Report — Required Columns
| Claim | Page / Slide | Flag Reason | Existing Reference(s) | Suggested Reference(s) | Pub. Date | Newer Evidence? | AI Confidence | Rationale |
|---|---|---|---|---|---|---|---|---|

### Key Design Considerations
- **ReadCube API access gates this use case**: If programmatic access is included in the subscription (appears likely per documentation), UC2 is tractable. If not, it is blocked.
- **ToS for non-licensed users**: A stated future requirement is allowing Marketing / Product Development to self-serve from the ReadCube repository without a CR team license — ToS must be reviewed
- **ReadCube roadmap**: Their 20-document AI Assistant cap is a known limitation. Worth contacting ReadCube to understand timeline — this may be solved by the platform, changing the build vs. buy calculus
- **Auto Deposit Search as a proxy**: Could be configured today without any custom AI build to address the proactive monitoring need partially
- **Scope boundary**: UC2 is a natural extension of UC1's output — triggered by the same flagged claims rather than as a standalone search tool

### Open Questions
- [ ] ReadCube ToS: is programmatic API access permitted under the current subscription?
- [ ] ReadCube ToS: can non-licensed Marketing / Product Development users access outputs from a CR-owned system?
- [ ] Has anyone engaged ReadCube directly about their AI roadmap and the 20-document cap?
- [ ] Would the Auto Deposit Search feature address any portion of the proactive monitoring / new literature alert need?
- [ ] What search terms are currently used in ReadCube for literature discovery?

---

## Cross-Cutting Themes & Observations

| Theme | Detail |
|-------|--------|
| **Prior internal build** | A similar claim verification chatbot on research papers was built by the internal AI team. Jada Berenguer is the contact. Must brief before scoping any new build — significant re-use potential and risk of duplicating work. |
| **Requirements are already written** | The team has formal user requirements (UR#001–005) for both use cases. This is unusually advanced for a discovery session — prototype scoping can move quickly once sample data and the accuracy rubric are in hand. |
| **Accuracy formalization is the critical path** | No standardized rubric for claim support designations exists today. This must be defined collaboratively before any AI output can be validated. It is the highest-risk undefined requirement. |
| **Strictly assistive scope** | UR#001 explicitly prohibits replacing Regulatory, Legal, or Marketing Quality review. This is a firm constraint that limits the end-state automation level but reduces regulatory complexity. |
| **ReadCube as the data layer** | Both use cases depend on ReadCube. UC1 can be prototyped with PDF uploads alone; UC2 requires API access confirmation. |
| **Workfront integration** | Ideal end state but expensive. V1 = direct upload interface; Workfront = Phase 2 after value is proven. |
| **Crawl / Walk / Run** | The team named this as their lens. V1 is the simplest possible demonstration of claim-to-reference mapping on a real document. |
| **Broader applicability** | Future state includes use by other groups beyond JR CR — speed to market, audit prep reduction, self-serve literature for Marketing and Product Development. |

---

## Recommended Next Steps

1. **Brief with Jada Berenguer** — Understand the prior claim verification build before scoping anything. What was built, what worked, what can be reused.
2. **Obtain sample data** — 2–3 collateral documents with full reference sets. Gating item for UC1 prototype.
3. **Formalize accuracy criteria** — Working session with CR team to define Supported / Partially Supported / Not Supported with worked examples. This becomes the evaluation rubric for the prototype.
4. **Confirm ReadCube API access and ToS** — Verify programmatic access is permitted and whether non-licensed user access is allowed. Gates UC2.
5. **Contact ReadCube on AI roadmap** — Understand when the 20-document AI Assistant cap lifts; may change build vs. buy decision for UC2.
6. **Prototype UC1 in 1–2 weeks** — Happy path: upload collateral PDF + reference folder → Reviewer Summary Table with classification, rationale, and confidence per claim. Scope against UR#001–003.

---

*Sources: April 30, 2026 Ortho Clinical Research Deep Dive notes (KH, VA); Clinical Research AI Use Case.pptx*

---

## Executive Summary

The Stryker Ortho Clinical Research team conducts manual, time-intensive claim verification and literature review work that is directly exposed to AI automation. A single review can take up to 5 hours, accuracy is client-facing, and reputational risk from a missed or unsupported claim is significant. The primary AI opportunity is **Claim Verification & Evidence Grounding** — a use case the internal team has prior experience with — with a secondary opportunity in **Literature Search & Reference Discovery**.

---

## Background

The Clinical Research team reviews marketing and product development collateral to verify that every claim is accurately supported by a reference. The current workflow is built around Adobe Workfront for intake and file management, PDFs as the primary document format, and ReadCube Papers as the literature repository.

**Current workflow chain:**
1. **Intake** — Collateral document (PDF, Word, occasionally video) enters via Adobe Workfront
2. **Claim Identification** — Reviewer reads sentence by sentence, flagging all claims that require a reference
3. **Reference Verification** — Reviewer opens each reference, finds the exact passage supporting the claim, and verifies alignment
4. **Missing Reference Investigation** — If a reference is missing, reviewer searches ReadCube for supporting literature and creates a folder in Workfront for any found references
5. **Output** — Reviewed document with supported/partially supported/not supported designations per claim; references organized in Workfront

**Key constraints:**
- **Adobe Workfront integration** is possible but expensive — direct file upload is the pragmatic near-term path
- **ReadCube** is the licensed literature repository; API access appears to be included in the subscription but terms of service for programmatic access and non-licensed user access need confirmation
- **Accuracy is paramount** — output is client-facing; a missed or unsupported claim carries reputational risk
- **No formal accuracy rules exist today** — supported/partially supported/not supported designations are currently semi-subjective

---

## Use Case #1: Claim Verification & Evidence Grounding

### What It Is
AI ingests a collateral document and its associated reference set, identifies every claim in the document, maps each claim to its supporting reference(s), highlights where in the reference the support is found, and produces a summary table of claim-to-citation mappings with a support designation (Supported / Partially Supported / Not Supported).

### Current State
- Reviewers read documents sentence by sentence — entirely manual
- Best practice is to open each reference and highlight the exact supporting passage
- Missing references require manual search in ReadCube
- **1 review can take up to 5 hours per group** — volume is the core scaling problem
- Accuracy criteria are informal; no standardized rubric exists for Supported / Partially Supported / Not Supported

### AI's Job
| Input | Output |
|-------|--------|
| Collateral document (PDF / Word) | Claim-by-claim summary table with support designation |
| Associated reference set (PDFs) | Highlighted passage in each reference showing where support is found |
| | Flagged claims with missing or insufficient references |

### Key Design Considerations
- **Accuracy definition is prerequisite**: Before building, the team needs to agree on what "Supported," "Partially Supported," and "Not Supported" mean in terms of AI confidence — the current semi-subjective standard must be formalized
- **Interface**: Upload document + references → get highlighted output + summary table. Workfront integration is the ideal end state but expensive; direct upload UI is the right V1
- **False negative risk**: Missed unsupported claim reaches the client — reputational/compliance risk. Warrants a human-in-the-loop review of AI output, at least initially
- **Internal precedent**: The team has done a very similar use case — a chatbot on top of research papers for claim verification. Need to reconnect with **Jada Berenguer** for context and reusable components
- **Additional AI reviewer**: Having a second AI pass (similar to the dual-review model in Labeling) could provide a confidence backstop before output reaches a human

### Open Questions
- [ ] What is the current volume — how many reviews per month/quarter? How many claims per document on average?
- [ ] Can we get 2–3 example collateral documents with their reference sets to prototype against?
- [ ] What are the formal criteria for Supported / Partially Supported / Not Supported? Are there examples of each?
- [ ] What does the ideal V1 output look like — summary table only, or highlighted PDFs as well?
- [ ] Is Workfront integration a V1 requirement or a future-phase nice-to-have?
- [ ] ReadCube ToS: is programmatic access (API) permitted? Are non-licensed users allowed to access outputs?
- [ ] Who is Jada Berenguer and can we get a briefing on the prior claim verification work?

---

## Use Case #2: Literature Search & Reference Discovery

### What It Is
When a claim is flagged as missing a reference or only partially supported, AI searches the ReadCube literature library to surface candidate references — replacing the manual search step and potentially proactively monitoring for new literature that could strengthen or challenge existing claims.

### Current State
- Missing reference investigation is entirely manual via ReadCube Papers
- Reviewers utilize ReadCube's search interface to find supporting articles
- ReadCube has an **Auto Deposit Search** feature that can automatically import new content matching saved search terms into a library — a native capability that could partially address the monitoring use case
- ReadCube's AI Assistant currently allows chatting across **only 20 documents at a time** — insufficient for the scale of this use case

### AI's Job
| Input | Output |
|-------|--------|
| Claim flagged as missing or partially supported | Ranked list of candidate references from ReadCube library |
| Existing reference set | Suggested alternative or supplementary references |
| | Proactive alerts when new literature relevant to existing claims enters the library |

### Key Design Considerations
- **ReadCube API access**: If programmatic access is included in the subscription (appears likely per documentation), this use case becomes significantly more tractable
- **ReadCube roadmap**: Their AI Assistant's 20-document cap is a known limitation. Worth contacting ReadCube directly to understand their roadmap — this may be solved by the platform within 12–18 months
- **Auto Deposit Search**: Could be configured today as a lightweight proxy for proactive monitoring, without any custom AI build
- **Scope boundary**: This use case is a natural extension of UC1 — the same workflow, triggered when a claim is flagged rather than as a standalone search tool

### Open Questions
- [ ] Has anyone engaged ReadCube directly about their AI roadmap and the 20-document cap?
- [ ] What is the current process for conducting a literature search — which search terms, how results are evaluated?
- [ ] Are non-Clinical-Research colleagues (Marketing, Product Development) currently able to self-serve literature requests, or is this always routed through the CR team?
- [ ] Would the Auto Deposit Search feature address any portion of the proactive monitoring need?

---

## Cross-Cutting Themes & Observations

| Theme | Detail |
|-------|--------|
| **Prior internal work** | The team has completed a similar use case (chatbot on research papers for claim verification). Jada Berenguer is the contact. Significant re-use potential — must brief before scoping any new build. |
| **ReadCube as the data layer** | Both use cases depend on ReadCube access. Confirming API access and ToS for programmatic use is the gating dependency before prototyping UC2. UC1 can be prototyped without ReadCube if sample PDFs are provided. |
| **Accuracy formalization** | No standardized rubric for claim support designations exists. This must be defined collaboratively with the team before any AI output can be validated. It is the single highest-risk undefined requirement. |
| **Workfront integration** | Ideal end state but expensive. V1 should be a direct-upload interface; Workfront integration is a Phase 2 item once value is proven. |
| **Scale as the business driver** | Volume is the core pain — not accuracy of the current process. The team is careful today but can't scale. AI's pitch is throughput, not replacing human judgment. |
| **Crawl / Walk / Run** | The team explicitly named this as their lens. V1 should be the simplest possible demonstration of claim-to-reference mapping on a real document. |

---

## Recommended Next Steps

1. **Brief with Jada Berenguer** — Before scoping any build, understand what was built for the prior claim verification use case and what can be reused.
2. **Obtain sample data** — 2–3 collateral documents with full reference sets. This is the gating item for a UC1 prototype.
3. **Formalize accuracy criteria** — Run a working session with the CR team to define Supported / Partially Supported / Not Supported with examples. This becomes the evaluation rubric for the prototype.
4. **Confirm ReadCube API access** — Verify programmatic access is permitted under the current subscription and ToS. Gates UC2.
5. **Contact ReadCube on roadmap** — Understand when the 20-document AI Assistant cap is expected to lift; may change the build vs. buy calculus for UC2.
6. **Prototype UC1 in 1–2 weeks** — Claim identification + citation mapping on a sample document. Happy path: upload PDF + references → summary table with Supported / Partially Supported / Not Supported per claim.

---

*Sources: April 30, 2026 Ortho Clinical Research Deep Dive notes (KH, VA)*
