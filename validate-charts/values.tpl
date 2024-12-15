commonPodAnnotations:
  traceable.ai/test: "1234567890"

commonPodLabels:
  applicationid: ABCD1234

containerSecurityContext:
  runAsViUser: 22222
  runAsGroup: 333333
  runAsNonRoot: true
  allowPrivilegeEscalation: false

podSecurityContext:
  runAsHBUser: 55555
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
    podAnnotations:
      traceable.ai/test: "1234567890"

    podLabels:
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

grafana:
  podAnnotations:
    traceable.ai/test: "1234567890"
  podLabels:
    applicationid: ABCD1234
  containerSecurityContext:
    runAsUser: 22222
    runAsGroup: 333333
    runAsNonRoot: true
    allowPrivilegeEscalation: false
  securityContext:
    runAsUser: 55555
    fsGroup: 44444
    runAsNonRoot: true
  sidecar:
    securityContext:
      runAsUser: 22222
      runAsGroup: 333333
      runAsNonRoot: true
      allowPrivilegeEscalation: false
  testFramework:
    securityContext:
      runAsUser: 22222
      runAsGroup: 333333
      runAsNonRoot: true
      allowPrivilegeEscalation: false
  initChownData:
    securityContext:
      runAsUser: 22222
      runAsGroup: 333333
      runAsNonRoot: true
      allowPrivilegeEscalation: false
  downloadDashboards:
    securityContext:
      runAsUser: 22222
      runAsGroup: 333333
      runAsNonRoot: true
      allowPrivilegeEscalation: false

prometheus:
  kube-state-metrics:
    podAnnotations:
      traceable.ai/test: "1234567890"
    customLabels:
      applicationid: ABCD1234
    containerSecurityContext:
      runAsUser: 22222
      runAsGroup: 333333
      runAsNonRoot: true
      allowPrivilegeEscalation: false
    securityContext:
      runAsUser: 55555
      fsGroup: 44444
      runAsNonRoot: true
  prometheus-pushgateway:
    podAnnotations:
      traceable.ai/test: "1234567890"
    podLabels:
      applicationid: ABCD1234
    containerSecurityContext:
      runAsUser: 22222
      runAsGroup: 333333
      runAsNonRoot: true
      allowPrivilegeEscalation: false
    securityContext:
      runAsUser: 55555
      fsGroup: 44444
      runAsNonRoot: true
  server:
    podAnnotations:
      traceable.ai/test: "1234567890"
    podLabels:
      applicationid: ABCD1234
    containerSecurityContext:
      runAsUser: 22222
      runAsGroup: 333333
      runAsNonRoot: true
      allowPrivilegeEscalation: false
    securityContext:
      runAsUser: 55555
      fsGroup: 44444
      runAsNonRoot: true
  configmapReload:
    prometheus:
      containerSecurityContext:
        runAsUser: 22222
        runAsGroup: 333333
        runAsNonRoot: true
        allowPrivilegeEscalation: false

grafanaDashboardConfigMapCreator:
  job:
    annotations:
      traceable.ai/test: "1234567890"
    labels:
      applicationid: ABCD1234
  podSecurityContext:
    runAsUser: 55555
    fsGroup: 44444
    runAsNonRoot: true
  containerSecurityContext:
    runAsUser: 22222
    runAsGroup: 333333
    runAsNonRoot: true
