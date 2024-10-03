commonPodAnnotations:
  traceable.ai/test: "1234567890"

commonPodLabels:
  applicationid: ABCD1234

containerSecurityContext:
  runAsUser: 22222
  runAsGroup: 333333
  runAsNonRoot: true
  allowPrivilegeEscalation: false

podSecurityContext:
  runAsUser: 55555
  fsGroup: 44444
  runAsNonRoot: true

# sub-charts
kstreams-app-version-checker:
  commonPodAnnotations:
    traceable.ai/test: "1234567890"

  commonPodLabels:
    applicationid: ABCD1234

  containerSecurityContext:
    runAsUser: 22222
    runAsGroup: 333333
    runAsNonRoot: true
    allowPrivilegeEscalation: false

  podSecurityContext:
    runAsUser: 55555
    fsGroup: 44444
    runAsNonRoot: true

hypertrace-pinot:
  commonPodAnnotations:
    traceable.ai/test: "1234567890"

  commonPodLabels:
    applicationid: ABCD1234

  containerSecurityContext:
    runAsUser: 22222
    runAsGroup: 333333
    runAsNonRoot: true
    allowPrivilegeEscalation: false

  podSecurityContext:
    runAsUser: 55555
    fsGroup: 44444
    runAsNonRoot: true

config-bootstrapper:
  commonPodAnnotations:
    traceable.ai/test: "1234567890"

  commonPodLabels:
    applicationid: ABCD1234

  containerSecurityContext:
    runAsUser: 22222
    runAsGroup: 333333
    runAsNonRoot: true
    allowPrivilegeEscalation: false

  podSecurityContext:
    runAsUser: 55555
    fsGroup: 44444
    runAsNonRoot: true

db-schema-manager:
  enabled: false

redis:
  master:
    commonPodAnnotations:
      traceable.ai/test: "1234567890"

    commonPodLabels:
      applicationid: ABCD1234

    containerSecurityContext:
      runAsUser: 22222
      runAsGroup: 333333
      runAsNonRoot: true
      allowPrivilegeEscalation: false

    podSecurityContext:
      runAsUser: 55555
      fsGroup: 44444
      runAsNonRoot: true
  metrics:
    commonPodAnnotations:
      traceable.ai/test: "1234567890"

    commonPodLabels:
      applicationid: ABCD1234

    containerSecurityContext:
      runAsUser: 22222
      runAsGroup: 333333
      runAsNonRoot: true
      allowPrivilegeEscalation: false

    podSecurityContext:
      runAsUser: 55555
      fsGroup: 44444
      runAsNonRoot: true

postgresql:
  primary:
    commonPodAnnotations:
      traceable.ai/test: "1234567890"

    commonPodLabels:
      applicationid: ABCD1234

    containerSecurityContext:
      runAsUser: 22222
      runAsGroup: 333333
      runAsNonRoot: true
      allowPrivilegeEscalation: false

    podSecurityContext:
      runAsUser: 55555
      fsGroup: 44444
      runAsNonRoot: true
  metrics:
    commonPodAnnotations:
      traceable.ai/test: "1234567890"

    commonPodLabels:
      applicationid: ABCD1234

    containerSecurityContext:
      runAsUser: 22222
      runAsGroup: 333333
      runAsNonRoot: true
      allowPrivilegeEscalation: false

    podSecurityContext:
      runAsUser: 55555
      fsGroup: 44444
      runAsNonRoot: true
