# vsphere-pv-csi 3.8.0+vmware.3-tkg.1

| Property | Type | Default | Description |
|---|---|---|---|
| `daemonset.updateStrategy` | string |  | Update strategy of daemonsets |
| `deployment.rollingUpdate.maxSurge` | integer |  | The maxSurge of rollingUpdate. Applied only if RollingUpdate is used as updateStrategy |
| `deployment.rollingUpdate.maxUnavailable` | integer |  | The maxUnavailable of rollingUpdate. Applied only if RollingUpdate is used as updateStrategy |
| `deployment.updateStrategy` | string |  | Update strategy of deployments |
| `nodeSelector` | ? |  | NodeSelector configuration applied to all the deployments |
| `vspherePVCSI.cluster_name` | string | `` |  |
| `vspherePVCSI.cluster_uid` | string | `` |  |
| `vspherePVCSI.namespace` | string | `` |  |
| `vspherePVCSI.supervisor_master_endpoint_hostname` | string | `` |  |
| `vspherePVCSI.supervisor_master_port` | integer | `0` |  |
