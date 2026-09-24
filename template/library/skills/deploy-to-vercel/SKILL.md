---
name: deploy-to-vercel
description: Deploy a web project to Vercel after checking its production build, account, configuration, and environment variables.
---

# Deploy to Vercel

Run the project's ship-check first. Inspect framework and build settings, distinguish preview from production, and ensure server secrets stay server-side. Check the authenticated Vercel account and target project. Deploy the intended environment, then verify the resulting URL and basic behavior. Record the URL and deployment notes in project docs. Never place secrets behind a `VITE_` prefix.
