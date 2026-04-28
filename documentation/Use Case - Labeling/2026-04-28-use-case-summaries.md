# Ortho Labeling AI — Use Case Summary Cards

**Date:** April 28, 2026
**Audience:** Internal AI Consulting Team
**Source:** Use Case Brief & Scoring Sheet — April 27, 2026
**Author:** AI Consulting Team

> Cards are ordered by composite score (highest to lowest). Scores use default weights: VALUE ×5, COST ×2, EFFORT ×3, REACH ×4. Max score = 70.

---

### UC1: Label Modification & Review

AI compares a revised label output against the Source of Truth document and flags any discrepancies, replacing the current dual manual review by Labeling and Regulatory Affairs. The process today takes ~20 minutes per label across both teams — historical projects (Brexit, CE Removal, MRI) confirm over 2,000 combined hours of avoidable review labor. Data exists today and the prototype can be scoped to 1–2 weeks; the key pre-build requirement is agreeing on the definition of "same vs. different."

| Bucket | Weight | Score (1–5) | Descriptor |
|--------|--------|-------------|------------|
| **VALUE** | 5 | 3.71 | Proven pain: 332 hrs saved per 1,000 labels; dual-team review doubles cost |
| **COST** | 2 | 2.67 | Custom validated solution required; existing tools (Copilot, Adobe) ruled out |
| **EFFORT** | 3 | 3.63 | Prototypable in 1–2 weeks; data exists, access to be confirmed |
| **REACH** | 4 | 4.00 | Reusable for JR, Trauma, System Migration QA, and global labeling teams |

> **Composite Score: 50.8 / 70**

---

### UC3: New Label Creation & Verification

AI validates the upload file generated from the Source of Truth and translation documents before it enters Prisym, catching errors that today go undetected until the label preview stage. Upload file creation drops from ~3 hours to ~8 minutes, and review of 100 labels from ~25 hours to ~8 minutes; the full ROI depends on annual new label volume (currently unknown). All inputs are structured Excel files and standard templates are confirmed, making this the cleanest data environment of the four use cases.

| Bucket | Weight | Score (1–5) | Descriptor |
|--------|--------|-------------|------------|
| **VALUE** | 5 | 3.43 | Strong speed benefit; full ROI picture requires annual label creation volume |
| **COST** | 2 | 2.83 | Reuses UC1 infrastructure; structured Excel pipeline reduces build complexity |
| **EFFORT** | 3 | 3.75 | Best-structured data of all UCs; 1–2 week prototype feasible once samples secured |
| **REACH** | 4 | 3.60 | Shares UC1 core; extends to Trauma; completes the labeling lifecycle story |

> **Composite Score: 48.5 / 70**

---

### UC2: Label System Migration QA

AI validates all 12,000 labels during the Prisym 1.6 → Prisym 360 migration, comparing each label pair and generating a bulk compliance certificate — replacing a process that would otherwise take ~3,000 hours or cost $247,560 via the Falcon Tool. The business case is the strongest in the portfolio by raw VALUE, but the use case is blocked until mid-2027 when the Prisym 360 environment exists. A prototype built for UC1 today de-risks this use case and directly challenges the Falcon Tool alternative.

| Bucket | Weight | Score (1–5) | Descriptor |
|--------|--------|-------------|------------|
| **VALUE** | 5 | 4.00 | Highest value: 3,000 hrs → 16 hrs; eliminates $247K Falcon Tool alternative |
| **COST** | 2 | 1.83 | Very high build cost; requires bulk export from two systems, one nonexistent |
| **EFFORT** | 3 | 1.63 | Blocked — Prisym 360 does not exist; prototype requires synthetic simulation only |
| **REACH** | 4 | 4.00 | Global applicability if Prisym 360 rolls out across all Stryker labeling divisions |

> **Composite Score: 44.5 / 70**

---

### UC4: International Compliance Assurance

AI monitors changes to international regulatory standards (via Accuris) and corporate SOPs, flagging impacts on labeling procedures and JR labels — shifting RA from reactive notification to proactive monitoring. The strategic ceiling is the highest of the four use cases, but the use case cannot be prototyped today because Accuris exports are encrypted and the integration path is undefined. It is best treated as a future-phase initiative, potentially paired with UC3 to feed regulatory requirements directly into the label creation workflow.

| Bucket | Weight | Score (1–5) | Descriptor |
|--------|--------|-------------|------------|
| **VALUE** | 5 | 3.00 | High-consequence compliance risk; no time study data available to quantify speed benefit |
| **COST** | 2 | 1.67 | Accuris encryption is an unresolved hard blocker; recursive validation challenge |
| **EFFORT** | 3 | 1.50 | No prototypable path today without resolving Accuris licensing architecture |
| **REACH** | 4 | 3.40 | Highest long-term strategic ceiling; applicable globally across all labeling teams |

> **Composite Score: 36.4 / 70**

---

*Sources: Use Case Brief (2026-04-27-use-case-brief-scoring-prep.md); Scoring Sheet (2026-04-27-scoring-sheet.md)*
