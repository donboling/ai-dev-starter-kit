# Start here

1. Install Git and the coding agents you use. For the web app template, install Node and pnpm. See the current [Codex](https://developers.openai.com/codex) and [Cursor](https://docs.cursor.com/) setup guides for platform instructions.
2. Run `bash bootstrap/bootstrap.sh ~/dev` from this repository. The argument can be another workspace path.
3. Run `bash ~/dev/library/tools/doctor.sh`. Missing optional tools do not block a static site.
4. Open `~/dev` in Cursor or start Codex there. Read `AGENTS.md`, then ask for the `new-project` workflow or run the scaffold script directly.
5. Work inside the generated project's directory. Record durable decisions in `docs/decisions/` and end meaningful sessions by updating `.agent/HANDOFF.md`.

No account or remote is required to get started. Add a GitHub or Gitea remote when you want to publish code. Keep personal tokens and passwords out of the repository.
