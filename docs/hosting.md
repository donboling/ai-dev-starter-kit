# Git remotes

The scaffold starts a local Git repository and stages its initial files. Commit once the placeholders are personalized. Then choose a remote.

## GitHub

```bash
gh auth login
gh repo create <slug> --private --source=. --push
```

Or create an empty repository in the GitHub UI, set `origin`, and push your branch. Choose visibility explicitly; private is a sensible starting point.

## Gitea

Create an empty repository in Gitea, copy its SSH or HTTPS URL, then:

```bash
git remote add origin <gitea-repository-url>
git push -u origin HEAD
```

For a Tailscale-only Gitea server, authenticate and test network access on that machine first. Do not put server credentials or access tokens in `PROJECTS.md`.

## Local only

Keep working with local commits and leave `origin` unset. Fill the `Repo` column of `PROJECTS.md` only after a remote exists.
