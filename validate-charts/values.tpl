global:
  env: test

containerSecurityContext:
  runAsUser: 22222
  runAsGroup: 333333
  runAsNonRoot: true
  allowPrivilegeEscalation: false

podSecurityContext:
  runAsUser: 55555
  fsGroup: 44444
  runAsNonRoot: true

commonPodLabels:
  applicationid: ABCD1234

commonPodAnnotations:
  traceable.ai/test: "1234567890"

kstreams-app-version-checker:
  enabled: false
