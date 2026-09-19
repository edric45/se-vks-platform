# ako 2.2.1+vmware.1-vks.1

| Property | Type | Default | Description |
|---|---|---|---|
| `AKOSettings.apiServerPort` | integer | `8080` | Internal port for AKO API server for the liveness probe of the AKO pod |
| `AKOSettings.blockedNamespaceList` | array | `[]` | List of system namespaces from which AKO will not listen any Kubernetes or Openshift object event |
| `AKOSettings.clusterName` | string | `my-cluster` | A unique identifier for the kubernetes cluster, that helps distinguish the objects for this cluster in the avi controller. |
| `AKOSettings.cniPlugin` | string | `` | Set the string if your CNI is calico or openshift or ovn-kubernetes. For Cilium CNI, set the string as cilium only when using Cluster Scope mode for IPAM and leave it empty if using Kubernetes Host Scope mode for IPAM. |
| `AKOSettings.deleteConfig` | string | `false` | Has to be set to true in configmap if user wants to delete AKO created objects from AVI |
| `AKOSettings.disableStaticRouteSync` | string | `false` | If the POD networks are reachable from the Avi SE, set this knob to true. |
| `AKOSettings.enableEVH` | boolean | `true` | This enables the Enhanced Virtual Hosting Model in Avi Controller for the Virtual Services |
| `AKOSettings.enableEvents` | string | `true` | Enables/disables Event broadcasting via AKO |
| `AKOSettings.enableExternalNameService` | boolean | `false` | Enables processing of Service type ExternalName |
| `AKOSettings.fullSyncFrequency` | string | `1800` | Interval (in seconds) at which AKO refreshes its internal cache of Avi cloud properties and resets retry counters. Note: This does not restore Avi objects deleted out-of-band. |
| `AKOSettings.ipFamily` | string | `` | This flag can take values V4 or V6 (default V4). This is for the backend pools to use ipv6 or ipv4. |
| `AKOSettings.istioEnabled` | boolean | `false` | This flag needs to be enabled when AKO is be to brought up in an Istio environment |
| `AKOSettings.layer7Only` | boolean | `false` | If this flag is switched on, then AKO will only do layer 7 loadbalancing. |
| `AKOSettings.logLevel` | string | `INFO` | Log level setting |
| `AKOSettings.namespaceSelector.labelKey` | string | `` | Label key for namespace selection |
| `AKOSettings.namespaceSelector.labelValue` | string | `` | Label value for namespace selection |
| `AKOSettings.primaryInstance` | boolean | `true` | Defines AKO instance is primary or not. Value `true` indicates that AKO instance is primary. In a multiple AKO deployment in a cluster, only one AKO instance should be primary. |
| `AKOSettings.servicesAPI` | boolean | `false` | Flag that enables AKO in services API mode |
| `AKOSettings.useDefaultSecretsOnly` | string | `false` | If this flag is set to true, AKO will only handle default secrets from the namespace where AKO is installed. This flag is applicable only to Openshift clusters. |
| `AKOSettings.vipPerNamespace` | string | `false` | Enabling this flag would tell AKO to create Parent VS per Namespace in EVH mode |
| `AKOSettings.vpcMode` | boolean | `false` | VPCMode enables AKO to operate in VPC mode. This flag is only applicable to NSX-T. |
| `ControllerSettings.cloudName` | string | `Default-Cloud` | The configured cloud name on the Avi controller. |
| `ControllerSettings.controllerHost` | string | `` | IP address or Hostname of Avi Controller |
| `ControllerSettings.controllerVersion` | string | `` | The controller API version |
| `ControllerSettings.dedicatedTenantMode` | boolean | `false` | If true, AKO cache will be scoped to its specific tenant instead of querying all tenants. |
| `ControllerSettings.serviceEngineGroupName` | string | `Default-Group` | Name of the ServiceEngine Group. |
| `ControllerSettings.tenantName` | string | `admin` | Name of the tenant where all the AKO objects will be created in AVI. |
| `ControllerSettings.vrfName` | string | `` | Name of the VRFContext. All Avi objects will be under this VRF. Applicable only in Vcenter Cloud. |
| `L4Settings.autoFQDN` | string | `default` | FQDN generation control. Options: default(<svc>.<ns>.<subdomain>), flat (<svc>-<ns>.<subdomain>), "disabled" |
| `L4Settings.defaultDomain` | string | `` | If multiple sub-domains are configured in the cloud, use this knob to set the default sub-domain to use for L4 VSes |
| `L4Settings.defaultLBController` | string | `false` | Enable/disable AKO as the default load balancer controller |
| `L7Settings.defaultIngController` | string | `true` | Enable/disable AKO as the default ingress controller |
| `L7Settings.fqdnReusePolicy` | string | `InterNamespaceAllowed` | Use this to control whether AKO allows cross-namespace usage of FQDNs |
| `L7Settings.noPGForSNI` | boolean | `false` | Switching this knob to true, will get rid of poolgroups from SNI VSes. Do not use this flag, if you do not want http caching. |
| `L7Settings.passthroughShardSize` | string | `SMALL` | Control the passthrough virtualservice numbers using this ENUM |
| `L7Settings.serviceType` | string | `NodePort` | Type of service for layer 7 virtualservices |
| `L7Settings.shardVSSize` | string | `LARGE` | Use this to control the layer 7 VS numbers. This applies to both secure/insecure VSes but does not apply for passthrough. |
| `NetworkSettings.bgpPeerLabels` | array | `[]` | Select BGP peers using bgpPeerLabels, for selective VsVip advertisement |
| `NetworkSettings.defaultDomain` | string | `` | The defaultDomain flag can be used to set the default sub-domain to use for the VS |
| `NetworkSettings.enableAutogw` | boolean | `true` | If true, the controller sends response traffic back to the source MAC address of the connection rather than to a default gateway. This is a cluster wide setting for all Virtual Services |
| `NetworkSettings.enableRHI` | boolean | `false` | This is a cluster wide setting for BGP peering |
| `NetworkSettings.nodeNetworkList` | array | `[]` | List of network and cidrs used in pool placement network for vcenter cloud |
| `NetworkSettings.nsxtT1LR` | string | `` | Unique ID (note: not display name) of the T1 Logical Router for Service Engine connectivity. Only applies to NSX-T cloud |
| `NetworkSettings.vipNetworkList` | array | `[]` | Network information of the VIP network. Multiple networks allowed only for AWS Cloud |
| `akoCRDOperator.enabled` | boolean | `true` | Enable/disable AKO CRD Operator functionality |
| `akoCRDOperatorLogFile` | string | `ako-crd-operator.log` | Name of the AKO CRD Operator log file |
| `akoGatewayLogFile` | string | `avi-gw.log` | Name of the AKO Gateway log file |
| `avicredentials.authtoken` | string | `` | Auth token for Avi Controller authentication (alternative to password) |
| `avicredentials.certificateAuthorityData` | string | `` | Certificate authority data for Avi Controller TLS verification |
| `avicredentials.password` | string | `` | Password for Avi Controller authentication |
| `avicredentials.username` | string | `` | Username for Avi Controller authentication |
| `crdOperatorResources` | ? |  | Resource limits and requests for AKO CRD Operator container (separate from main AKO, uses smaller resources by default) |
| `logFile` | string | `avi.log` | Name of the AKO log file |
| `mountPath` | string | `/log` | Mount path for the persistent volume inside AKO containers |
| `namespace` | string | `avi-system` | Namespace where AKO and related resources will be deployed |
| `nodePortSelector.key` | string | `` | Node selector key for NodePort services |
| `nodePortSelector.value` | string | `` | Node selector value for NodePort services |
| `persistentVolumeClaim` | string | `` | Name of an existing PersistentVolumeClaim to use for both AKO and CRD Operator logs. Leave empty to auto-create separate PVCs (recommended). |
| `persistentVolumeClaimSpec.accessMode` | string | `ReadWriteOnce` | Access mode for the PersistentVolumeClaim |
| `persistentVolumeClaimSpec.annotations` | object |  | Annotations to add to the PersistentVolumeClaim |
| `persistentVolumeClaimSpec.enabled` | boolean | `true` | Enable persistent volume for AKO logs. If false, emptyDir will be used (logs lost on pod restart) |
| `persistentVolumeClaimSpec.storage` | string | `` | Storage size for both PVCs. If not set, defaults to 2Gi for AKO and 1Gi for CRD Operator. If set, applies the same size to both. |
| `persistentVolumeClaimSpec.storageClassName` | string | `` | StorageClass name for the PVC. If empty, auto-detected from cluster topology or cluster default StorageClass will be used |
| `priorityClassName` | string | `` | Pod priority class for AKO and CRD Operator pods. |
| `resources` | ? |  | Resource limits and requests for AKO main container and Gateway API container |
| `statusStreamer.enabled` | boolean | `false` | Enable AKO status streamer sidecar for operational status streaming from Avi Controller. |
| `statusStreamer.resources.limits.cpu` | string | `128m` | CPU limit for status streamer sidecar |
| `statusStreamer.resources.limits.memory` | string | `128Mi` | Memory limit for status streamer sidecar |
| `statusStreamer.resources.requests.cpu` | string | `64m` | CPU request for status streamer sidecar |
| `statusStreamer.resources.requests.memory` | string | `64Mi` | Memory request for status streamer sidecar |
| `statusStreamer.statusStreamerLogFile` | string | `ako-status-streamer.log` | Name of the AKO status streamer log file |
| `vmciRelayResources.limits.cpu` | string | `100m` | CPU limit for VMCI relay sidecar |
| `vmciRelayResources.limits.memory` | string | `64Mi` | Memory limit for VMCI relay sidecar |
| `vmciRelayResources.requests.cpu` | string | `50m` | CPU request for VMCI relay sidecar |
| `vmciRelayResources.requests.memory` | string | `32Mi` | Memory request for VMCI relay sidecar |
