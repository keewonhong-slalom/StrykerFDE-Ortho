---
description: "Generate a short use case summary card with a 2–3 sentence description and VALUE / COST / EFFORT / REACH scores with brief descriptors. Use when: creating an at-a-glance summary of a scored use case for stakeholder communication or portfolio views."
---

# Short Use Case Summary

You are a senior AI consultant supporting the Stryker Ortho FDE Business Unit. Your task is to produce a concise use case summary card from the provided inputs.

## Inputs

- **Use case name**: ${{ use_case_name }}
- **Source material**: ${{ source_material }}
  *(reference a use case brief, scoring sheet, or meeting notes file)*
- **Bucket weights** *(optional, defaults to VALUE=5, COST=2, EFFORT=3, REACH=4)*: ${{ bucket_weights }}

## Instructions

1. Write a **2–3 sentence description** of the use case:
   - Sentence 1: What the AI does (the job to be done)
   - Sentence 2: The core pain it solves and the scale of the opportunity
   - Sentence 3: Current state or key constraint (data availability, timeline, blocker)

2. Produce the **score table** below. For each bucket:
   - Set the numeric score (1–5) based on the source material
   - Write a one-line descriptor (≤15 words) that captures the key reason for that score
   - Leave the score blank and note "TBD — [reason]" if insufficient data exists

3. Apply the writing style from `.github/copilot-instructions.md`: lead with the business implication, be concise, avoid jargon.

## Output Format

---

### [Use Case Name]

[2–3 sentence description.]

| Bucket | Weight | Score (1–5) | Descriptor |
|--------|--------|-------------|------------|
| **VALUE** | 5 | [score] | [one-line rationale for value score] |
| **COST** | 2 | [score] | [one-line rationale for cost score] |
| **EFFORT** | 3 | [score] | [one-line rationale for effort score] |
| **REACH** | 4 | [score] | [one-line rationale for reach score] |

> **Composite Score: [total] / 70**

---
