---
name: ship-check
description: Verify a project before commit, release, or deployment, using its actual build and test commands and reviewing the diff for secrets and unintended changes.
---

# Ship check

Inspect the diff and project scripts. Run applicable typecheck, lint, test, and production build. Check for accidentally tracked `.env`, credentials, placeholder metadata, and broken links or layouts if relevant. Report commands, results, and remaining issues precisely. Do not claim checks ran when they did not.
