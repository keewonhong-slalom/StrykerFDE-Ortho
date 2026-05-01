#!/bin/bash
# sync-to-sharepoint.sh
# Syncs the documentation/ folder to the locally OneDrive-synced SharePoint library.
# Run manually when you want to push finished artifacts to SharePoint.

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
SOURCE="$REPO_DIR/documentation/"
DEST="/Users/keewonhong/Library/CloudStorage/OneDrive-Slalom/Stryker Documents/FDE Ortho - AI/documentation/"

# --dry-run flag: preview without copying
DRY_RUN=""
if [[ "$1" == "--dry-run" ]]; then
  DRY_RUN="--dry-run"
  echo "=== DRY RUN — no files will be copied ==="
fi

echo "Source : $SOURCE"
echo "Dest   : $DEST"
echo ""

# Create destination if it doesn't exist (only when not dry-running)
if [[ -z "$DRY_RUN" && ! -d "$DEST" ]]; then
  mkdir -p "$DEST"
  echo "Created destination folder."
fi

rsync -av --progress $DRY_RUN "$SOURCE" "$DEST"

echo ""
echo "Sync complete."
