# Stryker Ortho FDE — AI Workspace Instructions

This repository is an AI consulting workspace for the **Stryker Ortho Field Development & Engineering (FDE) Business Unit**. It is used by an internal AI consulting team to produce strategic business artifacts.

## Repository Structure

| Folder | Purpose |
|--------|---------|
| `agents/` | Copilot prompt and agent files for repeatable workflows |
| `context/` | Grounding material fed to agents (brand, personas, constraints) |
| `documentation/` | Finished deliverable outputs |
| `raw/` | Unprocessed source material (transcripts, notes, exports) |
| `reference/` | Curated authoritative sources (studies, reports, competitive intel) |

## Output Types

This workspace produces **strategic business documents**:
- Executive memos and briefs
- Go-to-market proposals
- PRDs and requirements documents
- Slide deck content and talking points
- Scoring and evaluation sheets

## Agent Workflow Conventions

### Before drafting any document
1. Check `context/` for relevant brand or persona files and include them in your context
2. Identify inputs from `raw/` (transcripts, notes) or `reference/` (studies, reports)
3. Use the appropriate prompt from `agents/` if one exists for the task

### Output standards
- Save all finished artifacts to `documentation/<project-name>/`
- Use the naming convention: `<YYYY-MM-DD>-<deliverable-name>.<ext>`
- Markdown (`.md`) is the default format unless a specific format is requested
- Always cite reference sources used in a document

### Writing style
- Concise, professional, executive-appropriate tone
- Lead with the business implication before supporting detail
- Use headers, bullets, and tables to improve scannability
- Avoid jargon unless it is standard Stryker/Ortho terminology defined in `context/terminology.md`

## Key Files

- Agent prompts: see `agents/README.md`
- Context files: see `context/README.md`
- Reference organization: see `reference/README.md`
