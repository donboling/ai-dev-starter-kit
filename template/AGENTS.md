# Workspace instructions

This directory organizes independent projects. Work from the relevant project directory when changing its code; read that project's `AGENTS.md` and `.agent/HANDOFF.md` first.

- Prefer the smallest workable solution. Respect each project's existing package manager and conventions.
- Before editing, inspect the relevant code and current Git status. Keep changes scoped to the request.
- Run checks that exercise changed behavior and report what passed.
- Do not commit credentials. Keep `.env` local and commit `.env.example` only with placeholders.
- Record durable design choices in the project's `docs/decisions/`. Update `.agent/HANDOFF.md` after meaningful work.
- `library/` is a source of copies, not a runtime dependency. Copy reusable assets into projects.
- `PROJECTS.md` tracks local path and optional remote. Projects can use GitHub, Gitea, or local Git.

Repeatable procedures live in `library/skills/`. Run `bash library/tools/doctor.sh` for environment diagnostics.
