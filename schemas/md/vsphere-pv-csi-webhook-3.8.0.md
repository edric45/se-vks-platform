# vsphere-pv-csi-webhook 3.8.0+vmware.1-vks.1

| Property | Type | Default | Description |
|---|---|---|---|
| `vspherePVCSIWebhook.namespace` | string | `` |  |
| `vspherePVCSIWebhook.resources.limits.cpu` | string | `` | CPU limit to apply to the vsphere-webhook container. |
| `vspherePVCSIWebhook.resources.limits.memory` | string | `` | Memory limit to apply to the vsphere-webhook container. |
| `vspherePVCSIWebhook.resources.requests.cpu` | string | `10m` | CPU request to apply to the vsphere-webhook container. |
| `vspherePVCSIWebhook.resources.requests.memory` | string | `30Mi` | Memory request to apply to the vsphere-webhook container. |
| `vspherePVCSIWebhook.service` | string | `` |  |
