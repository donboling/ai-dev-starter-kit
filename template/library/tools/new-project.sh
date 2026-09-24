#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
shape="${1:-}"; slug="${2:-}"
if ! [[ "$slug" =~ ^[a-z0-9]+(-[a-z0-9]+)*$ ]]; then
  echo 'Usage: new-project.sh <app|site> <lowercase-slug>' >&2; exit 2
fi
case "$shape" in
  app) kind=apps; source_dir=web-app ;;
  site) kind=sites; source_dir=static-site ;;
  *) echo 'Shape must be app or site.' >&2; exit 2 ;;
esac
dest="$ROOT/projects/$kind/$slug"
if [ -e "$dest" ]; then echo "Already exists: $dest" >&2; exit 1; fi
mkdir -p "$(dirname "$dest")"
cp -R "$ROOT/library/templates/$source_dir" "$dest"
if [ "$shape" = app ]; then
  python3 - "$dest/package.json" "$slug" <<'PY'
import json, pathlib, sys
p = pathlib.Path(sys.argv[1]); data = json.loads(p.read_text()); data['name'] = sys.argv[2]
p.write_text(json.dumps(data, indent=2) + '\n')
PY
fi
cp "$ROOT/library/templates/project-context/AGENTS.md" "$dest/AGENTS.md"
mkdir -p "$dest/.agent" "$dest/docs/decisions"
cp "$ROOT/library/templates/project-context/STATUS.md" "$dest/.agent/STATUS.md"
cp "$ROOT/library/templates/project-context/BACKLOG.md" "$dest/.agent/BACKLOG.md"
cp "$ROOT/library/templates/project-context/HANDOFF.md" "$dest/.agent/HANDOFF.md"
cp "$ROOT/library/templates/project-context/architecture.md" "$dest/docs/architecture.md"
touch "$dest/docs/decisions/.gitkeep"
git -C "$dest" init -q
git -C "$dest" add -A
printf 'Created %s; files staged for your first commit. Choose a remote when ready.\n' "$dest"
