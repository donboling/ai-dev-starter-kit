---
name: promote-to-library
description: Extract a proven reusable pattern from a project into the workspace library after comparing multiple concrete uses.
---

# Promote to library

Compare at least two real uses and identify the stable common behavior. Copy only the reusable portion into `library/` with usage notes and a source-project reference. Keep projects self-contained; do not turn the library into a runtime dependency. Verify the copied template or tool independently.
