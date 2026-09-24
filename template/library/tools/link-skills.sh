#!/usr/bin/env bash
# Expose canonical library skills in Codex's repository skill location.
set -euo pipefail
ROOT="${1:-$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)}"
mkdir -p "$ROOT/.agents/skills"
for src in "$ROOT"/library/skills/*/; do
  [ -f "$src/SKILL.md" ] || continue
  name="$(basename "$src")"
  target="$ROOT/.agents/skills/$name"
  if [ -e "$target" ] || [ -L "$target" ]; then continue; fi
  ln -s "../../library/skills/$name" "$target"
done
printf 'Skills linked under %s/.agents/skills\n' "$ROOT"
