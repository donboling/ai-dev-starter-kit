#!/usr/bin/env bash
set -u
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
missing=0
check() { if command -v "$1" >/dev/null 2>&1; then printf 'OK       %s\n' "$1"; else printf 'MISSING  %s\n' "$1"; [ "$2" = required ] && missing=1; fi; }
check git required
check codex optional
check cursor optional
check cursor-agent optional
check node optional
check pnpm optional
check gh optional
check uv optional
[ -f "$ROOT/AGENTS.md" ] || { echo 'MISSING  AGENTS.md'; missing=1; }
[ -d "$ROOT/.agents/skills" ] || { echo 'MISSING  .agents/skills'; missing=1; }
if [ "$missing" -ne 0 ]; then echo 'Install Git and rerun bootstrap if workspace files are missing.'; exit 1; fi
echo 'Core workspace ready. Install Node + pnpm for the web app scaffold; a Git provider CLI is optional.'
