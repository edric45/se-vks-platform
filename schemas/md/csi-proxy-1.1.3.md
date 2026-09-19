# csi-proxy 1.1.3+vmware.2-tkg.3

| Property | Type | Default | Description |
|---|---|---|---|
| `daemonset.updateStrategy` | string |  | Update strategy of daemonsets |
| `deployment.rollingUpdate.maxSurge` | integer |  | The maxSurge of rollingUpdate. Applied only if RollingUpdate is used as updateStrategy |
| `deployment.rollingUpdate.maxUnavailable` | integer |  | The maxUnavailable of rollingUpdate. Applied only if RollingUpdate is used as updateStrategy |
| `deployment.updateStrategy` | string |  | Update strategy of deployments |
| `infraProvider` | string | `vsphere` | Infrastructure provider in use |
| `namespace` | string |  | The namespace in which csi-proxy is deployed |
| `nodeSelector` | ? |  | NodeSelector configuration applied to all the deployments |
| `supports_windows_workload` | boolean | `true` | Whether the cluster has Windows node joined to support Windows workload |
