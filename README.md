# actions

This repo contains actions we use for most of our CI workflows. which includes
- Checksum: Creates checksum for caching gradle
- Validate-charts: Prevalidates helm chart template before its deployment; executes helm lint and helm template commands.
- Helm-gcs-publish: Steps to push helm charts to GCS bucket
