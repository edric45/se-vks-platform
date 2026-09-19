# helm-controller 1.5.4+v4.01.04-vmware.1-vks.1

| Property | Type | Default | Description |
|---|---|---|---|
| `helmController.controllerOptions.concurrent` | integer | `4` | The number of concurrent HelmRelease reconciles |
| `helmController.controllerOptions.enableLeaderElection` | boolean | `true` | Enable leader election for controller manager |
| `helmController.controllerOptions.logEncoding` | string | `json` | Log encoding format. Can be 'json' or 'console' |
| `helmController.controllerOptions.logLevel` | string | `info` | Log verbosity level. Can be one of 'trace', 'debug', 'info', 'error' |
| `helmController.controllerOptions.noCrossNamespaceRefs` | boolean | `false` | When set to true, references between custom resources are allowed only if the reference and the referee are in the same namespace |
| `helmController.controllerOptions.watchAllNamespaces` | boolean | `true` | Watch for custom resources in all namespaces, if set to false it will only watch the runtime namespace |
| `helmController.priorityClassName` | string | `system-cluster-critical` | Priority class name for helm controller pod |
| `helmController.resources.limits.cpu` | string | `1000m` |  |
| `helmController.resources.limits.memory` | string | `1Gi` |  |
| `helmController.resources.requests.cpu` | string | `50m` |  |
| `helmController.resources.requests.memory` | string | `64Mi` |  |
| `namespace` | string | `vmware-system-helm` | Namespace where helm controller and source controller will be installed |
| `nsLimitRange.defaultLimits.cpu` | string | `` | The default cpu limits. |
| `nsLimitRange.defaultLimits.memory` | string | `` | The default memory limits. |
| `nsLimitRange.defaultRequests.cpu` | string | `50m` | The default cpu requests. |
| `nsLimitRange.defaultRequests.memory` | string | `64Mi` | The default memory requests. |
| `sourceController.controllerOptions.concurrent` | integer | `2` | The number of concurrent reconciles per controller |
| `sourceController.controllerOptions.enableLeaderElection` | boolean | `true` | Enable leader election for controller manager |
| `sourceController.controllerOptions.logEncoding` | string | `json` | Log encoding format. Can be 'json' or 'console' |
| `sourceController.controllerOptions.logLevel` | string | `info` | Log verbosity level. Can be one of 'trace', 'debug', 'info', 'error' |
| `sourceController.controllerOptions.storageAdvAddr` | string | `` | The advertised address of the static file server |
| `sourceController.controllerOptions.storagePath` | string | `/data` | The local storage path |
| `sourceController.controllerOptions.watchAllNamespaces` | boolean | `true` | Watch for custom resources in all namespaces, if set to false it will only watch the runtime namespace |
| `sourceController.priorityClassName` | string | `system-cluster-critical` | Priority class name for source controller pod |
| `sourceController.resources.limits.cpu` | string | `1000m` |  |
| `sourceController.resources.limits.memory` | string | `1Gi` |  |
| `sourceController.resources.requests.cpu` | string | `50m` |  |
| `sourceController.resources.requests.memory` | string | `64Mi` |  |
