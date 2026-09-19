# prometheus 3.5.3+vmware.1-vks.1

| Property | Type | Default | Description |
|---|---|---|---|
| `alertmanager.config.alertmanager_yml` | string | `global: {}
receivers:
- name: default-receiver
templates:
- '/etc/alertmanager/templates/*.tmpl'
route:
  group_interval: 5m
  group_wait: 10s
  receiver: default-receiver
  repeat_interval: 3h
` | The contents of the Alertmanager config file. See https://prometheus.io/docs/alerting/latest/configuration/ for more information. |
| `alertmanager.deployment.containerPort` | integer | `9093` | Container port for alertmanager (used in containerPort, args, and probes). This port is used for the alertmanager container port, --cluster.advertise-address argument, configmap-reload webhook-url, and readinessProbe port. |
| `alertmanager.deployment.containers.resources.limits.cpu` | string | `` | Default CPU limits |
| `alertmanager.deployment.containers.resources.limits.memory` | string | `` | Default Memory limits |
| `alertmanager.deployment.containers.resources.requests.cpu` | string | `50m` | Default CPU requests |
| `alertmanager.deployment.containers.resources.requests.memory` | string | `64Mi` | Default Memory requests |
| `alertmanager.deployment.podAnnotations` | object |  | Alertmanager deployments pod annotations |
| `alertmanager.deployment.podLabels` | object |  | Alertmanager deployments pod labels |
| `alertmanager.deployment.replicas` | integer | `1` | Number of alertmanager replicas. |
| `alertmanager.deployment.rollingUpdate.maxSurge` | string | `25%` | Specifies the maximum number of Pods that can be created over the desired number of Pods. |
| `alertmanager.deployment.rollingUpdate.maxUnavailable` | string | `25%` | Specifies the maximum number of Pods that can be unavailable during the update process. |
| `alertmanager.deployment.updateStrategy` | string | `Recreate` | The type of alertmanager upgrage strategy (RollingUpdate/Recreate) |
| `alertmanager.pvc.accessMode` | string | `ReadWriteOnce` | The name of the AccessModes to use for persistent volume claim. By default this is null and default provisioner is used |
| `alertmanager.pvc.annotations` | object |  | Alertmanager's persistent volume claim annotations |
| `alertmanager.pvc.storage` | string | `2Gi` | The storage size for Alertmanager server persistent volume claim. |
| `alertmanager.pvc.storageClassName` | string | `` | The name of the StorageClass to use for persistent volume claim. By default this is null and default provisioner is used |
| `alertmanager.service.annotations` | object |  | Alertmanager service annotations |
| `alertmanager.service.labels` | object |  | Alertmanager service pod labels |
| `alertmanager.service.port` | integer | `80` | The ports that are exposed by Alertmanager service. |
| `alertmanager.service.targetPort` | integer | `9093` | Target Port to access on the Alertmanager pods. |
| `alertmanager.service.type` | string | `ClusterIP` | The type of Kubernetes service to provision for Alertmanager. |
| `deploycomponents.alertmanager` | boolean | `true` | If false, alertmanager will not be installed. Defaults to true if omitted. |
| `deploycomponents.kube-state-metrics` | boolean | `true` | If false, kube-state-metrics will not be installed. Defaults to true if omitted. |
| `deploycomponents.node-exporter` | boolean | `true` | If false, node-exporter will not be installed. Defaults to true if omitted. |
| `deploycomponents.prometheus` | boolean | `true` | If false, prometheus-server will not be installed. Defaults to true if omitted. |
| `deploycomponents.prometheus-operator` | boolean | `false` | If false, prometheus-operator will not be installed. When enabled, CRDs are automatically deployed. Defaults to false if omitted. |
| `deploycomponents.pushgateway` | boolean | `true` | If false, pushgateway will not be installed. Defaults to true if omitted. |
| `ingress.alertmanagerServicePort` | integer | `80` | Alertmanager service port to proxy traffic to. |
| `ingress.alertmanager_prefix` | string | `/alertmanager/` | Path prefix for Alertmanager. |
| `ingress.enable_internal_tls.enabled` | boolean | `false` | Enable TLS configuration for Prometheus subcomponents via https internal. |
| `ingress.enabled` | boolean | `false` | Whether to enable Prometheus and Alertmanager Ingress. Note that this requires contour. |
| `ingress.kube_state_metrics.enabled` | boolean | `false` | Whether to enable kube-state-metrics sub url in ingress. |
| `ingress.kube_state_metrics.prefix` | string | `/kube-state-metrics/` | Path prefix for kube-state-metrics. Only available when ingress.enabled and ingress.kube_state_metrics.enabled are both true. |
| `ingress.kube_state_metrics.servicePort` | integer | `80` | Kube-state-metrics service port to proxy traffic to. Only available when ingress.enabled and ingress.kube_state_metrics.enabled are both true. |
| `ingress.node_exporter.enabled` | boolean | `false` | Whether to enable node-exporter sub url in ingress. |
| `ingress.node_exporter.prefix` | string | `/node-exporter/` | Path prefix for node-exporter. Only available when ingress.enabled and ingress.node_exporter.enabled are both true. |
| `ingress.node_exporter.servicePort` | integer | `9100` | Node-exporter service port to proxy traffic to. Only available when ingress.enabled and ingress.node_exporter.enabled are both true. |
| `ingress.prometheusServicePort` | integer | `80` | Prometheus service port to proxy traffic to. |
| `ingress.prometheus_prefix` | string | `/` | Path prefix for Prometheus. |
| `ingress.pushgateway.enabled` | boolean | `false` | Whether to enable pushgateway sub url in ingress. |
| `ingress.pushgateway.prefix` | string | `/pushgateway/` | Path prefix for pushgateway. Only available when ingress.enabled and ingress.pushgateway.enabled are both true. |
| `ingress.pushgateway.servicePort` | integer | `9091` | Pushgateway service port to proxy traffic to. Only available when ingress.enabled and ingress.pushgateway.enabled are both true. |
| `ingress.tlsCertificate.ca.crt` | string | `ca` | Optional CA certificate. Note that ca.crt is a key and not nested. |
| `ingress.tlsCertificate.tls.crt` | string | `crt` | Optional cert for ingress if you want to use your own TLS cert. A self signed cert is generated by default. Note that tls.crt is a key and not nested. |
| `ingress.tlsCertificate.tls.key` | string | `key` | Optional cert private key for ingress if you want to use your own TLS cert. Note that tls.key is a key and not nested. |
| `ingress.virtual_host_fqdn` | string | `prometheus.system.tanzu` | Hostname for accessing prometheus and alertmanager. |
| `kube_state_metrics.deployment.containers.resources.limits.cpu` | string | `` | Default CPU limits |
| `kube_state_metrics.deployment.containers.resources.limits.memory` | string | `` | Default Memory limits |
| `kube_state_metrics.deployment.containers.resources.requests.cpu` | string | `50m` | Default CPU requests |
| `kube_state_metrics.deployment.containers.resources.requests.memory` | string | `64Mi` | Default Memory requests |
| `kube_state_metrics.deployment.podAnnotations` | object |  | kube-state-metrics deployments pod annotations |
| `kube_state_metrics.deployment.podLabels` | object |  | kube-state-metrics deployments pod labels |
| `kube_state_metrics.deployment.replicas` | integer | `1` | Number of kube-state-metrics replicas. |
| `kube_state_metrics.service.annotations` | object |  | kube-state-metrics service annotations |
| `kube_state_metrics.service.labels` | object |  | kube-state-metrics service pod labels |
| `kube_state_metrics.service.port` | integer | `80` | The ports that are exposed by kube-state-metrics service. |
| `kube_state_metrics.service.targetPort` | integer | `8080` | Target Port to access on the kube-state-metrics pods. |
| `kube_state_metrics.service.telemetryPort` | integer | `81` | The ports that are exposed by kube-state-metrics service. |
| `kube_state_metrics.service.telemetryTargetPort` | integer | `8081` | Target Port to access on the kube-state-metrics pods. |
| `kube_state_metrics.service.type` | string | `ClusterIP` | The type of Kubernetes service to provision for kube-state-metrics. |
| `namespace` | string | `tanzu-system-monitoring` | The namespace in which prometheus is deployed. |
| `node_exporter.daemonset.containers.resources.limits.cpu` | string | `` | Default CPU limits |
| `node_exporter.daemonset.containers.resources.limits.memory` | string | `` | Default Memory limits |
| `node_exporter.daemonset.containers.resources.requests.cpu` | string | `50m` | Default CPU requests |
| `node_exporter.daemonset.containers.resources.requests.memory` | string | `64Mi` | Default Memory requests |
| `node_exporter.daemonset.hostNetwork` | boolean | `false` | The Host networking requested for this pod |
| `node_exporter.daemonset.podAnnotations` | object |  | node-exporter deployments pod annotations |
| `node_exporter.daemonset.podLabels` | object |  | node-exporter deployments pod labels |
| `node_exporter.daemonset.updatestrategy` | string | `RollingUpdate` | The type of DaemonSet update. |
| `node_exporter.service.annotations` | object |  | node-exporter service annotations |
| `node_exporter.service.labels` | object |  | node-exporter service pod labels |
| `node_exporter.service.port` | integer | `9100` | The ports that are exposed by node-exporter service. |
| `node_exporter.service.targetPort` | integer | `9100` | Target Port to access on the node-exporter pods. |
| `node_exporter.service.type` | string | `ClusterIP` | The type of Kubernetes service to provision for node-exporter. |
| `nsLimitRange.defaultLimits.cpu` | string | `` | Default CPU limits |
| `nsLimitRange.defaultLimits.memory` | string | `` | Default Memory limits |
| `nsLimitRange.defaultRequests.cpu` | string | `100m` | Default CPU requests |
| `nsLimitRange.defaultRequests.memory` | string | `128Mi` | Default Memory requests |
| `operator.args` | array | `[]` | Optional operator arguments to override defaults. Leave empty to use defaults from upstream. |
| `operator.env` | array | `[]` | Environment variables for operator container. If empty, defaults to GOGC=30 for memory optimization. If provided, it replaces the default (not merges). |
| `operator.replicas` | integer | `1` | Number of operator replicas. |
| `operator.resources.limits.cpu` | string | `200m` | CPU limit for operator container. |
| `operator.resources.limits.memory` | string | `200Mi` | Memory limit for operator container. |
| `operator.resources.requests.cpu` | string | `100m` | CPU request for operator container. |
| `operator.resources.requests.memory` | string | `100Mi` | Memory request for operator container. |
| `operator.webhook.enabled` | boolean | `false` | Enable admission webhook. Defaults to false. |
| `operator.webhook.replicas` | integer | `2` | Number of webhook replicas. Recommend 2+ for HA. |
| `operator.webhook.resources.limits.cpu` | string | `200m` | CPU limit for webhook container. |
| `operator.webhook.resources.limits.memory` | string | `200Mi` | Memory limit for webhook container. |
| `operator.webhook.resources.requests.cpu` | string | `50m` | CPU request for webhook container. |
| `operator.webhook.resources.requests.memory` | string | `50Mi` | Memory request for webhook container. |
| `priorityClassName` | string | `` | The user defined priorityClass name of deployment pod |
| `prometheus.config.alerting_rules_yml` | string | `{}
` | The YAML contents of the Prometheus alerting rules file. |
| `prometheus.config.alerts_yml` | string | `{}
` | Additional prometheus alerts can be configured in this YAML file. |
| `prometheus.config.prometheus_yml` | string | `global:
  evaluation_interval: 1m
  scrape_interval: 1m
  scrape_timeout: 10s
rule_files:
- /etc/config/alerting_rules.yml
- /etc/config/recording_rules.yml
- /etc/config/alerts
- /etc/config/rules
scrape_configs:
- job_name: 'prometheus'
  scrape_interval: 5s
  static_configs:
  - targets: ['localhost:9090']
- job_name: 'prometheus-pushgateway'
  honor_labels: true
  kubernetes_sd_configs:
  - role: service
  relabel_configs:
  - source_labels: [__meta_kubernetes_service_annotation_prometheus_io_probe]
    action: keep
    regex: pushgateway
- job_name: 'kube-state-metrics'
  static_configs:
  - targets: ['prometheus-kube-state-metrics.prometheus.svc.cluster.local:8080']

- job_name: 'node-exporter'
  static_configs:
  - targets: ['prometheus-node-exporter.prometheus.svc.cluster.local:9100']

- job_name: 'kubernetes-pods'
  kubernetes_sd_configs:
  - role: pod
  relabel_configs:
  - source_labels: [__meta_kubernetes_pod_annotation_prometheus_io_scrape]
    action: keep
    regex: true
  - source_labels: [ __meta_kubernetes_pod_annotation_prometheus_io_scheme ]
    action: replace
    target_label: __scheme__
    regex: (https?)
  - source_labels: [__meta_kubernetes_pod_annotation_prometheus_io_path]
    action: replace
    target_label: __metrics_path__
    regex: (.+)
  - source_labels: [__address__, __meta_kubernetes_pod_annotation_prometheus_io_port]
    action: replace
    regex: ([^:]+)(?::\d+)?;(\d+)
    replacement: $1:$2
    target_label: __address__
  - action: labelmap
    regex: __meta_kubernetes_pod_label_(.+)
  - source_labels: [__meta_kubernetes_namespace]
    action: replace
    target_label: kubernetes_namespace
  - source_labels: [__meta_kubernetes_pod_name]
    action: replace
    target_label: kubernetes_pod_name
  tls_config:
    ca_file: /var/run/secrets/kubernetes.io/serviceaccount/ca.crt
    insecure_skip_verify: true
  bearer_token_file: /var/run/secrets/kubernetes.io/serviceaccount/token
- job_name: kubernetes-nodes-cadvisor
  kubernetes_sd_configs:
  - role: node
  relabel_configs:
  - action: labelmap
    regex: __meta_kubernetes_node_label_(.+)
  - replacement: kubernetes.default.svc:443
    target_label: __address__
  - regex: (.+)
    replacement: /api/v1/nodes/$1/proxy/metrics/cadvisor
    source_labels:
    - __meta_kubernetes_node_name
    target_label: __metrics_path__
  scheme: https
  tls_config:
    ca_file: /var/run/secrets/kubernetes.io/serviceaccount/ca.crt
    insecure_skip_verify: true
  bearer_token_file: /var/run/secrets/kubernetes.io/serviceaccount/token
- job_name: kubernetes-apiservers
  kubernetes_sd_configs:
  - role: endpointslice
  relabel_configs:
  - action: keep
    regex: default;kubernetes;https
    source_labels:
    - __meta_kubernetes_namespace
    - __meta_kubernetes_service_name
    - __meta_kubernetes_endpointslice_port_name
  scheme: https
  tls_config:
    ca_file: /var/run/secrets/kubernetes.io/serviceaccount/ca.crt
    insecure_skip_verify: true
  bearer_token_file: /var/run/secrets/kubernetes.io/serviceaccount/token
alerting:
  alertmanagers:
  - scheme: http
    static_configs:
    - targets:
      - alertmanager.prometheus.svc:80
  - kubernetes_sd_configs:
      - role: pod
    relabel_configs:
    - source_labels: [__meta_kubernetes_namespace]
      regex: default
      action: keep
    - source_labels: [__meta_kubernetes_pod_label_app]
      regex: prometheus
      action: keep
    - source_labels: [__meta_kubernetes_pod_label_component]
      regex: alertmanager
      action: keep
    - source_labels: [__meta_kubernetes_pod_annotation_prometheus_io_probe]
      regex: .*
      action: keep
    - source_labels: [__meta_kubernetes_pod_container_port_number]
      regex:
      action: drop
` | The contents of the Prometheus config file. See https://prometheus.io/docs/prometheus/latest/configuration/configuration/ for more information. |
| `prometheus.config.recording_rules_yml` | string | `groups:
  - name: kube-apiserver.rules
    interval: 3m
    rules:
    - expr: |2
        (
          (
            sum(rate(apiserver_request_duration_seconds_count{job="kubernetes-apiservers",verb=~"LIST|GET"}[1d]))
            -
            (
              (
                sum(rate(apiserver_request_duration_seconds_bucket{job="kubernetes-apiservers",verb=~"LIST|GET",scope=~"resource|",le="0.1"}[1d]))
                or
                vector(0)
              )
              +
              sum(rate(apiserver_request_duration_seconds_bucket{job="kubernetes-apiservers",verb=~"LIST|GET",scope="namespace",le="0.5"}[1d]))
              +
              sum(rate(apiserver_request_duration_seconds_bucket{job="kubernetes-apiservers",verb=~"LIST|GET",scope="cluster",le="5"}[1d]))
            )
          )
          +
          ## errors
          sum(rate(apiserver_request_total{job="kubernetes-apiservers",verb=~"LIST|GET",code=~"5.."}[1d]))
        )
        /
        sum(rate(apiserver_request_total{job="kubernetes-apiservers",verb=~"LIST|GET"}[1d]))
      labels:
        verb: read
      record: apiserver_request:burnrate1d
    - expr: |2
        (
          (
            ## too slow
            sum(rate(apiserver_request_duration_seconds_count{job="kubernetes-apiservers",verb=~"LIST|GET"}[1h]))
            -
            (
              (
                sum(rate(apiserver_request_duration_seconds_bucket{job="kubernetes-apiservers",verb=~"LIST|GET",scope=~"resource|",le="0.1"}[1h]))
                or
                vector(0)
              )
              +
              sum(rate(apiserver_request_duration_seconds_bucket{job="kubernetes-apiservers",verb=~"LIST|GET",scope="namespace",le="0.5"}[1h]))
              +
              sum(rate(apiserver_request_duration_seconds_bucket{job="kubernetes-apiservers",verb=~"LIST|GET",scope="cluster",le="5"}[1h]))
            )
          )
          +
          ## errors
          sum(rate(apiserver_request_total{job="kubernetes-apiservers",verb=~"LIST|GET",code=~"5.."}[1h]))
        )
        /
        sum(rate(apiserver_request_total{job="kubernetes-apiservers",verb=~"LIST|GET"}[1h]))
      labels:
        verb: read
      record: apiserver_request:burnrate1h
    - expr: |2
        (
          (
            ## too slow
            sum(rate(apiserver_request_duration_seconds_count{job="kubernetes-apiservers",verb=~"LIST|GET"}[2h]))
            -
            (
              (
                sum(rate(apiserver_request_duration_seconds_bucket{job="kubernetes-apiservers",verb=~"LIST|GET",scope=~"resource|",le="0.1"}[2h]))
                or
                vector(0)
              )
              +
              sum(rate(apiserver_request_duration_seconds_bucket{job="kubernetes-apiservers",verb=~"LIST|GET",scope="namespace",le="0.5"}[2h]))
              +
              sum(rate(apiserver_request_duration_seconds_bucket{job="kubernetes-apiservers",verb=~"LIST|GET",scope="cluster",le="5"}[2h]))
            )
          )
          +
          ## errors
          sum(rate(apiserver_request_total{job="kubernetes-apiservers",verb=~"LIST|GET",code=~"5.."}[2h]))
        )
        /
        sum(rate(apiserver_request_total{job="kubernetes-apiservers",verb=~"LIST|GET"}[2h]))
      labels:
        verb: read
      record: apiserver_request:burnrate2h
    - expr: |2
        (
          (
            ## too slow
            sum(rate(apiserver_request_duration_seconds_count{job="kubernetes-apiservers",verb=~"LIST|GET"}[30m]))
            -
            (
              (
                sum(rate(apiserver_request_duration_seconds_bucket{job="kubernetes-apiservers",verb=~"LIST|GET",scope=~"resource|",le="0.1"}[30m]))
                or
                vector(0)
              )
              +
              sum(rate(apiserver_request_duration_seconds_bucket{job="kubernetes-apiservers",verb=~"LIST|GET",scope="namespace",le="0.5"}[30m]))
              +
              sum(rate(apiserver_request_duration_seconds_bucket{job="kubernetes-apiservers",verb=~"LIST|GET",scope="cluster",le="5"}[30m]))
            )
          )
          +
          ## errors
          sum(rate(apiserver_request_total{job="kubernetes-apiservers",verb=~"LIST|GET",code=~"5.."}[30m]))
        )
        /
        sum(rate(apiserver_request_total{job="kubernetes-apiservers",verb=~"LIST|GET"}[30m]))
      labels:
        verb: read
      record: apiserver_request:burnrate30m
    - expr: |2
        (
          (
            ## too slow
            sum(rate(apiserver_request_duration_seconds_count{job="kubernetes-apiservers",verb=~"LIST|GET"}[3d]))
            -
            (
              (
                sum(rate(apiserver_request_duration_seconds_bucket{job="kubernetes-apiservers",verb=~"LIST|GET",scope=~"resource|",le="0.1"}[3d]))
                or
                vector(0)
              )
              +
              sum(rate(apiserver_request_duration_seconds_bucket{job="kubernetes-apiservers",verb=~"LIST|GET",scope="namespace",le="0.5"}[3d]))
              +
              sum(rate(apiserver_request_duration_seconds_bucket{job="kubernetes-apiservers",verb=~"LIST|GET",scope="cluster",le="5"}[3d]))
            )
          )
          +
          ## errors
          sum(rate(apiserver_request_total{job="kubernetes-apiservers",verb=~"LIST|GET",code=~"5.."}[3d]))
        )
        /
        sum(rate(apiserver_request_total{job="kubernetes-apiservers",verb=~"LIST|GET"}[3d]))
      labels:
        verb: read
      record: apiserver_request:burnrate3d
    - expr: |2
        (
          (
            ## too slow
            sum(rate(apiserver_request_duration_seconds_count{job="kubernetes-apiservers",verb=~"LIST|GET"}[5m]))
            -
            (
              (
                sum(rate(apiserver_request_duration_seconds_bucket{job="kubernetes-apiservers",verb=~"LIST|GET",scope=~"resource|",le="0.1"}[5m]))
                or
                vector(0)
              )
              +
              sum(rate(apiserver_request_duration_seconds_bucket{job="kubernetes-apiservers",verb=~"LIST|GET",scope="namespace",le="0.5"}[5m]))
              +
              sum(rate(apiserver_request_duration_seconds_bucket{job="kubernetes-apiservers",verb=~"LIST|GET",scope="cluster",le="5"}[5m]))
            )
          )
          +
          ## errors
          sum(rate(apiserver_request_total{job="kubernetes-apiservers",verb=~"LIST|GET",code=~"5.."}[5m]))
        )
        /
        sum(rate(apiserver_request_total{job="kubernetes-apiservers",verb=~"LIST|GET"}[5m]))
      labels:
        verb: read
      record: apiserver_request:burnrate5m
    - expr: |2
        (
          (
            ## too slow
            sum(rate(apiserver_request_duration_seconds_count{job="kubernetes-apiservers",verb=~"LIST|GET"}[6h]))
            -
            (
              (
                sum(rate(apiserver_request_duration_seconds_bucket{job="kubernetes-apiservers",verb=~"LIST|GET",scope=~"resource|",le="0.1"}[6h]))
                or
                vector(0)
              )
              +
              sum(rate(apiserver_request_duration_seconds_bucket{job="kubernetes-apiservers",verb=~"LIST|GET",scope="namespace",le="0.5"}[6h]))
              +
              sum(rate(apiserver_request_duration_seconds_bucket{job="kubernetes-apiservers",verb=~"LIST|GET",scope="cluster",le="5"}[6h]))
            )
          )
          +
          ## errors
          sum(rate(apiserver_request_total{job="kubernetes-apiservers",verb=~"LIST|GET",code=~"5.."}[6h]))
        )
        /
        sum(rate(apiserver_request_total{job="kubernetes-apiservers",verb=~"LIST|GET"}[6h]))
      labels:
        verb: read
      record: apiserver_request:burnrate6h
    - expr: |2
        (
          (
            ## too slow
            sum(rate(apiserver_request_duration_seconds_count{job="kubernetes-apiservers",verb=~"POST|PUT|PATCH|DELETE"}[1d]))
            -
            sum(rate(apiserver_request_duration_seconds_bucket{job="kubernetes-apiservers",verb=~"POST|PUT|PATCH|DELETE",le="1"}[1d]))
          )
          +
          sum(rate(apiserver_request_total{job="kubernetes-apiservers",verb=~"POST|PUT|PATCH|DELETE",code=~"5.."}[1d]))
        )
        /
        sum(rate(apiserver_request_total{job="kubernetes-apiservers",verb=~"POST|PUT|PATCH|DELETE"}[1d]))
      labels:
        verb: write
      record: apiserver_request:burnrate1d
    - expr: |2
        (
          (
            ## too slow
            sum(rate(apiserver_request_duration_seconds_count{job="kubernetes-apiservers",verb=~"POST|PUT|PATCH|DELETE"}[1h]))
            -
            sum(rate(apiserver_request_duration_seconds_bucket{job="kubernetes-apiservers",verb=~"POST|PUT|PATCH|DELETE",le="1"}[1h]))
          )
          +
          sum(rate(apiserver_request_total{job="kubernetes-apiservers",verb=~"POST|PUT|PATCH|DELETE",code=~"5.."}[1h]))
        )
        /
        sum(rate(apiserver_request_total{job="kubernetes-apiservers",verb=~"POST|PUT|PATCH|DELETE"}[1h]))
      labels:
        verb: write
      record: apiserver_request:burnrate1h
    - expr: |2
        (
          (
            ## too slow
            sum(rate(apiserver_request_duration_seconds_count{job="kubernetes-apiservers",verb=~"POST|PUT|PATCH|DELETE"}[2h]))
            -
            sum(rate(apiserver_request_duration_seconds_bucket{job="kubernetes-apiservers",verb=~"POST|PUT|PATCH|DELETE",le="1"}[2h]))
          )
          +
          sum(rate(apiserver_request_total{job="kubernetes-apiservers",verb=~"POST|PUT|PATCH|DELETE",code=~"5.."}[2h]))
        )
        /
        sum(rate(apiserver_request_total{job="kubernetes-apiservers",verb=~"POST|PUT|PATCH|DELETE"}[2h]))
      labels:
        verb: write
      record: apiserver_request:burnrate2h
    - expr: |2
        (
          (
            ## too slow
            sum(rate(apiserver_request_duration_seconds_count{job="kubernetes-apiservers",verb=~"POST|PUT|PATCH|DELETE"}[30m]))
            -
            sum(rate(apiserver_request_duration_seconds_bucket{job="kubernetes-apiservers",verb=~"POST|PUT|PATCH|DELETE",le="1"}[30m]))
          )
          +
          sum(rate(apiserver_request_total{job="kubernetes-apiservers",verb=~"POST|PUT|PATCH|DELETE",code=~"5.."}[30m]))
        )
        /
        sum(rate(apiserver_request_total{job="kubernetes-apiservers",verb=~"POST|PUT|PATCH|DELETE"}[30m]))
      labels:
        verb: write
      record: apiserver_request:burnrate30m
    - expr: |2
        (
          (
            ## too slow
            sum(rate(apiserver_request_duration_seconds_count{job="kubernetes-apiservers",verb=~"POST|PUT|PATCH|DELETE"}[3d]))
            -
            sum(rate(apiserver_request_duration_seconds_bucket{job="kubernetes-apiservers",verb=~"POST|PUT|PATCH|DELETE",le="1"}[3d]))
          )
          +
          sum(rate(apiserver_request_total{job="kubernetes-apiservers",verb=~"POST|PUT|PATCH|DELETE",code=~"5.."}[3d]))
        )
        /
        sum(rate(apiserver_request_total{job="kubernetes-apiservers",verb=~"POST|PUT|PATCH|DELETE"}[3d]))
      labels:
        verb: write
      record: apiserver_request:burnrate3d
    - expr: |2
        (
          (
            ## too slow
            sum(rate(apiserver_request_duration_seconds_count{job="kubernetes-apiservers",verb=~"POST|PUT|PATCH|DELETE"}[5m]))
            -
            sum(rate(apiserver_request_duration_seconds_bucket{job="kubernetes-apiservers",verb=~"POST|PUT|PATCH|DELETE",le="1"}[5m]))
          )
          +
          sum(rate(apiserver_request_total{job="kubernetes-apiservers",verb=~"POST|PUT|PATCH|DELETE",code=~"5.."}[5m]))
        )
        /
        sum(rate(apiserver_request_total{job="kubernetes-apiservers",verb=~"POST|PUT|PATCH|DELETE"}[5m]))
      labels:
        verb: write
      record: apiserver_request:burnrate5m
    - expr: |2
        (
          (
            ## too slow
            sum(rate(apiserver_request_duration_seconds_count{job="kubernetes-apiservers",verb=~"POST|PUT|PATCH|DELETE"}[6h]))
            -
            sum(rate(apiserver_request_duration_seconds_bucket{job="kubernetes-apiservers",verb=~"POST|PUT|PATCH|DELETE",le="1"}[6h]))
          )
          +
          sum(rate(apiserver_request_total{job="kubernetes-apiservers",verb=~"POST|PUT|PATCH|DELETE",code=~"5.."}[6h]))
        )
        /
        sum(rate(apiserver_request_total{job="kubernetes-apiservers",verb=~"POST|PUT|PATCH|DELETE"}[6h]))
      labels:
        verb: write
      record: apiserver_request:burnrate6h
    - expr: |
        sum by (code,resource) (rate(apiserver_request_total{job="kubernetes-apiservers",verb=~"LIST|GET"}[5m]))
      labels:
        verb: read
      record: code_resource:apiserver_request_total:rate5m
    - expr: |
        sum by (code,resource) (rate(apiserver_request_total{job="kubernetes-apiservers",verb=~"POST|PUT|PATCH|DELETE"}[5m]))
      labels:
        verb: write
      record: code_resource:apiserver_request_total:rate5m
    - expr: |
        histogram_quantile(0.99, sum by (le, resource) (rate(apiserver_request_duration_seconds_bucket{job="kubernetes-apiservers",verb=~"LIST|GET"}[5m]))) > 0
      labels:
        quantile: "0.99"
        verb: read
      record: cluster_quantile:apiserver_request_duration_seconds:histogram_quantile
    - expr: |
        histogram_quantile(0.99, sum by (le, resource) (rate(apiserver_request_duration_seconds_bucket{job="kubernetes-apiservers",verb=~"POST|PUT|PATCH|DELETE"}[5m]))) > 0
      labels:
        quantile: "0.99"
        verb: write
      record: cluster_quantile:apiserver_request_duration_seconds:histogram_quantile
    - expr: |2
        sum(rate(apiserver_request_duration_seconds_sum{subresource!="log",verb!~"LIST|WATCH|WATCHLIST|DELETECOLLECTION|PROXY|CONNECT"}[5m])) without(instance, pod)
        /
        sum(rate(apiserver_request_duration_seconds_count{subresource!="log",verb!~"LIST|WATCH|WATCHLIST|DELETECOLLECTION|PROXY|CONNECT"}[5m])) without(instance, pod)
      record: cluster:apiserver_request_duration_seconds:mean5m
    - expr: |
        histogram_quantile(0.99, sum(rate(apiserver_request_duration_seconds_bucket{job="kubernetes-apiservers",subresource!="log",verb!~"LIST|WATCH|WATCHLIST|DELETECOLLECTION|PROXY|CONNECT"}[5m])) without(instance, pod))
      labels:
        quantile: "0.99"
      record: cluster_quantile:apiserver_request_duration_seconds:histogram_quantile
    - expr: |
        histogram_quantile(0.9, sum(rate(apiserver_request_duration_seconds_bucket{job="kubernetes-apiservers",subresource!="log",verb!~"LIST|WATCH|WATCHLIST|DELETECOLLECTION|PROXY|CONNECT"}[5m])) without(instance, pod))
      labels:
        quantile: "0.9"
      record: cluster_quantile:apiserver_request_duration_seconds:histogram_quantile
    - expr: |
        histogram_quantile(0.5, sum(rate(apiserver_request_duration_seconds_bucket{job="kubernetes-apiservers",subresource!="log",verb!~"LIST|WATCH|WATCHLIST|DELETECOLLECTION|PROXY|CONNECT"}[5m])) without(instance, pod))
      labels:
        quantile: "0.5"
      record: cluster_quantile:apiserver_request_duration_seconds:histogram_quantile
  - interval: 3m
    name: kube-apiserver-availability.rules
    rules:
    - expr: |2
        1 - (
          (
            ## write too slow
            sum(increase(apiserver_request_duration_seconds_count{verb=~"POST|PUT|PATCH|DELETE"}[30d]))
            -
            sum(increase(apiserver_request_duration_seconds_bucket{verb=~"POST|PUT|PATCH|DELETE",le="1"}[30d]))
          ) +
          (
            ## read too slow
            sum(increase(apiserver_request_duration_seconds_count{verb=~"LIST|GET"}[30d]))
            -
            (
              (
                sum(increase(apiserver_request_duration_seconds_bucket{verb=~"LIST|GET",scope=~"resource|",le="0.1"}[30d]))
                or
                vector(0)
              )
              +
              sum(increase(apiserver_request_duration_seconds_bucket{verb=~"LIST|GET",scope="namespace",le="0.5"}[30d]))
              +
              sum(increase(apiserver_request_duration_seconds_bucket{verb=~"LIST|GET",scope="cluster",le="5"}[30d]))
            )
          ) +
          ## errors
          sum(code:apiserver_request_total:increase30d{code=~"5.."} or vector(0))
        )
        /
        sum(code:apiserver_request_total:increase30d)
      labels:
        verb: all
      record: apiserver_request:availability30d
    - expr: |2
        1 - (
          sum(increase(apiserver_request_duration_seconds_count{job="kubernetes-apiservers",verb=~"LIST|GET"}[30d]))
          -
          (
            ## too slow
            (
              sum(increase(apiserver_request_duration_seconds_bucket{job="kubernetes-apiservers",verb=~"LIST|GET",scope=~"resource|",le="0.1"}[30d]))
              or
              vector(0)
            )
            +
            sum(increase(apiserver_request_duration_seconds_bucket{job="kubernetes-apiservers",verb=~"LIST|GET",scope="namespace",le="0.5"}[30d]))
            +
            sum(increase(apiserver_request_duration_seconds_bucket{job="kubernetes-apiservers",verb=~"LIST|GET",scope="cluster",le="5"}[30d]))
          )
          +
          ## errors
          sum(code:apiserver_request_total:increase30d{verb="read",code=~"5.."} or vector(0))
        )
        /
        sum(code:apiserver_request_total:increase30d{verb="read"})
      labels:
        verb: read
      record: apiserver_request:availability30d
    - expr: |2
        1 - (
          (
            ## too slow
            sum(increase(apiserver_request_duration_seconds_count{verb=~"POST|PUT|PATCH|DELETE"}[30d]))
            -
            sum(increase(apiserver_request_duration_seconds_bucket{verb=~"POST|PUT|PATCH|DELETE",le="1"}[30d]))
          )
          +
          ## errors
          sum(code:apiserver_request_total:increase30d{verb="write",code=~"5.."} or vector(0))
        )
        /
        sum(code:apiserver_request_total:increase30d{verb="write"})
      labels:
        verb: write
      record: apiserver_request:availability30d
    - expr: |
        sum by (code, verb) (increase(apiserver_request_total{job="kubernetes-apiservers",verb="LIST",code=~"2.."}[30d]))
      record: code_verb:apiserver_request_total:increase30d
    - expr: |
        sum by (code, verb) (increase(apiserver_request_total{job="kubernetes-apiservers",verb="GET",code=~"2.."}[30d]))
      record: code_verb:apiserver_request_total:increase30d
    - expr: |
        sum by (code, verb) (increase(apiserver_request_total{job="kubernetes-apiservers",verb="POST",code=~"2.."}[30d]))
      record: code_verb:apiserver_request_total:increase30d
    - expr: |
        sum by (code, verb) (increase(apiserver_request_total{job="kubernetes-apiservers",verb="PUT",code=~"2.."}[30d]))
      record: code_verb:apiserver_request_total:increase30d
    - expr: |
        sum by (code, verb) (increase(apiserver_request_total{job="kubernetes-apiservers",verb="PATCH",code=~"2.."}[30d]))
      record: code_verb:apiserver_request_total:increase30d
    - expr: |
        sum by (code, verb) (increase(apiserver_request_total{job="kubernetes-apiservers",verb="DELETE",code=~"2.."}[30d]))
      record: code_verb:apiserver_request_total:increase30d
    - expr: |
        sum by (code, verb) (increase(apiserver_request_total{job="kubernetes-apiservers",verb="LIST",code=~"3.."}[30d]))
      record: code_verb:apiserver_request_total:increase30d
    - expr: |
        sum by (code, verb) (increase(apiserver_request_total{job="kubernetes-apiservers",verb="GET",code=~"3.."}[30d]))
      record: code_verb:apiserver_request_total:increase30d
    - expr: |
        sum by (code, verb) (increase(apiserver_request_total{job="kubernetes-apiservers",verb="POST",code=~"3.."}[30d]))
      record: code_verb:apiserver_request_total:increase30d
    - expr: |
        sum by (code, verb) (increase(apiserver_request_total{job="kubernetes-apiservers",verb="PUT",code=~"3.."}[30d]))
      record: code_verb:apiserver_request_total:increase30d
    - expr: |
        sum by (code, verb) (increase(apiserver_request_total{job="kubernetes-apiservers",verb="PATCH",code=~"3.."}[30d]))
      record: code_verb:apiserver_request_total:increase30d
    - expr: |
        sum by (code, verb) (increase(apiserver_request_total{job="kubernetes-apiservers",verb="DELETE",code=~"3.."}[30d]))
      record: code_verb:apiserver_request_total:increase30d
    - expr: |
        sum by (code, verb) (increase(apiserver_request_total{job="kubernetes-apiservers",verb="LIST",code=~"4.."}[30d]))
      record: code_verb:apiserver_request_total:increase30d
    - expr: |
        sum by (code, verb) (increase(apiserver_request_total{job="kubernetes-apiservers",verb="GET",code=~"4.."}[30d]))
      record: code_verb:apiserver_request_total:increase30d
    - expr: |
        sum by (code, verb) (increase(apiserver_request_total{job="kubernetes-apiservers",verb="POST",code=~"4.."}[30d]))
      record: code_verb:apiserver_request_total:increase30d
    - expr: |
        sum by (code, verb) (increase(apiserver_request_total{job="kubernetes-apiservers",verb="PUT",code=~"4.."}[30d]))
      record: code_verb:apiserver_request_total:increase30d
    - expr: |
        sum by (code, verb) (increase(apiserver_request_total{job="kubernetes-apiservers",verb="PATCH",code=~"4.."}[30d]))
      record: code_verb:apiserver_request_total:increase30d
    - expr: |
        sum by (code, verb) (increase(apiserver_request_total{job="kubernetes-apiservers",verb="DELETE",code=~"4.."}[30d]))
      record: code_verb:apiserver_request_total:increase30d
    - expr: |
        sum by (code, verb) (increase(apiserver_request_total{job="kubernetes-apiservers",verb="LIST",code=~"5.."}[30d]))
      record: code_verb:apiserver_request_total:increase30d
    - expr: |
        sum by (code, verb) (increase(apiserver_request_total{job="kubernetes-apiservers",verb="GET",code=~"5.."}[30d]))
      record: code_verb:apiserver_request_total:increase30d
    - expr: |
        sum by (code, verb) (increase(apiserver_request_total{job="kubernetes-apiservers",verb="POST",code=~"5.."}[30d]))
      record: code_verb:apiserver_request_total:increase30d
    - expr: |
        sum by (code, verb) (increase(apiserver_request_total{job="kubernetes-apiservers",verb="PUT",code=~"5.."}[30d]))
      record: code_verb:apiserver_request_total:increase30d
    - expr: |
        sum by (code, verb) (increase(apiserver_request_total{job="kubernetes-apiservers",verb="PATCH",code=~"5.."}[30d]))
      record: code_verb:apiserver_request_total:increase30d
    - expr: |
        sum by (code, verb) (increase(apiserver_request_total{job="kubernetes-apiservers",verb="DELETE",code=~"5.."}[30d]))
      record: code_verb:apiserver_request_total:increase30d
    - expr: |
        sum by (code) (code_verb:apiserver_request_total:increase30d{verb=~"LIST|GET"})
      labels:
        verb: read
      record: code:apiserver_request_total:increase30d
    - expr: |
        sum by (code) (code_verb:apiserver_request_total:increase30d{verb=~"POST|PUT|PATCH|DELETE"})
      labels:
        verb: write
      record: code:apiserver_request_total:increase30d
` | The YAML contents of the Prometheus recording rules file. |
| `prometheus.config.rules_yml` | string | `{}
` | Additional prometheus rules can be configured in this YAML file. |
| `prometheus.deployment.configmapReload.containers.args` | array | `["--volume-dir=/etc/config","--webhook-url=http://127.0.0.1:9090/-/reload"]` | List of arguments passed via command-line to configmap reload container. For more guidance on configuration options consult the configmap-reload docs at https://github.com/jimmidyson/configmap-reload#usage |
| `prometheus.deployment.configmapReload.containers.resources.limits.cpu` | string | `` | Default CPU limits |
| `prometheus.deployment.configmapReload.containers.resources.limits.memory` | string | `` | Default Memory limits |
| `prometheus.deployment.configmapReload.containers.resources.requests.cpu` | string | `50m` | Default CPU requests |
| `prometheus.deployment.configmapReload.containers.resources.requests.memory` | string | `64Mi` | Default Memory requests |
| `prometheus.deployment.containers.args` | array | `["--storage.tsdb.retention.time=42d","--config.file=/etc/config/prometheus.yml","--storage.tsdb.path=/data","--web.console.libraries=/etc/prometheus/console_libraries","--web.console.templates=/etc/prometheus/consoles","--web.enable-lifecycle"]` | List of arguments passed via command-line to prometheus server. For more guidance on configuration options consult the Prometheus docs at https://prometheus.io/. |
| `prometheus.deployment.containers.livenessProbe` | object |  | Custom liveness probe for prometheus-server container. If empty, uses default. |
| `prometheus.deployment.containers.readinessProbe` | object |  | Custom readiness probe for prometheus-server container. If empty, uses default. |
| `prometheus.deployment.containers.resources.limits.cpu` | string | `` | Default CPU limits |
| `prometheus.deployment.containers.resources.limits.memory` | string | `` | Default Memory limits |
| `prometheus.deployment.containers.resources.requests.cpu` | string | `250m` | Default CPU requests |
| `prometheus.deployment.containers.resources.requests.memory` | string | `512Mi` | Default Memory requests |
| `prometheus.deployment.podAnnotations` | object |  | Prometheus deployments pod annotations |
| `prometheus.deployment.podLabels` | object |  | Prometheus deployments pod labels |
| `prometheus.deployment.replicas` | integer | `1` | Number of prometheus replicas. |
| `prometheus.deployment.rollingUpdate.maxSurge` | string | `25%` | Specifies the maximum number of Pods that can be created over the desired number of Pods. |
| `prometheus.deployment.rollingUpdate.maxUnavailable` | string | `25%` | Specifies the maximum number of Pods that can be unavailable during the update process. |
| `prometheus.deployment.updateStrategy` | string | `Recreate` | Type of prometheus upgrade strategy. |
| `prometheus.pvc.accessMode` | string | `ReadWriteOnce` | The name of the AccessModes to use for persistent volume claim. By default this is null and default provisioner is used |
| `prometheus.pvc.annotations` | object |  | Prometheus's persistent volume claim annotations |
| `prometheus.pvc.storage` | string | `150Gi` | The storage size for Prometheus server persistent volume claim. |
| `prometheus.pvc.storageClassName` | string | `` | The name of the StorageClass to use for persistent volume claim. By default this is null and default provisioner is used |
| `prometheus.service.annotations` | object |  | Prometheus service annotations |
| `prometheus.service.labels` | object |  | Prometheus service pod labels |
| `prometheus.service.port` | integer | `80` | The ports that are exposed by Prometheus service. |
| `prometheus.service.targetPort` | integer | `9090` | Target Port to access on the Prometheus pods. |
| `prometheus.service.type` | string | `ClusterIP` | The type of Kubernetes service to provision for Prometheus. |
| `pushgateway.deployment.containers.resources.limits.cpu` | string | `` | Default CPU limits |
| `pushgateway.deployment.containers.resources.limits.memory` | string | `` | Default Memory limits |
| `pushgateway.deployment.containers.resources.requests.cpu` | string | `50m` | Default CPU requests |
| `pushgateway.deployment.containers.resources.requests.memory` | string | `64Mi` | Default Memory requests |
| `pushgateway.deployment.podAnnotations` | object |  | pushgateway deployments pod annotations |
| `pushgateway.deployment.podLabels` | object |  | pushgateway deployments pod labels |
| `pushgateway.deployment.replicas` | integer | `1` | Number of pushgateway replicas. |
| `pushgateway.service.annotations` | object |  | pushgateway service annotations |
| `pushgateway.service.labels` | object |  | pushgateway service pod labels |
| `pushgateway.service.port` | integer | `9091` | The ports that are exposed by pushgateway service. |
| `pushgateway.service.targetPort` | integer | `9091` | Target Port to access on the pushgateway pods. |
| `pushgateway.service.type` | string | `ClusterIP` | The type of Kubernetes service to provision for pushgateway. |
| `userProvidedResources` | ? | `` | Raw multi-document YAML string or a YAML list of additional Kubernetes / Prometheus Operator resources (e.g. Certificates, Prometheus CR, ServiceMonitor, HTTPProxy, Secrets) to be rendered and deployed together with the package. If using a string, separate documents with "---". Leave empty to skip. Resources are applied in the order they appear; list them in dependency order to avoid reconcile failures (e.g. Issuer → Certificate → Secret → Prometheus CR → ServiceMonitor).  |
