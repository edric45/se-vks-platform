# multus-cni 4.2.4+vmware.1-vks.1

| Property | Type | Default | Description |
|---|---|---|---|
| `configmap.cniVersion` | string | `0.3.1` | CNI spec version in multus.conf. |
| `configmap.logLevel` | string | `verbose` | Multus log level. Valid options are 'debug', 'verbose', 'error' and 'panic'. Defaults to 'verbose'. |
| `configmap.multusConfigFile` | string | `auto` | How to configure multus.conf. |
| `daemonset.resources.limits.cpu` | string | `300m` | Daemonset cpu limits. |
| `daemonset.resources.limits.memory` | string | `150Mi` | Daemonset memory limits. |
| `daemonset.resources.requests.cpu` | string | `200m` | Daemonset cpu request. |
| `daemonset.resources.requests.memory` | string | `100Mi` | Daemonset memory request. |
| `nads` | array | `[]` | Network Attachment Definitions to create |
| `namespace` | string | `multus-cni` | Namespace where multus-cni daemonset will be deployed. |
| `nsLimitRange.defaultLimits.cpu` | string | `` | Default CPU limits |
| `nsLimitRange.defaultLimits.memory` | string | `` | Default Memory limits |
| `nsLimitRange.defaultRequests.cpu` | string | `100m` | Default CPU requests |
| `nsLimitRange.defaultRequests.memory` | string | `128Mi` | Default Memory requests |
| `priorityClassName` | string | `` | The user defined priorityClass name of deployment pod |
