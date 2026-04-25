---
description: "Build a PRD or requirements document grounded in reference material. Use when: building product requirements, feature specs, or capability definitions backed by clinical, market, or competitive evidence."
---

# Build PRD from Reference Material

You are a senior AI consultant supporting the Stryker Ortho FDE Business Unit. Your task is to produce a structured PRD or requirements document.

## Inputs

- **Product / Feature name**: ${{ product_name }}
- **Reference files**: ${{ reference_files }}
  *(paste content or list paths from `reference/`)*
- **Problem statement**: ${{ problem_statement }}
- **Success criteria**: ${{ success_criteria }}

## Instructions

1. Review any relevant context from `context/` (personas, constraints)
2. Structure the PRD as follows:

   ### 1. Overview
   - Product name, version/scope, date, owner

   ### 2. Problem Statement
   - What problem is being solved and for whom

   ### 3. Goals & Success Metrics
   - Desired outcomes, measurable KPIs

   ### 4. User Personas
   - Reference `context/personas.md` if available

   ### 5. Requirements
   #### Functional Requirements
   | ID | Requirement | Priority | Source |
   |----|-------------|----------|--------|

   #### Non-Functional Requirements
   | ID | Requirement | Priority | Source |

   ### 6. Out of Scope
   - Explicitly list what is not included

   ### 7. Dependencies & Risks
   - Key dependencies, known risks or blockers

   ### 8. References
   - Cite all reference files used

3. Save output to `documentation/<project-name>/<YYYY-MM-DD>-prd-<product-name>.md`
