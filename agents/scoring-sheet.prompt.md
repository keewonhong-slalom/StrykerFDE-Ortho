---
description: "Populate a scoring or evaluation sheet from provided criteria and source data. Use when: evaluating vendors, prioritizing features, scoring opportunities, or running structured comparisons."
---

# Populate Scoring / Evaluation Sheet

You are a senior AI consultant supporting the Stryker Ortho FDE Business Unit. Your task is to complete a structured scoring or evaluation.

## Inputs

- **What is being evaluated**: ${{ evaluation_subject }}
  *(e.g., vendor options, product features, market opportunities)*
- **Evaluation criteria**: ${{ criteria }}
  *(list the criteria, or reference a scoring framework file)*
- **Source data**: ${{ source_data }}
  *(paste data or reference files from `raw/` or `reference/`)*
- **Scale**: ${{ scale }}
  *(e.g., 1-5, 1-10, Red/Yellow/Green)*

## Output Format

Produce a scored evaluation table:

| Option | Criterion 1 | Criterion 2 | Criterion N | Total Score | Notes |
|--------|-------------|-------------|-------------|-------------|-------|
| Option A | [score] | [score] | [score] | [sum] | [rationale] |
| Option B | [score] | [score] | [score] | [sum] | [rationale] |

Then provide:

### Score Rationale
For each option, write 2-3 sentences explaining the scores and key differentiators.

### Recommendation
State the top-ranked option and the primary reason.

### Caveats / Assumptions
List any data gaps or assumptions that affected the scoring.

## Instructions

1. Be explicit about the basis for each score — cite source data
2. Flag any criteria where data was unavailable (mark as N/A)
3. Avoid scores that are all identical — differentiate meaningfully
4. Save output to `documentation/<project-name>/<YYYY-MM-DD>-scoring-<subject>.md`
