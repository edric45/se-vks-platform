# whereabouts 0.9.3+vmware.1-vks.1

| Property | Type | Default | Description |
|---|---|---|---|
| `createNamespace` | boolean | `true` | Use this boolean parameter to decide if create/delete the namespace for ExternalDNS deploying to when the package is installed/uninstalled |
| `namespace` | string | `whereabouts-cni` | Namespace where whereabouts daemonset deployed. |
| `nsLimitRange.defaultLimits.cpu` | string | `` | Default CPU limits |
| `nsLimitRange.defaultLimits.memory` | string | `` | Default Memory limits |
| `nsLimitRange.defaultRequests.cpu` | string | `100m` | Default CPU requests |
| `nsLimitRange.defaultRequests.memory` | string | `100Mi` | Default Memory requests |
| `priorityClassName` | string | `` | The user defined priorityClass name of deployment pod |
| `whereabouts.config.resources.limits.cpu` | string | `100m` | Daemonset cpu limits. |
| `whereabouts.config.resources.limits.memory` | string | `200Mi` | Daemonset memory limits. |
| `whereabouts.config.resources.requests.cpu` | string | `100m` | Daemonset cpu request. |
| `whereabouts.config.resources.requests.memory` | string | `100Mi` | Daemonset memory request. |
| `whereabouts.nodeSliceController.enable` | boolean | `true` |  |
| `whereabouts.nodeSliceController.resources.limits.cpu` | string | `100m` |  |
| `whereabouts.nodeSliceController.resources.limits.memory` | string | `200Mi` |  |
| `whereabouts.nodeSliceController.resources.requests.cpu` | string | `100m` |  |
| `whereabouts.nodeSliceController.resources.requests.memory` | string | `100Mi` |  |
| `whereabouts.tolerations` | array |  | If specified, append to the whereabouts pod's existing tolerations. |
