# cert-manager 1.20.2+vmware.1-vks.1

| Property | Type | Default | Description |
|---|---|---|---|
| `certManager.pspNames` | array | `["vmware-system-privileged"]` | PodSecurityPolicy names which cert-manager is allowed to use |
| `controller.enableGatewayAPI` | boolean | `true` | enable the Gateway API support |
| `controller.enableGatewayAPIListenerSet` | boolean | `false` | Enable reconciliation of Gateway API ListenerSet resources. This setting only enables the controller logic path for ListenerSet support, and is effective only when enableGatewayAPI is true and the feature gate ListenerSets is enabled. |
| `controller.feature_gates.ListenerSets` | boolean | `false` |  |
| `deploymentMode.resources.limits.cpu` | string | `` | Default CPU limits |
| `deploymentMode.resources.limits.memory` | string | `` | Default Memory limits |
| `deploymentMode.resources.requests.cpu` | string | `10m` | Default CPU requests |
| `deploymentMode.resources.requests.memory` | string | `64Mi` | Default Memory requests |
| `issuers` | array | `[]` | The ClusterIssuers to install - default: [] |
| `kubernetes_distribution` | string | `` | Optional: Kubernetes platform distribution that this package is being installed on. Accepted values: ['','openshift'] |
| `kubernetes_version` | string | `` | Optional: Kubernetes platform version that this package is being installed on. Accepted format: ['x.x.x'] |
| `namespace` | string | `cert-manager` | cert-manager's namespace - also used as its cluster resource namespace https://cert-manager.io/docs/configuration/#cluster-resource-namespace |
| `nsLimitRange.defaultLimits.cpu` | string | `` | Default CPU limits |
| `nsLimitRange.defaultLimits.memory` | string | `` | Default Memory limits |
| `nsLimitRange.defaultRequests.cpu` | string | `10m` | Default CPU requests |
| `nsLimitRange.defaultRequests.memory` | string | `64Mi` | Default Memory requests |
| `priorityClassName` | string | `` | The user defined priorityClass name of pod |
