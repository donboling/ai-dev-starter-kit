# Context architecture

| File | Purpose | Update when |
| --- | --- | --- |
| `AGENTS.md` | Short shared instructions for the current scope | A recurring rule changes |
| `.cursor/rules/*.mdc` | Cursor-only path-specific rules | A specific file type needs guidance |
| `library/skills/*/SKILL.md` | Repeatable workflow | The procedure changes |
| `.agent/STATUS.md` | Current state and how to run/test | State changes materially |
| `.agent/BACKLOG.md` | Ordered work | Priorities change |
| `.agent/HANDOFF.md` | Next agent's quick resumption | End of meaningful session |
| `docs/architecture.md` | Stable system design | Boundaries or data flow change |
| `docs/decisions/` | Why a lasting choice was made | A significant choice is made |

The generated project's root `AGENTS.md` is self-contained. Do not assume every agent inherits instructions from the parent workspace when opening a project on its own. Avoid writing chat transcripts into these files.

The `library/skills/` files are the editable source. The bootstrap makes relative links in `.agents/skills/` for Codex. Cursor can open or reference those source files; keep the shared instructions in `AGENTS.md` so Cursor does not need to discover skills automatically.
