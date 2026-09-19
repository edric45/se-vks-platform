# contour 1.33.4+vmware.1-vks.1

| Property | Type | Default | Description |
|---|---|---|---|
| `certificates.caDuration` | string | `8760h` | How long the CA certificate should be valid for. |
| `certificates.caRenewBefore` | string | `720h` | How long before expiration the CA certificate should be renewed. |
| `certificates.duration` | string |  | How long the certificates should be valid for. Deprecated: Use caDuration and leafDuration instead. For backwards compatibility if this is set it will take precedence over caDuration and leafDuration. |
| `certificates.leafDuration` | string | `720h` | How long the leaf certificates should be valid for. The leaf certificates are the certificates signed by the CA certificate. |
| `certificates.leafRenewBefore` | string | `360h` | How long before expiration the leaf certificates should be renewed. The leaf certificates are the certificates signed by the CA certificate. It is recommended to set this to a value that is at least the leaf duration minus the ca certificate renew before, so the leaf certificates can be rotated every CA renew cycle. |
| `certificates.renewBefore` | string |  | How long before expiration the certificates should be renewed. Deprecated: Use caRenewBefore and leafRenewBefore instead. For backwards compatibility if this is set it will take precedence over caRenewBefore and leafRenewBefore. |
| `contour.configFileContents` | object |  | The YAML contents of the Contour config file. See https://projectcontour.io/docs/1.33/configuration/#configuration-file for more information. |
| `contour.disableGRPCRoutes` | boolean | `true` | Whether to disable GRPCRoutes for Contour. Disable GRPCRoutes for VKR 1.32 and below version. |
| `contour.listenIPFamily` | string | `IPv6` | The IP family for the Contour control plane's xDS, metrics and health servers. IPv6 (the default) listens on IPv6 and IPv4 addresses, while IPv4 only listens on IPv4. |
| `contour.logLevel` | string | `info` | The Contour log level. Valid options are 'info' and 'debug'. |
| `contour.pspNames` | string | `vmware-system-restricted` | Pod security policy names to apply to Contour. |
| `contour.replicas` | integer | `2` | How many Contour pod replicas to have. |
| `contour.resources.contour.limits.cpu` | string | `` | CPU limit to apply to the contour container. |
| `contour.resources.contour.limits.memory` | string | `` | Memory limit to apply to the contour container. |
| `contour.resources.contour.requests.cpu` | string | `128m` | CPU request to apply to the contour container. |
| `contour.resources.contour.requests.memory` | string | `256Mi` | Memory request to apply to the contour container. |
| `contour.service.ipFamilies` | array | `[]` | The IP families for the Contour service. If not specified, this is determined by Kubernetes based on the IP family policy and the cluster's configuration. |
| `contour.service.ipFamilyPolicy` | string | `` | The IP family policy for the Contour service. If not specified, the Kubernetes default (SingleStack) applies. |
| `contour.useProxyProtocol` | boolean | `false` | Whether to enable PROXY protocol for all Envoy listeners. |
| `enableSupervisorServiceRbac` | boolean | `false` | Whether to add RBAC to allow view and edit contour CRDs. Used for when deploying contour as supervisor service. |
| `envoy.bootstrap.overloadManager.downstreamMaxConnections` | integer | `0` | Defines the Envoy global downstream connection limit. If not specified or set to 0, no limit will be configured. |
| `envoy.bootstrap.overloadManager.maxHeap` | integer | `0` | Defines the maximum heap size in bytes until overload manager stops accepting new connections. If not specified or set to 0, no limit will be configured. |
| `envoy.hostNetwork` | boolean | `false` | Whether to enable host networking for the Envoy pods. |
| `envoy.hostPorts.enable` | boolean | `true` | Whether to enable host ports. If false, http & https are ignored. |
| `envoy.hostPorts.http` | integer | `80` | If enable == true, the host port number to expose Envoy's HTTP listener on. |
| `envoy.hostPorts.https` | integer | `443` | If enable == true, the host port number to expose Envoy's HTTPS listener on. |
| `envoy.listenIPFamily` | string | `IPv6` | The IP family for the Envoy listeners. IPv6 (the default) listens on IPv6 and IPv4 addresses, while IPv4 only listens on IPv4. |
| `envoy.logLevel` | string | `info` | The Envoy log level. |
| `envoy.pspNames` | string | `` | Pod security policy names to apply to Envoy. |
| `envoy.service.annotations` | object |  | Annotations to set on the Envoy service. |
| `envoy.service.aws.LBType` | string | `classic` | The type of AWS load balancer to provision. Options are 'classic' and 'nlb'. |
| `envoy.service.disableWait` | boolean | `false` | This setting is no longer supported and is included in the schema for backwards compatibility only. |
| `envoy.service.externalTrafficPolicy` | string | `` | The external traffic policy for the Envoy service. If type is 'ClusterIP', this field is ignored. Otherwise, defaults to 'Cluster' for vsphere and 'Local' for others. |
| `envoy.service.ipFamilies` | array | `[]` | The IP families for the Envoy service. If not specified, this is determined by Kubernetes based on the IP family policy and the cluster's configuration. |
| `envoy.service.ipFamilyPolicy` | string | `` | The IP family policy for the Envoy service. If not specified, the Kubernetes default (SingleStack) applies. |
| `envoy.service.loadBalancerIP` | string | `` | The desired load balancer IP. If type is not 'LoadBalancer', this field is ignored. It is up to the cloud provider whether to honor this request. If not specified, then load balancer IP will be assigned by the cloud provider. This field configures the Service.Spec.LoadBalancerIP field which is deprecated as of Kubernetes 1.24. Users are encouraged to use cloud-provider specific Service annotations instead. |
| `envoy.service.loadBalancerTLSTermination` | boolean | `false` | When true, forwards traffic from 443 on the LoadBalancer to 8080 on the Envoy pod when terminating TLS at the LoadBalancer. Removes the http port entry on the Envoy Service. |
| `envoy.service.nodePorts.http` | integer | `0` | The node port number to expose Envoy's HTTP listener on. If not specified, a node port will be auto-assigned by Kubernetes. If loadBalancerTLSTermination is true, this value will be ignored, as the http port entry will be removed. |
| `envoy.service.nodePorts.https` | integer | `0` | The node port number to expose Envoy's HTTPS listener on. If not specified, a node port will be auto-assigned by Kubernetes. |
| `envoy.service.type` | string | `` | The type of Kubernetes service to provision for Envoy. Valid values are 'LoadBalancer', 'NodePort', and 'ClusterIP'. If not specified, will default to 'NodePort' for vsphere and 'LoadBalancer' for others. |
| `envoy.terminationGracePeriodSeconds` | integer | `300` | The termination grace period, in seconds, for the Envoy pods. |
| `envoy.workload.replicas` | integer | `2` | The number of Envoy replicas to deploy when 'type' is set to 'Deployment'. If not specified, it will default to '2'. |
| `envoy.workload.resources.envoy.limits.cpu` | string | `` | CPU limit to apply to the envoy container. |
| `envoy.workload.resources.envoy.limits.memory` | string | `` | Memory limit to apply to the envoy container. |
| `envoy.workload.resources.envoy.requests.cpu` | string | `128m` | CPU request to apply to the envoy container. |
| `envoy.workload.resources.envoy.requests.memory` | string | `256Mi` | Memory request to apply to the envoy container. |
| `envoy.workload.resources.envoyInitConfig.limits.cpu` | string | `` | CPU limit to apply to the envoy-initconfig container. |
| `envoy.workload.resources.envoyInitConfig.limits.memory` | string | `` | Memory limit to apply to the envoy-initconfig container. |
| `envoy.workload.resources.envoyInitConfig.requests.cpu` | string | `128m` | CPU request to apply to the envoy-initconfig container. |
| `envoy.workload.resources.envoyInitConfig.requests.memory` | string | `256Mi` | Memory request to apply to the envoy-initconfig container. |
| `envoy.workload.resources.shutdownManager.limits.cpu` | string | `` | CPU limit to apply to the shutdown-manager container. |
| `envoy.workload.resources.shutdownManager.limits.memory` | string | `` | Memory limit to apply to the shutdown-manager container. |
| `envoy.workload.resources.shutdownManager.requests.cpu` | string | `10m` | CPU request to apply to the shutdown-manager container. |
| `envoy.workload.resources.shutdownManager.requests.memory` | string | `16Mi` | Memory request to apply to the shutdown-manager container. |
| `envoy.workload.type` | string | `DaemonSet` | The type of Kubernetes workload Envoy is deployed as. Options are 'Deployment' or 'DaemonSet'. If not specified, will default to 'DaemonSet'. |
| `infrastructure_provider` | string | `vsphere` | The underlying infrastructure provider. Options are vsphere, aws, and azure. This field is not required, but enables better validation and defaulting if provided. |
| `kubernetes_distribution` | string | `` | The distribution of Kubernetes, used to determine if distribution-specific configurations need to be applied. Options are empty and openshift. If running on an Openshift cluster, this must be set to openshift. When set to openshift, a Role and RoleBinding are created to associate Contour's controllers with the appropriate Openshift Security Context Constraint resource. |
| `kubernetes_version` | string | `0.0.0` | The version of Kubernetes being used, for enabling version-specific behaviors. Accept any valid major.minor.patch version of Kubernetes. This field is optional. Currently only has effect when kubernetes_distribution is set to openshift. |
| `namespace` | string | `tanzu-system-ingress` | The namespace in which to deploy Contour and Envoy. |
| `nsLimitRange.defaultLimits.cpu` | string | `` | The default cpu limits. |
| `nsLimitRange.defaultLimits.memory` | string | `` | The default memory limits. |
| `nsLimitRange.defaultRequests.cpu` | string | `128m` | The default cpu requests. |
| `nsLimitRange.defaultRequests.memory` | string | `256Mi` | The default memory requests. |
| `priorityClassName` | string | `` | Pod priority class name to apply to Contour. |
| `registry_secret_names` | array | `["contour-reg-creds"]` | The names of the placeholder secrets that will contain registry credentials to pull the Contour and Envoy images. |
