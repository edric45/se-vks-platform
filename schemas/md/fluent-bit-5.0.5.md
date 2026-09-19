# fluent-bit 5.0.5+vmware.1-vks.1

| Property | Type | Default | Description |
|---|---|---|---|
| `fluent_bit.config.filters` | string | `[FILTER]
  Name                kubernetes
  Match               kube.*
  Kube_URL            https://kubernetes.default.svc:443
  Kube_CA_File        /var/run/secrets/kubernetes.io/serviceaccount/ca.crt
  Kube_Token_File     /var/run/secrets/kubernetes.io/serviceaccount/token
  Kube_Tag_Prefix     kube.var.log.containers.
  Merge_Log           On
  Merge_Log_Key       log_processed
  K8S-Logging.Parser  On
  K8S-Logging.Exclude On
[FILTER]
  Name                  modify
  Match                 kube.*
  Add                   text "K8s Container Logs"
  Copy                  kubernetes k8s
[FILTER]
  Name                  nest
  Match                 kube.*
  Operation             lift
  Nested_Under          kubernetes
[FILTER]
  Name                  modify
  Match                 kube.*
  Add                   text "K8s Container logs"
[FILTER]
  Name                  modify
  Match                 kube_systemd.*
  Add                   text "Linux Daemon Logs"
[FILTER]
  Name                  modify
  Match                 auth.*
  Add                   text "Linux Auth Logs"
[FILTER]
  Name                  modify
  Match                 apiserver_audit.*
  Add                   text "Kubernetes API Server Audit Logs"
` | Configuration for Fluent Bit filters, as a multiline YAML. See https://docs.fluentbit.io/manual/pipeline/filters/ for more information. |
| `fluent_bit.config.inputs` | string | `[INPUT]
  Name              tail
  Tag               kube.*
  Path              /var/log/containers/*.log
  Parser            cri
  DB                /var/log/flb_kube.db
  Mem_Buf_Limit     5MB
  Skip_Long_Lines   On
  Refresh_Interval  10
[INPUT]
  Name                systemd
  Tag                 kube_systemd.*
  Path                /var/log/journal
  DB                  /var/log/flb_kube_systemd.db
  Systemd_Filter      _SYSTEMD_UNIT=kubelet.service
  Systemd_Filter      _SYSTEMD_UNIT=containerd.service
  Read_From_Tail      On
  Strip_Underscores   On
[INPUT]
  Name              tail
  Tag               apiserver_audit.*
  Parser            json
  Path              /var/log/kubernetes/kube-apiserver.log
  DB                /var/log/flb_kube_audit.db
  Mem_Buf_Limit     50MB
  Refresh_Interval  10
  Skip_Long_Lines   On
[INPUT]
  Name              tail
  Tag               auth.*
  Path              /var/log/audit/auth.log
  Parser            authlog
  DB                /var/log/flb_system_auth.db
  Mem_Buf_Limit     50MB
  Refresh_Interval  10
  Skip_Long_Lines   On
` | Configuration for Fluent Bit inputs, as a multiline YAML. See https://docs.fluentbit.io/manual/pipeline/inputs for more information. |
| `fluent_bit.config.outputs` | string | `[OUTPUT]
  Name          http
  Match         *
  Host          10.85.37.241
  Port          9543
  URI           api/v2/events
  Format        json
  tls.debug     4
  tls           on
  tls.verify    off
  json_date_key timestamp
` | Configuration for Fluent Bit outputs, as a multiline YAML. See https://docs.fluentbit.io/manual/pipeline/outputs for more information. |
| `fluent_bit.config.parsers` | string | `[PARSER]
  Name cri
  Format regex
  Regex ^(?<time>[^ ]+) (?<stream>stdout|stderr) (?<logtag>[^ ]*) (?<message>.*)$
  Time_Key    time
  Time_Format %Y-%m-%dT%H:%M:%S.%L%z
[PARSER]
  Name        authlog
  Format      regex
  Regex       ^(?<time>[^ ]* {1,2}*) (?<host>[^ ]*) (?<ident>[a-zA-Z0-9_\/\.\-]*)(?:\[(?<pid>[0-9]+)\])?(?:[^\:]*\:)? *(?<message>.*)$
  Time_Key    time
  Time_Format %Y-%m-%dT%H:%M:%S.%L%z
  Time_Keep   On
[PARSER]
  Name   json
  Format json
  Time_Key time
  Time_Format %d/%b/%Y:%H:%M:%S %z
` | Configuration for Fluent Bit parsers, as a multiline YAML. See https://docs.fluentbit.io/manual/pipeline/parsers/ for more information. |
| `fluent_bit.config.plugins` | string | `[PLUGINS]
  Path /path/to/out_gstdout.so
` | Content for Fluent Bit plugins configuration file, as a multiline YAML |
| `fluent_bit.config.service` | string | `[Service]
  Flush         1
  Log_Level     info
  Daemon        off
  Parsers_File  parsers.conf
  HTTP_Server   On
  HTTP_Port     2020
  HTTP_Listen   0.0.0.0
` | Configuration for Fluent Bit service, as a multiline YAML. See https://docs.fluentbit.io/manual/administration/configuring-fluent-bit/configuration-file#config_section for more information. |
| `fluent_bit.config.streams` | string | `[STREAM_TASK]
  Name   cpu_test
  Exec   CREATE STREAM cpu WITH (tag='results') AS SELECT AVG(cpu_p) from STREAM:cpu_data WINDOW TUMBLING (5 SECOND);
` | Content for Fluent Bit streams file, as a multiline YAML |
| `fluent_bit.daemonset.env` | array | `[]` | List of environment variables to set in the fluent-bit container. |
| `fluent_bit.daemonset.podAnnotations` | object | `{}` | fluent-bit deployments pod annotations |
| `fluent_bit.daemonset.podLabels` | object |  | fluent-bit deployments pod labels |
| `fluent_bit.daemonset.priorityClassName` | string | `` | The user defined priorityClass name of deployment pod. It's not needed to set by default |
| `fluent_bit.daemonset.resources.limits.cpu` | string | `` | Default CPU limits |
| `fluent_bit.daemonset.resources.limits.memory` | string | `` | Default Memory limits |
| `fluent_bit.daemonset.resources.requests.cpu` | string | `200m` | Default CPU requests |
| `fluent_bit.daemonset.resources.requests.memory` | string | `256Mi` | Default Memory requests |
| `fluent_bit.daemonset.secretName` | string | `` | the secretName to keep the tls ca.crt. This is required when tls.ca_file is configured with input plugins. |
| `fluent_bit.ipv6Primary` | boolean | `false` | Set to true if installing the package on an IPv6 primary enabled cluster. |
| `namespace` | string | `tanzu-system-logging` | The namespace in which to deploy fluent-bit. |
| `nsLimitRange.defaultLimits.cpu` | string | `` | Default CPU limits |
| `nsLimitRange.defaultLimits.memory` | string | `` | Default Memory limits |
| `nsLimitRange.defaultRequests.cpu` | string | `200m` | Default CPU requests |
| `nsLimitRange.defaultRequests.memory` | string | `256Mi` | Default Memory requests |
