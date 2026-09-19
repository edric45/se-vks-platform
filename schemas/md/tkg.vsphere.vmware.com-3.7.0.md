# tkg.vsphere.vmware.com 3.7.0+v1.36

| Property | Type | Default | Description |
|---|---|---|---|
| `capabilities` | array |  |  |
| `capabilitiesStatus.services` | object |  |  |
| `capabilitiesStatus.supervisor` | object |  |  |
| `cloudVC` | boolean | `false` | cloudVC indicates if the vCenter is deployed on cloud. |
| `controlPlaneCount` | integer | `3` | The value indicates the number of control planes enabled on the Supervisor. |
| `controlPlaneResources.cpuCount` | integer | `0` | The value indicates the number of CPUs available on the control plane VMs. |
| `controlPlaneResources.memoryMiB` | integer | `0` | The value indicates the amount of memory available on the control plane VMs. |
| `cpVMSize` | string | `LARGE` | cpVMSize indicates the capacity of the Supervisor Control Plane. It's derived from Supervisor's tshirt size. |
| `misconfiguredSoftwareChecksDryrunIntervalDuration` | string | `24h` | Duration after which the dry-run controller should be run again. Examples are '24h', '1d23h45m12s' etc. Defaults to 24h. |
| `namespacesCLIPluginVersion` | string | `v1.0.0` | namespacesCLIPluginVersion indicates the Supervisor recommended namespaces CLIPlugin CR version. |
| `networkProvider` | string | `NSX` | networkProvider indicates the Network Provider used on Supervisor. (e.g. NSX or vsphere-network) |
| `podVMSupported` | boolean | `false` | podVMSupported indicates if the Supervisor supports PodVMs. |
| `ssoDomain` | string | `vsphere.local` | ssoDomain indicates the name of the default SSO domain configured in vCenter. |
| `stretchedSupervisor` | boolean | `false` | This field indicates whether the environment is a Stretched Supervisor |
| `tmcNamespace` | string | `tmc-svc-namespace` | tmcNamespace indicates the namespace used for TMC to be deployed. |
| `vcPublicKeys` | string | `a2V5cw==` | vcPublicKeys indicates the base64 encoded vCenter OIDC issuer, client audience and the public keys in JWKS format. |
