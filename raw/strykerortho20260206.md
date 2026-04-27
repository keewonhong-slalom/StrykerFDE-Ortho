 Stryker Project - Meeting Notes

## Meeting 1: Client Discovery Call
**Date:** February 6, 2026  
**Duration:** ~60 minutes  
**Meeting Type:** Client-facing Discovery & Scoping

### Attendees

**Stryker Team:**

- **Denise (DNA)** - Reports to Matt Johnson, Orthopedics Division (Joint Replacement focus)
- **DT** - Working with Denise on AI use cases
- **Alfonso** - Scott Austin's team

**Slalom Team:**

- Joseph Kennedy
- Sergio Martinez
- Jennifer Kwapis
- Gene Hong
- Nicole Peterson
- Amanda Chiu
- Dottie Hunt

---

## Business Context

### Current Process Overview
**Joint Replacement Sales Process:**

1. Surgery must happen for product sale
2. Inventory shipped to surgery location
3. Sales rep educates surgeon and tracks product usage
4. Sales rep submits usage information
5. Customer Service processes order to hospital
6. Purchase Order obtained from hospital to enable invoicing

**Current Pain Points:**

- Sales reps and CSRs spend excessive time searching multiple systems for information
- Fragmented data sources (training docs, orders, pricing, account info, surgical cases, product info)
- 90% of sales rep → customer service interactions are for the same 5 topics:
  - Training documentation
  - Orders
  - Pricing
  - Account information
  - Surgical case information
  - Product information

### Scale

- **~3,000 sales reps** (joint replacement + trauma + all orthopedics)
- **~450 customer service agents**
- **Branch structure:** Some branches support 50+ sales reps

---

## Project Goals

### Primary Objective

Create an AI agent to provide **relief for customer service** by enabling sales reps to self-service information requests, reducing call volume to CSR team.

### Key Requirements

1. **Dual audience:** Both sales reps AND customer service agents need access
2. **Mobile-first:** Sales reps are often in hospitals with only cell phone access (may lack WiFi/laptop)
3. **Real-time data:** Most current data available from source systems
4. **Role-based access:** Inherit existing system permissions
   - Sales reps see only their territory data
   - CSRs see data for their branch (multiple territories)
5. **No PII/PHI exposure** in surgical case data

---

## Timeline & Constraints

### Critical Date: **May 5, 2026**

**Driver:** SAP deployment ("Project Accelerate") launches May 2026

**Rationale:**

- CSRs will face massive transition to new SAP system
- New workflows and data locations will create inefficiency
- AI agent would ease transition burden
- Some concerns about reps losing SAP data access (90% reduction mentioned)

### Deployment Windows

- **Build completion target:** End of March / Early April 2026
- **UAT/SIT process:** 5-6 weeks (working backwards from May 5)
- **Client responsibility:** UAT, SIT, and production deployment
- **Slalom responsibility:** Build phase, support during testing

---

## Proposed Solution

### Platform
- **Primary recommendation:** Microsoft Teams Agent (Copilot Agent)

  - Mobile + web accessibility
  - Leverages existing Microsoft ID for access management
  - No additional licensing required
  
**Note:** Existing trauma team has SharePoint-based agent, but this will be separate/new

### Data Sources & Priority

**Client-Provided Priority Table (from Dianet):**

| Data | Topic | Priority |
|------|-------|----------|
| Sharepoint | CS training, onboarding, etc. FEES resources. | 1 |
| Azure/Athena PowerBI | Orders, Surgical cases, product, account | 2 |
| Jira | Ticket creation/escalation | 3 |
| Model N | Pricing and Quoting | 4 |
| WebOps RR | Orders, Surgical cases, account | 5 |
| Highspot | training, op techs, education material, etc | 6 |

**Additional Notes:**

| Priority | Data Source | Purpose | Notes |
|----------|-------------|---------|-------|
| **1** | **SharePoint** | CSR training materials for SAP transition | Must-have for May 5 |
| **1** | **High Spot** | Sales rep training resources (regulated docs) | Combined with SharePoint |
| **2** | **Athena** | Order data, account data, surgical cases, pricing | "Athena" = branded Azure Data Bricks (not AWS) |
| **3** | **Jira** | Ticket creation for escalations | Simple integration, no data source |
| 4 | Model N | Pricing/quote entry | Lower priority |
| 5 | Web OPS | TBD | Lower priority |
| 6 | Power Apps | Quote portal | Lower priority |

### Data Source Details

**SharePoint + High Spot (Priority 1):**

- Format: PDF, DOC, PowerPoint
- Content: Training materials, step-by-step guides, knowledge articles
- Access control: Sales reps don't access CSR SharePoint
- Quality considerations: Content is ad hoc, may need standardization (CSV vs. PDF performance)
- New SharePoint site may be created to prevent hallucinations

**Athena (Priority 2):**

- Technology: Azure Databricks (branded as "Athena" internally)
- Current state: No established API endpoints yet
- Temporary solution: Query database directly (already established for G-FAX project)
- Data governance: Complex table-level permissions needed
  - Permission structure goes below territory level
  - Requires mapping tables/columns/rows to specific user groups
- Middleware: May NOT be required for MVP/POC approach
- Data team support: Can provide table definitions and BI schema
- Power BI reports currently use Athena data
- Volume concerns: Large-scale analysis queries need optimization

**Jira (Priority 3):**
- Purpose: Last-resort escalation (system down, can't find case, technical issues)
- Functionality: Auto-create ticket, prepopulate fields from chat context
- Not a data source - just integration endpoint

### Sample Prompts & Use Cases

**Sales Rep Queries:**

1. "How many Mako TKRs has Dr. [Name] completed this year?" → Link to report with filtered data
2. "Show me previous cases pending POs" → Report of orders awaiting purchase orders
3. "What is the instrument list I use for total knee replacement?" → Instructions + source link
4. "I need IFU data on [product]" → Link to high spot with relevant product data
5. "I need pricing and to enter a quote" → Link to Model N and Power App quote portal
   - Follow-up: "Do you need assistance to operate the quote portal?" → Training materials
6. "What is the latest contract for Holy Name Hospital?" → List of active contracts with links

**CSR Queries:**

1. "How do I create a backlog only in SAP?" → Step-by-step guide + SharePoint training link
2. "Do I have any open cases?" → Query Power BI/Athena data, return report with filters
3. "How do I process a credit?" → Step-by-step guide + training materials link

---

## Technical Considerations

### Access & Permissions

- Role-based access controls (RBAC) exist in both SharePoint and Athena
- Territory/branch-based data filtering required
- Microsoft ID integration for authentication

### Data Challenges

1. **SharePoint:** Ad hoc formatting, need to test content structure
2. **Athena:** 
   - Complex permission model
   - Table mapping work required
   - Query optimization for large datasets
   - BI schema availability pending
3. **No PHI/PII:** Surgical case data is clean (PHI exists only in "treatment plan" system, not in scope)

### Validation Process

- **User testing:** Small group of top performers
- **Iteration approach:** Start with predefined questions, expand over time
- **Accuracy priority:** Quality over quantity of responses
- **Query mapping:** Question → stored procedure → results (minimizes hallucination risk)

### Middleware

- Likely NOT required for MVP
- May be involved for long-term production scaling
- Data analytics team can provide consumable data format

---

## MVP Scope Discussion

### Alfonso's Proposed MVP
1. **UI:** Teams
2. **Data Sources:** SharePoint + High Spot + Athena
3. **Timeline:** May 5, 2026

### Team Assessment

- **SharePoint value:** 60% with CSRs only (insufficient for sales rep adoption)
- **SharePoint + Athena:** 60% value at launch (not 80%)
  - Can't deploy all Athena tables simultaneously due to permission mapping work
  - Still missing Model N pricing data (important for reps)
- **Sales rep deployment:** Requires data beyond training resources (order/case/account/product info)

### Scope Trade-offs

- Speed vs. completeness
- Client preference: "Do it the right way" (Matt/Scott Austin)
- Avoid "bubble gum and sticks" architecture
- Long-term maintainability is priority

---

## Strategic Considerations

### Fabric Strategy Discussion

- **Power BI + Fabric:** Could accelerate delivery if already enabled
- **Governance:** Easier to manage with Fabric backend
- **Future-proofing:** Enables agent scaling across Stryker
- **Recommendation:** Bundle Fabric strategy into larger proposal (separate from immediate MVP)

### Power BI Refresh Concerns

- Need to review semantic models and refresh schedules
- Risk: Stale data if refresh cadence is too long
- Point data queries preferred for real-time accuracy

### SharePoint Organization

- **Option 1:** Control destiny by requiring folder structure
- **Option 2:** Proper metadata tagging for context
- **Goal:** Avoid random keyword matching, ensure contextual relevance

---

## Risks & Concerns

### Timeline Risk

- **Extremely aggressive:** ~8 weeks from contract to production-ready
- **Contracting delay:** Could push start to end of February
- **Reality check:** May 5 is aspirational; may need to accept delay post-SAP launch
- **Deployment window question:** Is May 5 hard requirement or preference?

### Change Management Risk

- **Sales rep adoption:** Notoriously difficult at Stryker
- **Mitigation:** 
  - Target CSRs first (higher urgency with SAP transition)
  - Roll out to sales reps in wave 2
  - Dedicated change management team in place

### Technical Risk

- **Data quality:** Ad hoc SharePoint content may need restructuring
- **Athena integration:** No established API, using workaround approach
- **Permission complexity:** Table-level security mapping is significant effort
- **Volume/performance:** Large analytical queries need optimization strategy

---

## Action Items

### Client Team (Denise/DT/Alfonso)

- [ ] Share high-level user requirements document
- [ ] Provide updated use case list (beyond initial 18)
- [ ] Share data source priority table
- [ ] Identify small group of top performers for UAT
- [ ] Coordinate with data analytics team on:
  - Table/column/row definitions
  - BI schema documentation
  - Access provisioning approach
- [ ] Clarify hard vs. soft deadline for May 5

### Slalom Team

- [ ] Internal debrief to assess feasibility
- [ ] Determine realistic timeline for MVP delivery
- [ ] Scope trade-off recommendations (what's achievable by target date)
- [ ] Create phased approach:
  - Phase 1: MVP for May (or realistic date)
  - Phase 2: Additional data sources (2-3 sprints post-launch)
- [ ] Develop quote with:
  - Initial launch estimate
  - Evolution roadmap for full scope
- [ ] Provide response by Monday (or sooner)
- [ ] Coordinate with Matt Johnson and Scott Austin on contracting timeline

---

## Open Questions

1. **Deployment timing:** Is May 5 a hard requirement, or can agent launch shortly after SAP if needed?
2. **Athena API:** Will data analytics team provide marketplace/endpoint solution?
3. **Fabric enablement:** Is Power BI Fabric already enabled for Stryker?
4. **Middleware involvement:** When/if needed for production deployment?
5. **Content refresh:** Can SharePoint content be reorganized/standardized pre-launch?
6. **Success metrics:** How will CSR efficiency improvement be measured?
7. **Escalation workflow:** Current CSR → CSR handoff process (seems minimal via email)

---

## Meeting 2: Internal Team Debrief
**Date:** February 6, 2026  
**Duration:** ~28 minutes  
**Meeting Type:** Internal Microsoft team discussion (post-client call)

### Attendees

- Joseph Kennedy (Lead)
- Sergio Martinez (Azure Data and AI Team Lead)
- Jennifer Kwapis
- Gene Hong (Cloud Build, Modern Engineering & AI)
- Nicole Peterson (MD Leader, Forward Deployed Expertise)
- Amanda Chiu
- Dottie Hunt

---

## Slalom Reactions & Assessment

### Initial Impressions

- **"Typical Stryker"** - this is expected behavior for the client
- Client knows what they want
- Timeline may not align with realistic delivery
- Use case is straightforward: knowledge base queries across disparate data sources
- Complexity is in integration volume and timeline, not the use case itself

### Key Concerns

**Timeline Realism:**

- May 5 deployment requires build completion by end of March
- With contracting delays, actual start could be end of February
- Result: Only 2 sprints worth of work time available
- Team consensus: Need to be realistic about what's deliverable in timeframe

**Deployment Window Clarity:**

- May 5 tied to SAP Accelerate launch
- Question: Is this a hard dependency or preference?
- Hypothesis: May be okay to launch agent a few weeks after SAP goes live
- Need to confirm if this is deployment requirement or aspiration

**Data Loss Question:**

- Possible mention that reps lose 18% or 90% of SAP data access after launch
- This could be driving urgency
- Need clarification on whether agent is mitigation for data access loss

### Technical Discussion

**Integration Approach (Sergio/Gaston):**

**Prioritization Strategy:**

1. Start with SharePoint (main data source)
2. Add Athena second
3. Understand if Athena is connected to Power BI (enables easier integration)
4. Push other data sources to future phases

**Fabric as Accelerator:**

- If Power BI + Fabric already enabled, this unblocks faster delivery
- Speeds up first wave of integration
- Allows connection to SharePoint and Athena via Fabric backend
- Governance benefits for long-term management

**Happy Path Recommendation:**

- Connect to SharePoint
- Connect to Athena via Power BI/Fabric
- Land specific use cases with specific prompts
- Establish one wave as initial project

**Benefits of Fabric Approach:**

1. If already enabled, minimal setup required
2. Faster time-to-value
3. Enables "agent-enabled fabric workspace" features
4. Positions for long-term agent strategy across Stryker
5. Future features: Fabric Driver, Guide Q (in preview)

**Power BI Refresh Considerations:**

- Need to review semantic models
- Understand data refresh cadence
- Risk: Week-old data if refresh isn't frequent
- Point data queries (direct to Athena) may be more real-time

**SharePoint Data Quality:**

- Ad hoc formatting is concern
- Could control through folder structure requirements
- Alternative: Proper metadata tagging for context
- Goal: Prevent random keyword matching, ensure topical relevance

### Strategic Recommendations

**Broader Value Proposition:**

- Position this as more than one-off agent
- Bundle in **Fabric agent strategy** for Stryker
- Separate proposal component: long-term agent enablement framework
- Shows forward-thinking, not just tactical solution

**Phased Delivery Approach:**

- Phase 1 (MVP): SharePoint + Athena via Power BI
  - Target: Meet May 5 (or close to it)
  - Focused use cases, predefined prompts
- Phase 2 (2-3 sprints later): Additional data sources
  - Model N
  - Web OPS
  - Other integrations
- Expansion: Multi-agent orchestration potential

**Architectural Principles:**

- Matt Johnson & Scott Austin want "the right way, not Band-Aids"
- Team should challenge client if better approach exists
- Long-term maintainability over quick wins
- Scott Austin owns this long-term, so architecture matters

**Comparison to Internal Projects:**

- G-FAX project: 8+ months in, still building
- Stryker often uses "shade tree mechanic" architecture
- Opportunity to guide toward best practices
- Slalom should be the challenger for sound architecture

