# nfs-client 4.13.2+vmware.1-vks.1

| Property | Type | Default | Description |
|---|---|---|---|
| `controller.nodeSelector` | object | `{}` | Additional node selector key/value pairs |
| `controller.resources.csi-provisioner.limits.cpu` | string | `` |  |
| `controller.resources.csi-provisioner.limits.memory` | string | `400Mi` |  |
| `controller.resources.csi-provisioner.requests.cpu` | string | `10m` |  |
| `controller.resources.csi-provisioner.requests.memory` | string | `20Mi` |  |
| `controller.resources.csi-resizer.limits.cpu` | string | `` |  |
| `controller.resources.csi-resizer.limits.memory` | string | `400Mi` |  |
| `controller.resources.csi-resizer.requests.cpu` | string | `10m` |  |
| `controller.resources.csi-resizer.requests.memory` | string | `20Mi` |  |
| `controller.resources.csi-snapshotter.limits.cpu` | string | `` |  |
| `controller.resources.csi-snapshotter.limits.memory` | string | `200Mi` |  |
| `controller.resources.csi-snapshotter.requests.cpu` | string | `10m` |  |
| `controller.resources.csi-snapshotter.requests.memory` | string | `20Mi` |  |
| `controller.resources.liveness-probe.limits.cpu` | string | `` |  |
| `controller.resources.liveness-probe.limits.memory` | string | `100Mi` |  |
| `controller.resources.liveness-probe.requests.cpu` | string | `10m` |  |
| `controller.resources.liveness-probe.requests.memory` | string | `20Mi` |  |
| `controller.resources.nfs.limits.cpu` | string | `` |  |
| `controller.resources.nfs.limits.memory` | string | `200Mi` |  |
| `controller.resources.nfs.requests.cpu` | string | `10m` |  |
| `controller.resources.nfs.requests.memory` | string | `20Mi` |  |
| `namespace` | string | `nfs-client` |  |
| `nfs.path` | string | `/nfs-storage` |  |
| `nfs.server` | string | `` |  |
| `node.resources.liveness-probe.limits.cpu` | string | `` |  |
| `node.resources.liveness-probe.limits.memory` | string | `100Mi` |  |
| `node.resources.liveness-probe.requests.cpu` | string | `10m` |  |
| `node.resources.liveness-probe.requests.memory` | string | `20Mi` |  |
| `node.resources.nfs.limits.cpu` | string | `` |  |
| `node.resources.nfs.limits.memory` | string | `300Mi` |  |
| `node.resources.nfs.requests.cpu` | string | `10m` |  |
| `node.resources.nfs.requests.memory` | string | `20Mi` |  |
| `node.resources.node-driver-registrar.limits.cpu` | string | `` |  |
| `node.resources.node-driver-registrar.limits.memory` | string | `100Mi` |  |
| `node.resources.node-driver-registrar.requests.cpu` | string | `10m` |  |
| `node.resources.node-driver-registrar.requests.memory` | string | `20Mi` |  |
| `nsLimitRange.defaultLimits.cpu` | string | `` | Default CPU limits |
| `nsLimitRange.defaultLimits.memory` | string | `` | Default Memory limits |
| `nsLimitRange.defaultRequests.cpu` | string | `10m` | Default CPU requests |
| `nsLimitRange.defaultRequests.memory` | string | `20Mi` | Default Memory requests |
| `storageClass.create` | boolean | `true` |  |
| `storageClass.defaultClass` | string | `false` |  |
| `storageClass.name` | string | `example-ss-nfs-client` |  |
| `storageClasses` | array | `[]` |  |
