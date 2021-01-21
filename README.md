# Github Actions

This repo contains actions we use for most of our CI workflows.
- checksum: Creates checksum for caching gradle
- validate-charts: Prevalidates helm chart template before its deployment; executes helm lint and helm template commands.
- helm-gcs-publish: Steps to push helm charts to GCS bucket
- gradle: Runs the provided gradle commands with optimized CI arguments
- release-notes: Publishes release notes to github
