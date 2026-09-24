#!/usr/bin/env bash
# Copy starter workspace without overwriting existing files.
set -euo pipefail
KIT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TARGET="${1:-$HOME/dev}"
TARGET="${TARGET/#\~/$HOME}"
if [ -e "$TARGET" ] && [ ! -d "$TARGET" ]; then echo "Target is not a directory: $TARGET" >&2; exit 1; fi
mkdir -p "$TARGET"
count=0
while IFS= read -r -d '' src; do
  rel="${src#"$KIT_DIR/template/"}"
  dst="$TARGET/$rel"
  mkdir -p "$(dirname "$dst")"
  if [ ! -e "$dst" ]; then cp "$src" "$dst"; count=$((count + 1)); fi
done < <(find "$KIT_DIR/template" -type f -print0)
mkdir -p "$TARGET/projects/apps" "$TARGET/projects/sites" "$TARGET/.agents/skills"
chmod +x "$TARGET"/library/tools/*.sh
bash "$TARGET/library/tools/link-skills.sh" "$TARGET"
printf 'Workspace ready: %s (%d files copied)\n' "$TARGET" "$count"
printf 'Next: bash "%s/library/tools/doctor.sh"\n' "$TARGET"
