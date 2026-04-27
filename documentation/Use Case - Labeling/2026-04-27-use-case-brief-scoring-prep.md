# Ortho Labeling AI — Use Case Brief & Scoring Prep

**Date:** April 27, 2026  
**Audience:** Internal AI Consulting Team  
**Source Meeting:** Ortho JR Labeling Deep Dive — April 27, 2026  
**Stryker Attendees:** Dianet Perez, Steven Scott, Matthew Johnson, Dmytro Turchak, Alison Young  
**Author:** AI Consulting Team

---

## Executive Summary

The Stryker Ortho JR labeling team operates a complex, multi-stage label production and review process spanning 12,000+ labels across 18 languages. Three AI use cases emerged from the deep dive: **Label Modification & Review**, **Label System Migration QA**, and **New Label Creation & Verification**. The highest-confidence near-term opportunity is Label Modification & Review — the workflow is well-understood, data exists today, and the AI's job (compare source of truth to label output) is clearly scoped. System Migration is strategically significant but blocked by the 2027 timeline and absence of Prisym 360 data. New Label Creation carries meaningful complexity around regulatory lookups.

---

## Background

Stryker Ortho uses a labeling workflow built around a hierarchical chain of custody:

1. **Source of Truth** — An Excel document populated and signed off by cross-functional stakeholders (in English)
2. **Translation** — Source of truth sent to a vendor for translation into 18 languages
3. **Upload File** — Translated content loaded into the Prisym labeling system
4. **Label Preview** — The system generates a label; this is the first point where upload errors become visible
5. **Review** — Functions across the business manually review new and revised labels

Current system: **Prisym 1.6**, which contains approximately **90 label templates/formats**. Planned migration target: **Prisym 360** (Loftware), with funding approval expected in 2026 and project kickoff targeted for mid-2027. Post-migration, the team expects to consolidate to approximately 20–30 layouts to support the ETL. Regulatory standards are sourced from **Accuris** (licensed, but encrypted on download), with an internal template used to assess regulatory change impact. Labels undergo review by **9 cross-functional approvers** who sign off on the Label Content Form.

---

## Use Case #1: Label Modification & Review

### What It Is
When a label is revised (content change, regulatory update, new translation), the AI compares the updated label output against the Source of Truth document to flag discrepancies. This replaces or augments the current multi-person manual review.

### Current State
- Two layers of manual review exist today; content sign-off is cross-functional
- **Both Labeling and Regulatory Affairs (RA) conduct independent reviews** — this doubles the labor cost of every label review cycle
- There have been cases of **operations misusing labels** (wrong label applied), but label content itself is typically correct — the process works but is slow
- Reviewers from multiple functions weigh in on new labels; some functions review all labels

### Time Study (from Case Study Deck)
| Metric | Current (Manual) | AI-Assisted |
|--------|-----------------|-------------|
| Time per label (Labeling + RA combined) | ~20 min (10 min × 2 teams) | ~10 sec (5 sec × 2 teams) |
| 1,000 labels — combined Labeling + RA | ~333 hours | ~1.4 hours |
| **Savings per 1,000 labels** | — | **~332 hours** |

### Historical Project Benchmarks
These completed projects illustrate the scale of savings AI would deliver retroactively — and validate the time estimates:

| Project | Label Volume | Current Time (Combined) | AI-Estimated Time | Savings |
|---------|-------------|------------------------|-------------------|---------|
| Brexit — CE update | ~4,500 labels | ~1,500 hours | ~12.5 hours | **~1,487 hours** |
| CE Removal | ~950 labels | ~317 hours | ~2.6 hours | **~314 hours** |
| MRI Project — MR update | ~670 labels | ~223 hours | ~2 hours | **~221 hours** |

### AI's Job
| Input | Output |
|-------|--------|
| Source of Truth (Excel) | Comparison report flagging differences |
| Label Preview (from Prisym) | Certificate / documented evidence for onePLM |

### Key Design Considerations
- **Definition of "same"**: Must agree on what counts as a material difference — e.g., does repositioned text with identical content count as a mismatch?
- **False negative risk**: If AI misses a real difference, the second human review layer provides a backstop (today)
- **False positive risk**: Minimal — reviewer investigates and confirms no change; mirrors current manual step
- **"Two birds" opportunity**: Same solution can handle both routine label revisions and the post-migration QA use case below

### Open Questions
- [ ] Can we get labeled examples of revised labels — before and after?
- [ ] Can they walk us through a live comparison exercise?
- [ ] What does the ideal V1 report look like? (Different from System Migration report — changes are expected here)
- [ ] What action is taken from the report? Who receives it? Where is it stored?
- [ ] Do they have internal training documentation on the label review process?

### Scoring Prep Inputs (VALUE / COST / EFFORT / REACH)

| Dimension | Key Facts |
|-----------|----------|
| **VALUE** | Audience: Labeling team + RA + 9 cross-functional approvers. Pain: slow manual process requiring 2 independent teams (Labeling + RA) to review every label. Speed benefit: 10 min/label → 5 sec/label; ~332 hours saved per 1,000 labels. Historical benchmarks confirm savings at scale (Brexit: 1,487 hrs; CE Removal: 314 hrs; MRI: 221 hrs). FN cost is low given existing second review. Success metric: reduction in review cycle time; error catch rate. |
| **COST** | Likely needs a lightweight UI (upload Source of Truth + label preview → get report). Data pipeline: Excel + label image/PDF input. Current tools evaluated and insufficient: Copilot (not validated, can't handle large PDFs, no report output); Adobe Acrobat DC (highlights entire label area, not content-focused, no report). A validated custom solution is required. Regulatory hurdles: compliance cert must be storable in onePLM. Benefit realized: as soon as labels start being revised. |
| **EFFORT** | Source of Truth doc exists today. Label previews accessible. Prototype could demonstrate comparison on a before/after example within 1–2 weeks. Data is structured (Excel) + semi-structured (label image). Key risk: defining "same vs. different" rules before building. |
| **REACH** | Applicable to JR and potentially Trauma (labeling translations). Global labeling platform opportunity beyond JR. Reusable for System Migration QA. Supports Stryker's AI validation/compliance story. |

---

## Use Case #2: Label System Migration QA

### What It Is
When Stryker migrates 12,000 labels from Prisym 1.6 to Prisym 360, the AI validates that each label in the new system matches its counterpart in the old system — catching ETL/data transformation errors before labels go to production.

### Current State
- Migration is in planning; funding approval expected 2026, **kickoff targeted mid-2027**
- ETL transformations are expected to introduce errors, but the exact nature of those errors is unknown (system not yet up)
- **~90 templates/formats in Prisym 1.6**; expected consolidation to ~20–30 layouts in Prisym 360
- No examples of Prisym 360 labels available yet — the migration hasn't happened

### Current Options Being Evaluated (from Case Study Deck)
| Option | Description | Cost/Risk |
|--------|-------------|----------|
| **Option 1: Dedicated Resources** | Two JR labeling staff for full 12-month migration review | High human error risk; resource availability risk across fluctuating migration phases |
| **Option 2: Falcon Tool + Network Partners** | Automated comparison tool + NP labor for sample reviews (299 labels × ~8 phases) | **$247,560** for ~12K labels; risk that layout differences in Prisym 360 causes Falcon to flag everything |
| **Option 3: Custom AI Solution** | Content-focused comparison, group-based compliance reports, final certificate | TBD — this is the ask |

### Time Study (from Case Study Deck)
| Metric | Current (Manual) | AI-Assisted |
|--------|-----------------|-------------|
| Time per label | ~15 min | ~5 sec |
| 12,000 labels | ~3,000 hours (~19 months) | ~16 hours |
| **Savings for full catalog** | — | **~2,984 hours** |

### AI's Job
| Input | Output |
|-------|--------|
| Prisym 1.6 label set | Bulk comparison report across full 12K label catalog |
| Prisym 360 label set | Compliance certificate stored in onePLM |

### Key Design Considerations
- **Blocked on data**: Cannot fully test a prototype because the 360 system doesn't exist yet — we're building on assumptions about how ETL will degrade labels
- **Alternative framing**: Could reframe as "ETL validation" — verify the transformation logic is correct — rather than label-by-label comparison. This may be better scoped for the migration project.
- **Migration is phased**: Build should account for iterative validation by phase
- **Label identifier question**: Need a unique key (label ID or similar) to link old labels to new ones for comparison

### Open Questions
- [ ] Is there a label identifier that maps Prisym 1.6 labels to their Prisym 360 counterparts?
- [ ] Can we get access to the full 12K label set (or a representative sample) from Prisym 1.6?
- [ ] Could we add this validation to the SDLC/deployment process for the migration?
- [ ] What does the V1 report look like? What action is taken from it?
- [ ] What is onePLM, and what format does a stored compliance certificate need to be in?

### Scoring Prep Inputs

| Dimension | Key Facts |
|-----------|----------|
| **VALUE** | Audience: Labeling team + IT/migration team + compliance + RA. Pain: ETL errors won't surface until label preview — catching them manually across 12K labels is impractical. Speed benefit: 3,000 hours → 16 hours. Quantified alternative cost: Falcon Tool is $247,560 for 12K labels (and carries its own risks). FN cost: potentially high if a bad label makes it to production. |
| **COST** | High production readiness cost — depends on Prisym 360 access. Pipeline requires bulk label export from two systems. UI could be batch-oriented (upload old set, upload new set, get report). Benefit not realized until mid-2027+. Note: AI solution must outperform Falcon Tool on both cost and accuracy to win the business case. |
| **EFFORT** | Prototype is difficult now — no Prisym 360 data. Could simulate with synthetic label pairs. Use case is data-dependent and the primary blocker is access timing. Medium-to-high effort. |
| **REACH** | High strategic value — positions AI team as part of the migration SDLC. Reuses Label Modification & Review infrastructure. Applicable globally if Stryker expands Prisym 360 rollout. Note in deck: "All divisional labeling teams could benefit from AI-powered tools." |

---

## Use Case #3: New Label Creation & Verification

### What It Is
When a brand-new label is created, the AI assists in generating or verifying the upload file that feeds into the Prisym labeling system — catching errors before the label reaches the preview stage, where issues currently go undetected until visible.

### Current State
- New labels are created from a **source of truth Excel doc** → vendor translation → upload file → system ingestion
- Upload file errors are only caught at the **label preview** step (late in the process)
- Upload files follow a standard format (standard columns/templates); most products have a template
- **9 approvers** (the functions who completed the Label Content Form) validate new labels against source of truth
- Regulatory requirements must be reflected in the upload file; those are currently managed manually

### Time Study (from Case Study Deck)
| Metric | Current (Manual) | AI-Assisted |
|--------|-----------------|-------------|
| Upload file creation | ~3 hours | ~8 minutes |
| Label review — 100 labels | ~25 hours (100 × 15 min) | ~8.3 minutes |
| **Savings per 100 labels** | — | **~27.6 hours** |

### AI's Job
| Input | Output |
|-------|--------|
| Source of Truth (Excel) + translation file | Validated upload file ready for Prisym ingestion |
| Regulatory requirements (Accuris-sourced) | Flagged discrepancies before preview stage |

### Key Design Considerations
- **Regulatory dependency**: Regulations are sourced from Accuris (licensed, encrypted) — AI integration with Accuris outputs is a significant sub-problem. However, the team confirmed that regulatory checks happen in a separate downstream step, so an AI that improves efficiency without replacing that step still delivers value.
- **Upload file standardization**: Standard templates exist — confirms structured data input for AI, which is favorable
- **Volume question**: How many new labels are created per year? This drives the ROI case.

### Open Questions
- [ ] How many new labels are created annually? What is the current creation cycle time?
- [ ] Can we get end-to-end examples: Source of Truth doc → translation file → upload file → label output?
- [ ] Are upload file columns/templates fully standardized, or are there product-line variations?
- [ ] Does the AI need to look up regulatory requirements, or just verify they're reflected in the upload file?
- [ ] Are there 18 language versions created for every new label?

### Scoring Prep Inputs

| Dimension | Key Facts |
|-----------|----------|
| **VALUE** | Audience: Labeling team + 9 cross-functional approvers on Label Content Form. Pain: upload file errors caught late (at preview stage), wasting downstream review effort. Speed benefit: upload creation 3 hrs → 8 min; review 25 hrs → 8 min per 100 labels (~27.6 hours saved per 100 labels). FN cost: low given downstream review exists. Measurable via reduction in label rework cycles. |
| **COST** | UI needed to validate upload file against source of truth. Data pipeline: structured Excel inputs. Regulatory integration (Accuris) is a future-phase problem — V1 can omit it. Business case clearer once label creation volume is known. |
| **EFFORT** | Strong prototype candidate — structured data, standard templates, examples likely obtainable. 1–2 week prototype feasible if sample data is shared. Risk: upload file variation across product lines. |
| **REACH** | Directly reuses infrastructure from Label Modification & Review. Potentially applicable to Trauma (labeling translations). Positions Stryker AI team to own the full labeling lifecycle. |

---

## Use Case #4: International Compliance Assurance

### What It Is
AI monitors and assesses changes to international regulatory standards and corporate SOPs, flagging impacts on labeling procedures and JR labels — currently a manual RA-led activity.

### Current State
- **RA monitors regulatory changes** and notifies Labeling of potential impact
- Labeling then assesses procedures and labels for compliance
- **CIDT process** (Change Implementation Decision Task): reviews corporate procedure changes and evaluates alignment with labeling procedures and JR labels
- Standards sourced from Accuris (licensed, encrypted on download)

### AI's Job
| Input | Output |
|-------|--------|
| Current + updated international standards (Accuris) | Change comparison report with highlighted deltas |
| Current + updated corporate SOPs | Impact assessment on labeling procedures + JR labels |
| Global regulatory data by market | Market-specific intelligence report flagging required label updates |

### AI Opportunity Areas (from Case Study Deck)
1. **Standards & Procedure Change Assessment** — Compare current vs. updated versions of international standards and corporate procedures; detect and highlight changes; assess impact on labeling and JR labels
2. **Market-Specific Intelligence** — Analyze global regulatory data, extract region-specific labeling requirements, identify discrepancies, and flag required updates proactively

### Key Design Considerations
- **Accuris access is encrypted**: Downloaded standards are encrypted to prevent sharing — AI integration needs to operate within that licensing constraint
- **RA is the current owner**: Any AI output here needs to fit into RA's workflow, not replace it — the value is speed and completeness of change detection
- **Proactive vs. reactive**: AI could shift RA from reactive (notified of change) to proactive (monitoring and flagging before formal notification)

### Open Questions
- [ ] Can AI access or ingest Accuris standard exports given the encryption constraint?
- [ ] What is the current cycle time from a regulatory change being issued to Labeling being notified?
- [ ] Is the CIDT process documented in a way that could inform AI change assessment logic?
- [ ] How many regulatory changes per year require a labeling assessment?

### Scoring Prep Inputs

| Dimension | Key Facts |
|-----------|----------|
| **VALUE** | Audience: RA team + Labeling team. Pain: manual monitoring of global standards is incomplete and reactive. Speed benefit: faster change detection, reduced risk of non-compliance. Success metric: reduction in time from standard change to labeling assessment. |
| **COST** | Accuris licensing and encryption constraints are the primary blocker. No time study data available yet. UI likely minimal — output is a structured report. Regulatory validation of AI output is a significant hurdle. |
| **EFFORT** | High data dependency on Accuris access. Can't prototype without resolving licensing. Lowest near-term prototypability of the four use cases. |
| **REACH** | Highest strategic value if it works — proactive compliance monitoring is a differentiator. Applicable across all labeling teams globally. Pairs naturally with New Label Creation (reg requirements fed directly into creation workflow). |

---

## Cross-Cutting Themes & Observations

| Theme | Detail |
|-------|--------|
| **"Two birds, one solution"** | Label Review and System Migration share the same AI core (compare two label representations). Build once, apply to both. |
| **Data availability gradient** | New Label Creation and Label Modification & Review can be prototyped now. System Migration is blocked until mid-2027. |
| **Regulatory decoupling** | Regulatory standards (Accuris) integration adds significant complexity. V1s across all use cases should decouple from regulatory checks — those happen downstream anyway. |
| **onePLM compliance cert** | Across use cases, a documented AI-generated certificate needs to be storable in onePLM. Need to understand format requirements. |
| **Language scope** | 18 languages across all labels. Are all equally prevalent? Targeting a subset (e.g., English + top 3 languages) for V1 reduces scope significantly. |
| **AI excellence team** | Who owns AI internally at Stryker? JR & TE are Ortho leads. Trauma owns labeling translations. Alignment with the internal AI innovation team is a dependency as we move toward validation. |
| **Current tools are insufficient** | Both Copilot and Adobe Acrobat DC have been evaluated and ruled out. **Copilot**: not validated for label verification, can't handle large PDFs, no report generation. **Adobe Acrobat DC**: highlights entire label area (not content-focused), no report output. Neither can serve as formal evidence of label verification. A purpose-built validated solution is required. |
| **Other processes in scope (future)** | The team flagged additional processes where AI may add value: Translations Verification, Project Scope Assessments, Life Cycle Codes Assessment, Budget Evaluation, and Product Documentation Assessments (DIOVV, GIA, MDR Files). Not prioritized for this engagement but worth noting for roadmap planning. |

---

## Recommended Next Steps

1. **Obtain sample data** — Source of Truth Excel, label images (before/after revision), and upload files. This is the gating item for all three use cases.
2. **Define "same vs. different"** — Facilitate a working session with Stryker to agree on comparison rules before building any logic.
3. **Prioritize Label Modification & Review for a 1-week prototype** — Strongest data availability, clearest scope, immediate business value.
4. **Defer System Migration** until Prisym 360 data is accessible; revisit when migration project funding is confirmed.
5. **Clarify onePLM** — Understand the format, access model, and what constitutes "documented evidence" for stored compliance certs.
6. **Scope the AI validation path** — Understand what it takes to get an AI-generated comparison report accepted as a documented review in Stryker's quality system.

---

*Sources: April 27, 2026 Ortho JR Labeling Deep Dive meeting notes (Rachel); AI in Labeling — Case Study 1.pptx (Innovation Excellence AI Survey, June 11, 2025); Stryker Use Case Scoring Template*
