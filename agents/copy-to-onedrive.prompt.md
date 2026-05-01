---
description: "Copy finished artifacts from documentation/ to any OneDrive folder. Pass the destination OneDrive path as the argument."
argument-hint: "/path/to/OneDrive/destination/folder"
tools: [run_in_terminal]
---

# Copy Documentation to OneDrive

Copy the contents of `documentation/` to the specified OneDrive destination folder.

## Inputs

- **Destination path**: `${{ args }}`
  *(Full path to the target OneDrive folder, e.g. `~/Library/CloudStorage/OneDrive-Slalom/Stryker Documents/FDE Ortho - AI/documentation/`)*

## Steps

1. Verify the destination path exists; if not, create it:
   ```
   mkdir -p "${{ args }}"
   ```

2. Copy files using rsync (only changed files, nothing deleted from destination):
   ```
   rsync -av --progress "/Users/keewonhong/Desktop/Stryker/FDE Ortho/StrykerFDE-Ortho/documentation/" "${{ args }}"
   ```

3. Report back:
   - Which files were transferred
   - Total data size
   - Confirm "Sync complete" or surface any errors

## Notes

- Source is always `documentation/` — finished artifacts only
- Uses `rsync -av`: incremental, non-destructive (no deletes at destination)
- If you want a preview first, prepend `--dry-run` to the rsync flags
