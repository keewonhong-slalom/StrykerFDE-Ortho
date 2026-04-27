# Stryker Use Case Scoring — Ortho JR Labeling AI

**Date:** April 27, 2026  
**Audience:** Internal AI Consulting Team  
**Source:** Ortho JR Labeling Deep Dive — April 27, 2026  
**Author:** AI Consulting Team

**Scoring Guide:** Each question scored 1–5. Bucket Aggregate = average of question scores. Weighted Score = Aggregate × Bucket Weight. Final Score = sum of Weighted Scores (max = 70).

| Bucket | Weight | Scale |
|--------|--------|-------|
| VALUE | 5 | 1 = no clear value → 5 = high efficiency / significant revenue or risk impact |
| COST | 2 | 1 = very costly → 5 = very affordable |
| EFFORT | 3 | 1 = most difficult → 5 = easiest |
| REACH | 4 | 1 = most niche → 5 = broad and reusable |

> **Unknown items:** Annual new label volume (UC3 VALUE), metrics baseline (all UCs), Accuris pipeline details (UC4). Scores for those questions are conservative estimates or marked N/A.

---

## Summary Scorecard

| Use Case | VALUE Agg | ×5 | COST Agg | ×2 | EFFORT Agg | ×3 | REACH Agg | ×4 | **Final /70** |
|----------|-----------|-----|----------|-----|------------|-----|-----------|-----|--------------|
| UC1: Label Modification & Review | 3.71 | 18.6 | 2.67 | 5.3 | 3.63 | 10.9 | 4.00 | 16.0 | **50.8** |
| UC3: New Label Creation & Verification | 3.43 | 17.1 | 2.83 | 5.7 | 3.75 | 11.3 | 3.60 | 14.4 | **48.5** |
| UC2: Label System Migration QA | 4.00 | 20.0 | 1.83 | 3.7 | 1.63 | 4.9 | 4.00 | 16.0 | **44.5** |
| UC4: International Compliance Assurance | 3.00 | 15.0 | 1.67 | 3.3 | 1.50 | 4.5 | 3.40 | 13.6 | **36.4** |

> **Interpretation:** UC1 and UC3 are the near-term opportunities — both are prototypable now, have accessible data, and the infrastructure is shared. UC2 has the highest raw VALUE but is blocked until 2027; the EFFORT and COST scores sink its composite. UC4 is a long-term strategic play but is effectively un-prototypable today.

---

## UC1: Label Modification & Review

### VALUE (Weight: 5)

| # | Question | Score | Rationale |
|---|----------|-------|-----------|
| 1 | Who is the audience? Who is impacted? How many users? | **3** | Core users: Labeling team + RA (~10–25 people). Relatively small audience, but each review requires coordination across both teams. |
| 2 | What are the 2–3 friction points? What happens if unaddressed? | **4** | (1) Two independent reviews (Labeling + RA) per label cycle — doubles labor. (2) Multi-function coordination for 9 approvers on new labels. (3) Errors not caught until late preview stage. If unaddressed: review continues as a bottleneck, delays regulatory compliance cycles. |
| 3 | How impactful is the challenge? What is the pain? | **4** | Historical benchmarks confirm real, large-scale pain: Brexit (1,487 hrs), CE Removal (314 hrs), MRI (221 hrs) — all wasted on manual diff-checking. |
| 4 | What is the speed benefit? | **5** | 120× speedup: 10 min/label → 5 sec/label. Combined Labeling + RA savings: ~332 hours per 1,000 labels reviewed. One of the strongest speed cases in the portfolio. |
| 5 | What is the cost of a false positive / false negative? What is the current efficacy? | **4** | FN risk is LOW — existing second review layer backstops any misses. FP risk is MINIMAL — reviewer confirms no change, mirroring current manual step. Current process works but is slow. |
| 6 | Can we measure success? What are the OKRs/KPIs? | **3** | Metrics are clear (review cycle time, hours saved, error catch rate), but are not currently tracked. Baseline will need to be established before ROI can be measured. |
| 7 | How much human intervention is needed in the end-goal? | **3** | Some human oversight still required: exception review, compliance cert sign-off, edge cases. Not zero-touch, but significantly reduced from today. |
| — | **Bucket Aggregate** | **3.71** | |
| — | **Weighted Score** (×5) | **18.6** | |

---

### COST (Weight: 2)

| # | Question | Score | Rationale |
|---|----------|-------|-----------|
| 1 | What is the cost of making this production-ready? | **2** | Validated custom solution required — Copilot (not validated, large PDF issues) and Adobe Acrobat DC (highlights entire label, no report) both evaluated and ruled out. Medical device validation overhead is significant. |
| 2 | How hard is it to create the production data pipeline? | **3** | Multi-modal inputs (structured Excel + semi-structured label image/PDF) but both are well-defined. Moderate complexity. |
| 3 | Is there a UI needed? What does it need to demonstrate? | **3** | Yes — lightweight upload UI (Source of Truth + label preview → comparison report). Not complex, but must be built. |
| 4 | How well-defined is the business case? How long until benefit is realized? | **4** | Very well-defined: time studies done, historical benchmarks exist, comparator tools evaluated. Benefit realized as soon as labels start being revised post-deployment. |
| 5 | Are there regulatory hurdles? How might they impact timeline and complexity? | **2** | Tool requires formal validation in a medical device context. onePLM cert integration format is unknown. Both add timeline and complexity risk. |
| 6 | Are metrics being tracked now, or does tracking need to be built? | **2** | Not currently tracked (or unknown). Tracking infrastructure will need to be built alongside the tool. |
| — | **Bucket Aggregate** | **2.67** | |
| — | **Weighted Score** (×2) | **5.3** | |

---

### EFFORT (Weight: 3)

| # | Question | Score | Rationale |
|---|----------|-------|-----------|
| 1 | Can we build a prototype in 48 hrs / 1 week / 2 weeks? | **4** | Yes — brief estimates 1–2 weeks for an end-to-end prototype on a before/after label example. |
| 2 | What are the risks that would prevent prototype completion? | **3** | Main risks: (1) defining "same vs. different" rules before building; (2) securing sample before/after label examples. Both are manageable with Stryker cooperation. |
| 3 | What does the prototype need to demonstrate? What is the happy path? | **4** | Clear happy path: ingest Source of Truth (Excel) + label preview (PDF/image) → structured comparison report flagging diffs. Well-scoped. |
| 4 | Does the data exist today in accessible form? | **4** | Source of Truth: yes (Excel). Label previews: yes (accessible from Prisym). Need to secure before/after revision examples, but they should exist. |
| 5 | How data-dependent is the use case? | **4** | Highly data-dependent, but data exists today. Dependency is on access, not on something not yet created. |
| 6 | What is the volume and quality of the data? Is it structured? | **3** | Source of Truth: structured Excel (high quality). Label outputs: semi-structured PDF/image (requires OCR or rendering logic). Good overall but adds complexity on the label side. |
| 7 | What system is the data in? Can we access it? Can we get a working sample? | **3** | Prisym 1.6 for label outputs; Excel for Source of Truth. System access not yet confirmed — needs to be secured from Stryker. |
| 8 | Is the data disparate or in one area? | **4** | Two well-defined sources (Excel + Prisym). Not highly disparate. Clean pairing mechanism exists (label content form ↔ label output). |
| — | **Bucket Aggregate** | **3.63** | |
| — | **Weighted Score** (×3) | **10.9** | |

---

### REACH (Weight: 4)

| # | Question | Score | Rationale |
|---|----------|-------|-----------|
| 1 | How reusable is the solution across teams or use cases? | **5** | JR + Trauma + global labeling platform. Same core AI directly reusable for UC2 (System Migration QA). Maximum reuse potential. |
| 2 | Does this amplify AI strategy throughout Stryker? | **4** | Positions AI as a validated compliance tool — a category Stryker needs to establish. Directly aligns with the Innovation Excellence AI Survey mandate. |
| 3 | Is this a business strategic priority? | **3** | Operational efficiency and compliance are priorities, but this is not a top-line growth initiative. Score is honest about its position in the org's priority stack. |
| 4 | Does this involve key partnerships or represent a quick win? | **4** | Quick win: 1–2 week prototype, accessible data, clear ROI. Could demonstrate a win before the System Migration project needs it in 2027. |
| 5 | How does the prototype prove the business case beyond the immediate use case? | **4** | The same prototype directly challenges the $247,560 Falcon Tool cost for System Migration. Proves value at scale before the migration even starts. |
| — | **Bucket Aggregate** | **4.00** | |
| — | **Weighted Score** (×4) | **16.0** | |

### **UC1 Final Score: 50.8 / 70**

---

## UC3: New Label Creation & Verification

### VALUE (Weight: 5)

| # | Question | Score | Rationale |
|---|----------|-------|-----------|
| 1 | Who is the audience? Who is impacted? How many users? | **3** | Labeling team + 9 cross-functional approvers who sign off on the Label Content Form. ~10–25 people, similar to UC1. |
| 2 | What are the 2–3 friction points? What happens if unaddressed? | **4** | (1) Upload file errors caught only at label preview — late and expensive to fix. (2) 9 approvers waste review time on preventable upload issues. (3) Manual upload file creation is error-prone (typos, wrong template). |
| 3 | How impactful is the challenge? What is the pain? | **3** | 27.6 hours saved per 100 labels — meaningful, but annual label creation volume is unknown. Score would increase significantly with volume data; conservatively scored without it. |
| 4 | What is the speed benefit? | **4** | Upload creation: 3 hrs → 8 min (22× speedup). Label review: 25 hrs → 8 min per 100 labels. Strong speed benefit even at unknown volume. |
| 5 | What is the cost of a false positive / false negative? | **4** | FN: low — downstream review acts as backstop. FP: minor — reviewer confirms no issue (same as current process). Low error cost overall. |
| 6 | Can we measure success? What are the OKRs/KPIs? | **3** | Clear metrics: upload file error rate, rework cycles, creation time. But volume unknown; full ROI cannot be quantified yet. |
| 7 | How much human intervention in the end-goal? | **3** | Final approval still required. AI removes the rework loop and upload file mistakes, but humans own the sign-off. |
| — | **Bucket Aggregate** | **3.43** | |
| — | **Weighted Score** (×5) | **17.1** | |

---

### COST (Weight: 2)

| # | Question | Score | Rationale |
|---|----------|-------|-----------|
| 1 | What is the cost of making this production-ready? | **3** | Moderate — reuses UC1 infrastructure (comparison engine, report generation, cert output). Not net-new build. |
| 2 | How hard is it to create the production data pipeline? | **4** | All inputs are structured Excel files. Straightforward pipeline compared to UC1's multimodal requirement. |
| 3 | Is there a UI needed? | **3** | Yes — similar to UC1: upload Source of Truth + translation file → validated upload file + report. Not complex. |
| 4 | How well-defined is the business case? How long until benefit is realized? | **3** | Process improvement is clear, but ROI is partially undefined (annual volume unknown). Benefit realized quickly once deployed. |
| 5 | Are there regulatory hurdles? | **2** | Same validation requirement as UC1. Regulatory integration (Accuris) explicitly scoped out of V1, which reduces complexity. |
| 6 | Are metrics being tracked now? | **2** | Not tracked (or unknown). Must be built. |
| — | **Bucket Aggregate** | **2.83** | |
| — | **Weighted Score** (×2) | **5.7** | |

---

### EFFORT (Weight: 3)

| # | Question | Score | Rationale |
|---|----------|-------|-----------|
| 1 | Can we build a prototype in 48 hrs / 1 week / 2 weeks? | **4** | Yes — 1–2 week prototype per brief. Strong candidate. |
| 2 | What are the risks that would prevent prototype completion? | **3** | Upload file format variation across product lines; need end-to-end sample data. Manageable if Stryker provides examples. |
| 3 | What does the prototype need to demonstrate? | **4** | Clear: ingest Source of Truth (Label Content Form) + translation file → validate upload file against source, flag discrepancies. |
| 4 | Does the data exist today in accessible form? | **3** | Source of Truth and upload files exist. End-to-end examples have not yet been secured — minor blocker. |
| 5 | How data-dependent is the use case? | **4** | Yes, but data exists in structured form. Standard templates confirmed. |
| 6 | What is the volume and quality of the data? Is it structured? | **4** | All inputs are structured Excel. High quality. |
| 7 | What system is the data in? Can we access it? | **4** | Excel-based; should be readily accessible. Lower access friction than Prisym-dependent use cases. |
| 8 | Is the data disparate or in one area? | **4** | Two documents (Label Content Form + translation file) → one output (upload file). Well-defined, minimal dispersion. |
| — | **Bucket Aggregate** | **3.75** | |
| — | **Weighted Score** (×3) | **11.3** | |

---

### REACH (Weight: 4)

| # | Question | Score | Rationale |
|---|----------|-------|-----------|
| 1 | How reusable is the solution across teams or use cases? | **4** | Reuses UC1 infrastructure. Applicable to Trauma (labeling translations). Broader than a single team but narrower than UC1's full reuse story. |
| 2 | Does this amplify AI strategy throughout Stryker? | **3** | Yes, but as a supporting use case to UC1 rather than a standalone AI strategy anchor. |
| 3 | Is this a business strategic priority? | **3** | Operational efficiency priority. Not a marquee initiative. |
| 4 | Does this involve key partnerships or represent a quick win? | **4** | High prototypability with structured data. Quick win candidate alongside UC1. |
| 5 | How does the prototype prove the business case beyond the immediate use case? | **4** | Combined with UC1, tells the complete labeling AI lifecycle story: creation → review → revision → migration. |
| — | **Bucket Aggregate** | **3.60** | |
| — | **Weighted Score** (×4) | **14.4** | |

### **UC3 Final Score: 48.5 / 70**

---

## UC2: Label System Migration QA

### VALUE (Weight: 5)

| # | Question | Score | Rationale |
|---|----------|-------|-----------|
| 1 | Who is the audience? Who is impacted? How many users? | **3** | Labeling team + IT/migration team + compliance + RA. Similar core audience size to UC1. |
| 2 | What are the 2–3 friction points? What happens if unaddressed? | **5** | (1) 12K labels cannot feasibly be reviewed manually during migration — would take ~19 months. (2) Falcon Tool costs $247,560 and may flag entire labels due to design differences. (3) ETL errors are invisible until label preview. If unaddressed: high human error risk at scale, budget drain, migration timeline risk. |
| 3 | How impactful is the challenge? What is the pain? | **5** | 3,000 hours of review time for full catalog. Direct financial comparison: custom AI vs. $247K Falcon Tool. Highest-scale pain point in the portfolio. |
| 4 | What is the speed benefit? | **5** | 3,000 hours → 16 hours. ~187× speedup. Most extreme speed benefit of all four use cases. |
| 5 | What is the cost of a false positive / false negative? | **3** | FN cost is HIGH — a bad label reaching production is a compliance/safety risk. Current efficacy: no automation exists. The risk adds consequence; however, the AI's job is to catch what humans would miss anyway. |
| 6 | Can we measure success? | **4** | Clear metrics: labels reviewed, errors caught, time saved, cost vs. Falcon Tool baseline. |
| 7 | How much human intervention in the end-goal? | **3** | Flagged items still require human review. Bulk validation is automated but exceptions are human-owned. |
| — | **Bucket Aggregate** | **4.00** | |
| — | **Weighted Score** (×5) | **20.0** | |

---

### COST (Weight: 2)

| # | Question | Score | Rationale |
|---|----------|-------|-----------|
| 1 | What is the cost of making this production-ready? | **1** | Very high. Requires bulk export infrastructure from two Prisym systems, one of which doesn't exist yet. Highest production cost of the four use cases. |
| 2 | How hard is it to create the production data pipeline? | **1** | Very hard. Needs programmatic access to both Prisym 1.6 and Prisym 360 (not yet available), plus a label identifier to pair records across systems. |
| 3 | Is there a UI needed? | **3** | Batch-oriented UI concept is relatively straightforward (upload old set, upload new set, get report). UI itself is not the complexity. |
| 4 | How well-defined is the business case? How long until benefit is realized? | **2** | Business case is clear, but benefit not realized until mid-2027+. Long runway reduces near-term score. |
| 5 | Are there regulatory hurdles? | **2** | Compliance cert requirement; full tool validation needed. Same as UC1 but with additional system integration complexity. |
| 6 | Are metrics being tracked now? | **2** | Not tracked now. Must be built. |
| — | **Bucket Aggregate** | **1.83** | |
| — | **Weighted Score** (×2) | **3.7** | |

---

### EFFORT (Weight: 3)

| # | Question | Score | Rationale |
|---|----------|-------|-----------|
| 1 | Can we build a prototype in 48 hrs / 1 week / 2 weeks? | **2** | Very difficult now. Blocked by Prisym 360's non-existence. Could only simulate with synthetic or mock label pairs — limits fidelity. |
| 2 | What are the risks that would prevent prototype completion? | **1** | Primary blocker: the target system (Prisym 360) does not exist yet. Cannot prototype against real data. |
| 3 | What does the prototype need to demonstrate? | **2** | Complex — requires label pairing mechanism (identifier mapping), bulk comparison, and a report. Happy path unclear without seeing both systems. |
| 4 | Does the data exist today in accessible form? | **1** | No — Prisym 360 label data does not exist. Prisym 1.6 data exists but access not yet confirmed. |
| 5 | How data-dependent is the use case? | **2** | Completely dependent on having both label sets. Cannot function at all without both sides. |
| 6 | What is the volume and quality of the data? | **2** | 12K labels / 90 templates — significant volume; structured but needs Prisym export access. |
| 7 | What system is the data in? Can we access it? | **1** | Prisym 1.6: accessible (TBC). Prisym 360: not yet available. |
| 8 | Is the data disparate or in one area? | **2** | Two different systems with different formats. Dispersion adds integration complexity. |
| — | **Bucket Aggregate** | **1.63** | |
| — | **Weighted Score** (×3) | **4.9** | |

---

### REACH (Weight: 4)

| # | Question | Score | Rationale |
|---|----------|-------|-----------|
| 1 | How reusable is the solution across teams or use cases? | **5** | If Prisym 360 rolls out globally, all Stryker labeling divisions benefit. Deck explicitly notes: "All divisional labeling teams could benefit." |
| 2 | Does this amplify AI strategy throughout Stryker? | **5** | Embeds AI in the SDLC of a major global infrastructure migration. High strategic amplification. |
| 3 | Is this a business strategic priority? | **4** | Yes — tied to the Prisym 360 migration, which is a funded strategic initiative with a defined timeline. |
| 4 | Does this involve key partnerships or represent a quick win? | **2** | Not a quick win. Requires 2027 timeline alignment. No near-term delivery. |
| 5 | How does the prototype prove the business case beyond the immediate use case? | **4** | Demonstrates AI can replace the Falcon Tool at lower cost and higher accuracy — a replicable model for any large-scale system migration. |
| — | **Bucket Aggregate** | **4.00** | |
| — | **Weighted Score** (×4) | **16.0** | |

### **UC2 Final Score: 44.5 / 70**

---

## UC4: International Compliance Assurance

### VALUE (Weight: 5)

| # | Question | Score | Rationale |
|---|----------|-------|-----------|
| 1 | Who is the audience? Who is impacted? How many users? | **3** | RA team + Labeling team. Small audience (~10–25 people), but high-stakes function. |
| 2 | What are the 2–3 friction points? What happens if unaddressed? | **4** | (1) Manual monitoring of global standards across multiple markets is incomplete. (2) RA is reactive — learns of regulatory changes after the fact rather than monitoring proactively. (3) CIDT assessments are manual and time-intensive. If unaddressed: compliance gaps and potential label non-compliance. |
| 3 | How impactful is the challenge? What is the pain? | **4** | Compliance risk if regulatory changes are missed. High consequence, even if low frequency. |
| 4 | What is the speed benefit? | **N/A** | No time study data available. Cannot score. |
| 5 | What is the cost of a false positive / false negative? | **2** | FN cost is HIGH — a missed regulatory change could mean non-compliant labels remain in the market. This is the highest-consequence error case in the portfolio. Score is lower because the risk magnitude is significant. |
| 6 | Can we measure success? | **3** | Can measure cycle time from standard change to labeling assessment. No baseline data established yet. |
| 7 | How much human intervention in the end-goal? | **2** | RA must own the final compliance assessment. AI can surface and summarize changes but cannot replace the regulatory judgment call. High residual human involvement. |
| — | **Bucket Aggregate** (excl. Q4) | **3.00** | Averaged over 6 scored questions. |
| — | **Weighted Score** (×5) | **15.0** | |

---

### COST (Weight: 2)

| # | Question | Score | Rationale |
|---|----------|-------|-----------|
| 1 | What is the cost of making this production-ready? | **1** | Very high. Accuris licensing constraints and encryption make ingestion design unclear. Significant legal/technical barriers to resolve before build begins. |
| 2 | How hard is it to create the production data pipeline? | **1** | Very hard. Accuris data is encrypted on download — cannot simply ingest. Pipeline design is undefined. |
| 3 | Is there a UI needed? | **4** | Minimal UI — output is a structured comparison report. Lower UI complexity than other use cases. |
| 4 | How well-defined is the business case? | **2** | Early stage. No time study data; unclear what "success" looks like at a quantified level. |
| 5 | Are there regulatory hurdles? | **1** | Extremely high. The AI tool assessing regulatory compliance must itself be validated — a recursive validation challenge. |
| 6 | Are metrics being tracked now? | **1** | Not tracked. Must be built from scratch. |
| — | **Bucket Aggregate** | **1.67** | |
| — | **Weighted Score** (×2) | **3.3** | |

---

### EFFORT (Weight: 3)

| # | Question | Score | Rationale |
|---|----------|-------|-----------|
| 1 | Can we build a prototype in 48 hrs / 1 week / 2 weeks? | **1** | Not feasible without resolving Accuris access. No prototypable path today. |
| 2 | What are the risks that would prevent prototype completion? | **1** | Accuris encryption is a hard blocker. Even if licensed, integration path is undefined. |
| 3 | What does the prototype need to demonstrate? | **2** | Vague — depends on Accuris output format and what "change detection" looks like in practice. Needs more discovery before a happy path can be defined. |
| 4 | Does the data exist today in accessible form? | **1** | Accuris downloads exist but are encrypted. Cannot access without resolving licensing architecture. |
| 5 | How data-dependent is the use case? | **2** | Completely dependent on Accuris access. Without it, there is no use case. |
| 6 | What is the volume and quality of the data? | **2** | Unknown — encrypted. Cannot assess. |
| 7 | What system is the data in? Can we access it? | **1** | Accuris (licensed). Integration path completely undefined. |
| 8 | Is the data disparate or in one area? | **2** | Accuris standards + corporate SOPs + labeling procedures across global markets. Multiple disparate sources. |
| — | **Bucket Aggregate** | **1.50** | |
| — | **Weighted Score** (×3) | **4.5** | |

---

### REACH (Weight: 4)

| # | Question | Score | Rationale |
|---|----------|-------|-----------|
| 1 | How reusable is the solution across teams or use cases? | **5** | If built, applicable to all global labeling teams across all Stryker divisions. Maximum reuse potential. |
| 2 | Does this amplify AI strategy throughout Stryker? | **5** | Proactive compliance monitoring is a high-differentiation AI capability. Positions Stryker ahead of the regulatory change curve. |
| 3 | Is this a business strategic priority? | **3** | Medium. Not a burning platform today — RA manages the current process — but it is a real risk. |
| 4 | Does this involve key partnerships or represent a quick win? | **1** | Not a quick win. Long timeline, hard blocker on data, no near-term delivery path. |
| 5 | How does the prototype prove the business case beyond the immediate use case? | **3** | Complements New Label Creation — regulatory requirements fed directly into creation workflow. But standalone, it's less proven. |
| — | **Bucket Aggregate** | **3.40** | |
| — | **Weighted Score** (×4) | **13.6** | |

### **UC4 Final Score: 36.4 / 70**

---

## Prioritization Recommendation

| Rank | Use Case | Score | Rationale |
|------|----------|-------|-----------|
| **1** | UC1: Label Modification & Review | **50.8** | Best overall balance of value, accessibility, speed to prototype, and reuse. Build first. |
| **2** | UC3: New Label Creation & Verification | **48.5** | Strong second candidate. Reuses UC1 infrastructure — high efficiency to build in parallel or immediately after. |
| **3** | UC2: System Migration QA | **44.5** | Highest raw VALUE but blocked by 2027 dependency. Revisit when Prisym 360 data is accessible. UC1 prototype de-risks it. |
| **4** | UC4: International Compliance Assurance | **36.4** | Highest strategic ceiling but lowest near-term prototypability. Deprioritize until Accuris access path is resolved. |

### Open Scoring Gaps (would change scores if resolved)
| Gap | Affects | Direction if Resolved |
|-----|---------|----------------------|
| Annual new label creation volume | UC3 VALUE Q3, Q6 | Likely UP — if volume is >500/yr, ROI case strengthens significantly |
| Current review cycle time baseline | All UCs VALUE Q6, COST Q6 | UP — establishes trackable baseline, improves measurability scores |
| Prisym export access confirmation | UC1, UC2 EFFORT Q7 | UP for UC1 if confirmed; UC2 is still blocked regardless |
| Accuris integration architecture | UC4 COST Q1, Q2, EFFORT Q4 | UP if encryption barrier resolved; DOWN further if it can't be unlocked |
| onePLM cert format requirements | All UCs COST Q5 | UP if format is simple; DOWN if requires significant integration |

---

*Sources: April 27, 2026 Ortho JR Labeling Deep Dive; AI in Labeling — Case Study 1.pptx; Stryker Use Case Scoring Template*
