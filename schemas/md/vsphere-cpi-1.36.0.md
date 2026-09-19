# vsphere-cpi 1.36.0+vmware.2-tkg.1

| Property | Type | Default | Description |
|---|---|---|---|
| `daemonset.updateStrategy` | string |  | Update strategy of daemonsets |
| `deployment.rollingUpdate.maxSurge` | integer |  | The maxSurge of rollingUpdate. Applied only if RollingUpdate is used as updateStrategy |
| `deployment.rollingUpdate.maxUnavailable` | integer |  | The maxUnavailable of rollingUpdate. Applied only if RollingUpdate is used as updateStrategy |
| `deployment.updateStrategy` | string |  | Update strategy of deployments |
| `nodeSelector` | ? |  | NodeSelector configuration applied to all the deployments |
| `vsphereCPI.antreaNSXPodRoutingEnabled` | boolean | `false` | Enable pod routing with Antrea NSX |
| `vsphereCPI.cloudProviderExtraArgs.tls-cipher-suites` | string | `TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256,TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256,TLS_ECDHE_ECDSA_WITH_CHACHA20_POLY1305,TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384,TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305,TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384` | External arguments for cloud provider |
| `vsphereCPI.clusterAPIVersion` | string | `cluster.x-k8s.io/v1beta1` | Used in vsphereParavirtual mode, defines the Cluster API versions. Default: cluster.x-k8s.io/v1beta1. |
| `vsphereCPI.clusterKind` | string | `Cluster` | Used in vsphereParavirtual mode, defines the Cluster kind. Default: Cluster. |
| `vsphereCPI.clusterName` | string | `` | Used in vsphereParavirtual mode, defines the Cluster name. Default: ''. |
| `vsphereCPI.clusterUID` | string | `` | Used in vsphereParavirtual mode, defines the Cluster UID. Default: '' |
| `vsphereCPI.datacenter` | string |  | The datacenter in which VMs are created/located |
| `vsphereCPI.http_proxy` | string |  | HTTP proxy setting |
| `vsphereCPI.https_proxy` | string |  | HTTPS proxy setting |
| `vsphereCPI.image.path` | string | `` | The path of image |
| `vsphereCPI.image.pullPolicy` | string | `` | The pull policy of image |
| `vsphereCPI.image.repository` | string | `` | The repository of CPI image |
| `vsphereCPI.image.tag` | string | `` | The image tag |
| `vsphereCPI.insecureFlag` | boolean |  | The flag that disables TLS peer verification |
| `vsphereCPI.ipFamily` | string |  | The IP family configuration |
| `vsphereCPI.mode` | string | `vsphereCPI` | The vSphere mode. Either vsphereCPI or vsphereParavirtualCPI. Default value is vsphereCPI |
| `vsphereCPI.no_proxy` | string |  | No-proxy setting |
| `vsphereCPI.nsxt.clientCertData` | string | `` | Client certificate data for NSX-T |
| `vsphereCPI.nsxt.clientCertKeyData` | string | `` | Client certificate key for NSX-T |
| `vsphereCPI.nsxt.host` | string |  | The NSX-T server |
| `vsphereCPI.nsxt.insecure` | boolean | `false` | Insecure is to be set to true if NSX-T uses self-signed cert |
| `vsphereCPI.nsxt.insecureFlag` | string | `false` | (Deprecated. For backward compatibiility. Will be replaced by insecure. If both set, result is insecureFlag \\|\\| insecure) InsecureFlag is to be set to true if NSX-T uses self-signed cert |
| `vsphereCPI.nsxt.password` | string | `` | The password used to access NSX-T |
| `vsphereCPI.nsxt.podRoutingEnabled` | boolean | `false` | A flag that enables pod routing |
| `vsphereCPI.nsxt.remoteAuth` | string | `false` | (Deprecated. For backward compatibiility. Will be replaced by removeAuthEnabled. If both set, result is remoteAuth \\|\\| remoteAuthEnabled). RemoteAuth is to be set to true if NSX-T uses remote authentication (authentication done through the vIDM) |
| `vsphereCPI.nsxt.remoteAuthEnabled` | boolean | `false` | RemoteAuthEnabled is to be set to true if NSX-T uses remote authentication (authentication done through the vIDM) |
| `vsphereCPI.nsxt.rootCAData` | string | `` | The certificate authority for the server certificate for locally signed certificates |
| `vsphereCPI.nsxt.routes.clusterCidr` | string | `` | Cluster CIDR |
| `vsphereCPI.nsxt.routes.routerPath` | string | `` | NSX-T T0/T1 logical router path |
| `vsphereCPI.nsxt.secretName` | string | `cloud-provider-vsphere-nsxt-credentials` | The name of secret that stores CPI configuration |
| `vsphereCPI.nsxt.secretNamespace` | string | `kube-system` | The namespace of secret that stores CPI configuration |
| `vsphereCPI.nsxt.username` | string | `` | The username used to access NSX-T |
| `vsphereCPI.nsxt.vmcAccessToken` | string | `` | VMCAccessToken is VMC access token for token based authentification |
| `vsphereCPI.nsxt.vmcAuthHost` | string | `` | VMCAuthHost is VMC verification host for token based authentification |
| `vsphereCPI.password` | string |  | Password used to access a vSphere endpoint |
| `vsphereCPI.region` | string |  | The region used by vSphere multi-AZ feature |
| `vsphereCPI.server` | string |  | The IP address or FQDN of the vSphere endpoint |
| `vsphereCPI.supervisorMasterEndpointIP` | string | `` | Used in vsphereParavirtual mode, the endpoint IP of supervisor cluster's API server. Default: '' |
| `vsphereCPI.supervisorMasterPort` | string | `` | Used in vsphereParavirtual mode, the endpoint port of supervisor cluster's API server port. Default: '' |
| `vsphereCPI.tlsThumbprint` | string |  | The cryptographic thumbprint of the vSphere endpoint's certificate |
| `vsphereCPI.username` | string |  | Username used to access a vSphere endpoint |
| `vsphereCPI.vmExcludeExternalNetworkSubnetCidr` | string |  | Comma separated list of external network subnets to exclude from node IP selection. |
| `vsphereCPI.vmExcludeInternalNetworkSubnetCidr` | string |  | Comma separated list of internal network subnets to exclude from node IP selection. |
| `vsphereCPI.vmExternalNetwork` | string |  | External VM network name |
| `vsphereCPI.vmInternalNetwork` | string |  | Internal VM network name |
| `vsphereCPI.zone` | string |  | The zone used by vSphere multi-AZ feature |
