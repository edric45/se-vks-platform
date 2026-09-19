# istio 1.30.0+vmware.1-vks.1

| Property | Type | Default | Description |
|---|---|---|---|
| `istio.ambientMode.enabled` | boolean | `false` | The flag to enable ambient mode in istio or not. The default value is false. |
| `istio.ambientMode.ztunnel.resources.limits.cpu` | string | `` | The limited CPUs for the container. |
| `istio.ambientMode.ztunnel.resources.limits.memory` | string | `` | The limited memories for the container. |
| `istio.ambientMode.ztunnel.resources.requests.cpu` | string | `200m` | Requested CPUs for the container. |
| `istio.ambientMode.ztunnel.resources.requests.memory` | string | `512Mi` | Requested Memories for the container. |
| `istio.enableGatewayAPIInference` | boolean | `false` | The flag to enables support for the Kubernetes Gateway API Inference extension feature. Note, support in Istio is currently experimental. |
| `istio.enableStrictMTLS` | boolean | `false` | The flag to enable strict mTLS in the mesh level. A default PeerAuthentication with mode STRICT is created in the mesh if it is true. The default value is false. |
| `istio.gateways.egress.autoscaling.enabled` | boolean | `false` | The flag to enable autoscaling on istio egress gateway. The default value is false. |
| `istio.gateways.egress.autoscaling.maxReplicas` | integer | `5` | The maximum number of replicas for the istio egress gateway. The default value is 5. |
| `istio.gateways.egress.autoscaling.minReplicas` | integer | `1` | The minimum number of replicas for the istio egress gateway. The default value is 1. |
| `istio.gateways.egress.enabled` | boolean | `false` | The flag to install Istio egress gateway or not. The default value is false. |
| `istio.gateways.egress.namespace` | string | `istio-egress` | The namespace to install Istio egress gateway. |
| `istio.gateways.egress.namespaceLimitRange.defaultLimits.cpu` | string | `` | The default CPU limits. |
| `istio.gateways.egress.namespaceLimitRange.defaultLimits.memory` | string | `` | The default Memory limits. |
| `istio.gateways.egress.namespaceLimitRange.defaultRequests.cpu` | string | `100m` | The default CPU requests. |
| `istio.gateways.egress.namespaceLimitRange.defaultRequests.memory` | string | `128Mi` | The default Memory requests. |
| `istio.gateways.egress.priorityClassName` | string | `` | The priority class assigned to the istio-egressgateway Pods. |
| `istio.gateways.egress.replicas` | integer | `1` | The replicas set in the istio-egressgateway Deployment. It takes effect when autoscaling is disabled. The default value is 1. |
| `istio.gateways.egress.resources.limits.cpu` | string | `2000m` | The limited CPUs for the container. |
| `istio.gateways.egress.resources.limits.memory` | string | `1024Mi` | The limited memories for the container. |
| `istio.gateways.egress.resources.requests.cpu` | string | `100m` | The requested CPUs for the container. |
| `istio.gateways.egress.resources.requests.memory` | string | `128Mi` | The limited memories for the container. |
| `istio.gateways.ingress.autoscaling.enabled` | boolean | `false` | The flag to enable autoscaling on istio ingress gateway. The default value is false. |
| `istio.gateways.ingress.autoscaling.maxReplicas` | integer | `5` | The maximum number of replicas for the istio ingress gateway. The default value is 5. |
| `istio.gateways.ingress.autoscaling.minReplicas` | integer | `1` | The minimum number of replicas for the istio ingress gateway. The default value is 1. |
| `istio.gateways.ingress.enabled` | boolean | `false` | The flag to install Istio ingress gateway or not. The default value is false. |
| `istio.gateways.ingress.namespace` | string | `istio-ingress` | The namespace to install Istio ingress gateway. |
| `istio.gateways.ingress.namespaceLimitRange.defaultLimits.cpu` | string | `` | The default CPU limits. |
| `istio.gateways.ingress.namespaceLimitRange.defaultLimits.memory` | string | `` | The default Memory limits. |
| `istio.gateways.ingress.namespaceLimitRange.defaultRequests.cpu` | string | `100m` | The default CPU requests. |
| `istio.gateways.ingress.namespaceLimitRange.defaultRequests.memory` | string | `128Mi` | The default Memory requests. |
| `istio.gateways.ingress.priorityClassName` | string | `` | The priority class assigned to the istio-ingressgateway Pods. |
| `istio.gateways.ingress.replicas` | integer | `1` | The replicas set in the istio-ingressgateway Deployment. It takes effect when autoscaling is disabled. The default value is 1. |
| `istio.gateways.ingress.resources.limits.cpu` | string | `2000m` | The limited CPUs for the container. |
| `istio.gateways.ingress.resources.limits.memory` | string | `1024Mi` | The limited memories for the container. |
| `istio.gateways.ingress.resources.requests.cpu` | string | `100m` | The requested CPUs for the container. |
| `istio.gateways.ingress.resources.requests.memory` | string | `128Mi` | The limited memories for the container. |
| `istio.istioCNI.enabled` | boolean | `true` | The flag to install istio-cni or not. It must be true if ambient mode is enabled. The default value is true. |
| `istio.istioCNI.resources.limits.cpu` | string | `` | The limited CPUs for the container. |
| `istio.istioCNI.resources.limits.memory` | string | `` | The limited memories for the container. |
| `istio.istioCNI.resources.requests.cpu` | string | `100m` | Requested CPUs for the container. |
| `istio.istioCNI.resources.requests.memory` | string | `100Mi` | Requested Memories for the container. |
| `istio.meshConfig.accessLogFile` | string | `/dev/stdout` | File path for the proxy access log. Empty value disables access logging. |
| `istio.meshConfig.connectTimeout` | string | `10s` | Connection timeout used by Envoy. The value must be >=1ms. The default value is 10s. |
| `istio.meshConfig.defaultProviders.tracing` | array |  | Configurations for the default tracing provider(s). By default, no tracing provider is set. |
| `istio.meshConfig.enableDNSProxy` | boolean | `false` | The flag to enable feature DNS Proxy with sidecar mode. The default value is false. Note, DNS Proxy is always enabled with ambient mode. |
| `istio.meshConfig.enablePrometheusMerge` | boolean | `true` | Flag to merge metrics exposed by the application with metrics from Envoy and Istio agent. Disable the flag if a separately managed Envoy is running with an Istio sidecar |
| `istio.meshConfig.enableTracing` | boolean | `true` | The flag to control generation of trace spans and request IDs |
| `istio.meshConfig.extensionProviders` | array |  | Configurations of the extension providers that extend istio’s functionality. By default, prometheus, stackdriver and envoyFileAccessLog are configured. envoyFileAccessLog can be disabled by setting meshConfig.accessLogFile with an empty string. |
| `istio.meshConfig.externalIstiod` | boolean | `false` | Controls whether one external istiod is enabled. It must be true if the current cluster is working as primary in the primary-remote model. |
| `istio.meshConfig.imagePullSecrets` | array |  | Specifies a list of Secrets in the same Namespace to pull images from the private docker registry for Istio injected resources. |
| `istio.meshConfig.ingressControllerMode` | string | `STRICT` | Defines whether to use Istio ingress controller for annotated or all ingress resources. |
| `istio.meshConfig.ingressSelector` | string | `ingressgateway` | Defines which gateway deployment to use as the Ingress controller. |
| `istio.meshConfig.meshID` | string | `` | The unique identifier for the service mesh. |
| `istio.meshConfig.meshMTLS.minProtocolVersion` | string | `TLSV1_2` | The minimum TLS protocol version. The default value is TLSV1_2. |
| `istio.meshConfig.multiCluster.clusterName` | string | `` | The cluster name. |
| `istio.meshConfig.multiCluster.clusterProfile` | string | `primary` | The profile of the current cluster. The supported values including primary and remote. |
| `istio.meshConfig.multiCluster.enabled` | boolean | `false` | Flag to enable the multi-cluster feature. The default value is false. |
| `istio.meshConfig.multiCluster.primaryClusterNames` | array |  | A list of the primary clusters. It must set if clusterProfile is remote. |
| `istio.meshConfig.multiCluster.remotePilotAddress` | string | `` | Configure remote pilot and istiod service and endpoint. It must set if clusterProfile is remote |
| `istio.meshConfig.network` | string | `` | Defines the network this cluster belongs to. |
| `istio.meshConfig.proxy.resources.limits.cpu` | string | `2000m` | The limited CPUs for the container. |
| `istio.meshConfig.proxy.resources.limits.memory` | string | `1024Mi` | The limited memories for the container. |
| `istio.meshConfig.proxy.resources.requests.cpu` | string | `100m` | The requested CPUs for the container. |
| `istio.meshConfig.proxy.resources.requests.memory` | string | `128Mi` | The requested memories for the container. |
| `istio.meshConfig.trustDomain` | string | `cluster.local` | The trust domain corresponds to the trust root of a system. |
| `istio.meshConfig.trustDomainAliases` | array | `[]` | The trust domain aliases represent the aliases of trustDomain |
| `istio.meshConfig.waypoint.resources.limits.cpu` | string | `2` | The limited CPUs for the container. |
| `istio.meshConfig.waypoint.resources.limits.memory` | string | `1Gi` | The limited memories for the container. |
| `istio.meshConfig.waypoint.resources.requests.cpu` | string | `100m` | The requested CPUs for the container. |
| `istio.meshConfig.waypoint.resources.requests.memory` | string | `128Mi` | The requested memories for the container. |
| `istio.namespace` | string | `istio-system` | The namespace in which to install istio |
| `istio.namespaceLimitRange.defaultLimits.cpu` | string | `` | The default CPU limits. |
| `istio.namespaceLimitRange.defaultLimits.memory` | string | `` | The default Memory limits. |
| `istio.namespaceLimitRange.defaultRequests.cpu` | string | `100m` | The default CPU requests. |
| `istio.namespaceLimitRange.defaultRequests.memory` | string | `64Mi` | The default Memory requests. |
| `istio.pilot.autoscaling.enabled` | boolean | `false` | The flag to enable autoscaling on istiod or not. The default value is false. |
| `istio.pilot.autoscaling.maxReplicas` | integer | `5` | The maximum number of replicas for the istio pilot. The default value is 5. |
| `istio.pilot.autoscaling.minReplicas` | integer | `2` | The minimum number of replicas for istio pilot. The default value is 2. |
| `istio.pilot.ignoreResources` | string |  | Comma-separated list of resource names that Pilot will not watch or reconcile. When set, only resources not in this list are reconciled, unless listed in includeResources. Items can be prefixed with '*.' to ignore a whole group (e.g. '*.istio.io' for Gateway API only mode). See https://github.com/istio/istio/pull/58137. |
| `istio.pilot.includeResources` | string |  | Comma-separated list of resource names that Pilot must watch even if they match ignoreResources. Only takes effect when ignoreResources is set. Use to re-enable specific Istio APIs when using a restrictive ignore list (e.g. include 'destinationrules.networking.istio.io'). Cannot be used together with meshConfig.multiCluster.enabled. |
| `istio.pilot.priorityClassName` | string | `` | The priority class assigned to the istiod Pods. |
| `istio.pilot.replicas` | integer | `2` | The replicas set in the istiod Deployment. It takes effect when autoscaling is disabled. The default value is 2. |
| `istio.pilot.resources.limits.cpu` | string | `` | The limited CPUs for the container. |
| `istio.pilot.resources.limits.memory` | string | `` | The limited memories for the container. |
| `istio.pilot.resources.requests.cpu` | string | `500m` | Requested CPUs for the container. |
| `istio.pilot.resources.requests.memory` | string | `2048Mi` | Requested Memories for the container. |
| `istio.support.priorityClassName` | string | `` | The priority class assigned to the istio-support Pod. |
| `istio.support.resources.limits.cpu` | string | `250m` | The limited CPUs for the container. |
| `istio.support.resources.limits.memory` | string | `256Mi` | The limited memories for the container. |
| `istio.support.resources.requests.cpu` | string | `100m` | Requested CPUs for the container. |
| `istio.support.resources.requests.memory` | string | `64Mi` | Requested Memories for the container. |
| `vks_cluster_version` | string | `` | Optional: VKS cluster version that addon is being installed on. |
