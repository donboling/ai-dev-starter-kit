# AI Dev Starter Kit

A practical workspace for coding with Codex and Cursor. It keeps project context in Git so either agent can resume work without reconstructing a chat.

Adapted from [Claude Code Starter Kit](https://github.com/donboling/claude-code-starter-kit), originally by Tommy Oyarzun. The original MIT copyright and license are retained.

## Start

```bash
git clone <this-repository-url>
cd ai-dev-starter-kit
bash bootstrap/bootstrap.sh ~/dev
cd ~/dev
bash library/tools/doctor.sh
```

On Windows, run these commands in WSL, or use Git Bash with a path appropriate to your machine. Open `~/dev` in Cursor or start Codex in that directory. Read [START-HERE.md](START-HERE.md) for the short setup guide. The bootstrap copies only missing files, so it can be rerun without overwriting your work.

## Workspace

```text
dev/
├── AGENTS.md                  shared working instructions
├── PROJECTS.md                human-readable project index
├── projects/                  independent Git repos
├── library/
│   ├── templates/             static site and React app starters
│   ├── skills/                canonical workflow instructions
│   └── tools/                 bootstrap helpers
├── .agents/skills/            Codex discovery links to library skills
├── .cursor/rules/             scoped Cursor guidance
└── agent-docs/               lessons learned across projects
```

Each generated project contains its own `AGENTS.md` and `.agent/` handoff files. Open the **project folder** as the working root when switching agents. The workspace itself is not initialized as a Git repo; each project is independent. If you want to version the workspace configuration too, do so deliberately in a separate repository.

## First project

```bash
bash library/tools/new-project.sh site my-site
# or: bash library/tools/new-project.sh app my-app
```

Then open that project in Codex or Cursor and ask it to read `AGENTS.md`, `.agent/STATUS.md`, and `.agent/HANDOFF.md`. Select a Git remote when you are ready: GitHub, Gitea, or local Git all work.

Skills in `library/skills/` describe recurring tasks such as project creation, catching up, ship checks, deployment, and Git recovery. Codex discovers the same files via `.agents/skills/`; Cursor can use them by explicit file reference. Tool-specific rules are intentionally thin.

## Design decisions

- `AGENTS.md` is the common instruction file. Cursor rule files cover file-specific cases.
- Keep decisions and status in the project, with current state in `.agent/` and durable architecture in `docs/`.
- The scripts create local projects and never choose a remote or publish on your behalf.
- Template dependencies are starter examples: check and refresh versions when adopting a template.

See [docs/architecture.md](docs/architecture.md) for where context belongs and [docs/hosting.md](docs/hosting.md) for remote setup.
