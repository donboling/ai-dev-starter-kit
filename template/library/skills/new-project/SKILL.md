---
name: new-project
description: Scaffold a new local web app or static site in the workspace, establish durable project context, and optionally connect GitHub or Gitea.
---

# New project

1. Determine the project goal and whether a static site or web app fits. Use an existing project instead of scaffolding over it.
2. Run `bash library/tools/new-project.sh site <slug>` or `app <slug>` from anywhere in the workspace; the script resolves its own location. It stages files but does not commit or push.
3. Replace placeholder content; document local run and checks in the project's README.
4. Run the relevant check, create an initial commit, and update `PROJECTS.md`.
5. If a remote is requested, ask or infer GitHub versus Gitea versus local; use `library/guides/hosting.md` from the workspace for examples. Confirm the actual remote URL after publishing.
