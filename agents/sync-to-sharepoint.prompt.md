---
description: "Sync finished artifacts in documentation/ to the SharePoint folder via OneDrive. Run when you want to push deliverables to SharePoint."
argument-hint: "--dry-run (optional: preview without copying)"
tools: [run_in_terminal]
---

# Sync Documentation to SharePoint

Run the sync script to copy the `documentation/` folder to the locally OneDrive-synced SharePoint library.

## Steps

1. If the argument `${{ args }}` includes `--dry-run`, run a preview first:
   ```
   ./sync-to-sharepoint.sh --dry-run
   ```
2. Otherwise (or after confirming the dry run looks correct), run:
   ```
   ./sync-to-sharepoint.sh
   ```
3. Report back which files were transferred and confirm sync completed with no errors.

## Context

- Script location: [sync-to-sharepoint.sh](../sync-to-sharepoint.sh)
- Source: `documentation/` (finished artifacts only)
- Destination: `OneDrive-Slalom/Stryker Documents/FDE Ortho - AI/documentation/`
- Uses `rsync -av` — only changed files are copied; nothing is deleted from the destination
