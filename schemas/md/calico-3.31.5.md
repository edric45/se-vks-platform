# calico 3.31.5+vmware.3-fips-tkg.1

| Property | Type | Default | Description |
|---|---|---|---|
| `calico.cniImage.path` | string |  |  |
| `calico.cniImage.tag` | string |  |  |
| `calico.config.clusterCIDR` | string |  | The CIDR pool used to assign IP addresses to the pods in the cluster |
| `calico.config.ipv4AutodetectionMethod` | string | `interface=eth0` | The method to use to autodetect the IPv4 address for this host. If it is empty then the first-found method is used. |
| `calico.config.ipv6AutodetectionMethod` | string | `interface=eth0` | The method to use to autodetect the IPv6 address for this host. If it is empty then the first-found method is used. |
| `calico.config.skipCNIBinaries` | boolean | `false` | Skip the cni plugin binaries installation |
| `calico.config.vethMTU` | string | `0` | Maximum transmission unit setting |
| `calico.image.pullPolicy` | string |  |  |
| `calico.image.repository` | string |  |  |
| `calico.kubeControllerImage.path` | string |  |  |
| `calico.kubeControllerImage.tag` | string |  |  |
| `calico.nodeImage.path` | string |  |  |
| `calico.nodeImage.tag` | string |  |  |
| `calico.podDaemonImage.path` | string |  |  |
| `calico.podDaemonImage.tag` | string |  |  |
| `daemonset.updateStrategy` | string |  | Update strategy of daemonsets |
| `deployment.rollingUpdate.maxSurge` | integer |  | The maxSurge of rollingUpdate. Applied only if RollingUpdate is used as updateStrategy |
| `deployment.rollingUpdate.maxUnavailable` | integer |  | The maxUnavailable of rollingUpdate. Applied only if RollingUpdate is used as updateStrategy |
| `deployment.updateStrategy` | string |  | Update strategy of deployments |
| `infraProvider` | string | `vsphere` | Infrastructure provider in use |
| `ipFamily` | string |  | The IP family calico should be configured with |
| `namespace` | string |  | The namespace in which calico is deployed |
| `nodeSelector` | ? |  | NodeSelector configuration applied to all the deployments |
