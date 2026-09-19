# antrea 2.6.2+vmware.1-tkg.1

| Property | Type | Default | Description |
|---|---|---|---|
| `antrea.config.antreaProxy.defaultLoadBalancerMode` | string |  | Determines how external traffic is processed when it's load balanced across Nodes by default |
| `antrea.config.antreaProxy.disableServiceHealthCheckServer` | boolean |  | Disables the health check server run by Antrea Proxy. |
| `antrea.config.antreaProxy.enable` | boolean |  | enable antreaProxy feature. |
| `antrea.config.antreaProxy.nodePortAddresses` | array | `[]` | Specifies the host IPv4/IPv6 addresses for NodePort. |
| `antrea.config.antreaProxy.proxyAll` | boolean |  | ProxyAll tells antrea-agent to proxy all Service traffic. |
| `antrea.config.antreaProxy.proxyLoadBalancerIPs` | boolean |  | Load-balance traffic destined to the External IPs of LoadBalancer services. |
| `antrea.config.antreaProxy.serviceProxyName` | string |  | AntreaProxy will only handle Services with the label that equals the provided value. |
| `antrea.config.antreaProxy.skipServices` | array | `[]` | List of Services which should be ignored by AntreaProxy. |
| `antrea.config.auditLogging.compress` | boolean |  | Compress enables gzip compression on rotated files. |
| `antrea.config.auditLogging.maxAge` | integer |  | MaxAge is the maximum number of days to retain old log files based on the timestamp encoded in their filename |
| `antrea.config.auditLogging.maxBackups` | integer |  | MaxBackups is the maximum number of old log files to retain |
| `antrea.config.auditLogging.maxSize` | integer |  | MaxSize is the maximum size in MB of a log file before it gets rotated. |
| `antrea.config.clientCAFile` | string |  | File path of the certificate bundle for all the signers that is recognized for incoming client certs. |
| `antrea.config.cloudProvider.name` | string |  | Cloud provider name. Disable the cloud controller if it is empty. |
| `antrea.config.defaultMTU` | integer |  | Default MTU to use for the host gateway interface and the network interface of each Pod |
| `antrea.config.disableTXChecksumOffload` | boolean |  | Disable TX checksum offloading for container network interfaces |
| `antrea.config.disableUdpTunnelOffload` | boolean |  | Disable UDP tunnel offload feature on default NIC |
| `antrea.config.dnsServerOverride` | string |  | Provide the address of DNS server, to override the kube-dns service |
| `antrea.config.egress.exceptCIDRs` | array |  | The CIDR ranges to which outbound Pod traffic will not be SNAT'd by Egresses. |
| `antrea.config.egress.maxEgressIPsPerNode` | integer |  | The maximum number of Egress IPs that can be assigned to a Node. |
| `antrea.config.egress.snatFullyRandomPorts` | boolean |  | Fully randomize source port mapping in SNAT rules used for egress traffic from pods to the external network. |
| `antrea.config.egress.uniqueMACForSubInterfaces` | boolean |  | Enable Egress VLAN sub-interfaces to use unique MAC addresses instead of inheriting the parent interface's MAC. |
| `antrea.config.enableBridgingMode` | boolean |  | Enable bridging mode of Pod network on Nodes. |
| `antrea.config.enableUsageReporting` | boolean |  | Enable usage reporting (telemetry) to VMware. |
| `antrea.config.featureGates.AdminNetworkPolicy` | boolean |  | Enable the use of Network Policy APIs (https://network-policy-api.sigs.k8s.io/api-overview) which helps administrators set security postures for their clusters. |
| `antrea.config.featureGates.AntreaIPAM` | boolean |  | Flag to enable/disable flexible IPAM mode |
| `antrea.config.featureGates.AntreaPolicy` | boolean |  | Flag to enable/disable antrea policy |
| `antrea.config.featureGates.AntreaProxy` | boolean |  | Flag to enable/disable antrea proxy |
| `antrea.config.featureGates.AntreaTraceflow` | boolean |  | Flag to enable/disable antrea traceflow |
| `antrea.config.featureGates.BGPPolicy` | boolean |  | Allow users to initiate BGP process on selected Kubernetes Nodes and advertise Service IPs, Pod IPs and Egress IPs to BGP peers. |
| `antrea.config.featureGates.CleanupStaleUDPSvcConntrack` | boolean |  | Enable support for cleaning up stale UDP Service conntrack connections in AntreaProxy |
| `antrea.config.featureGates.Egress` | boolean |  | Flag to enable/disable SNAT IPs of Pod egress traffic |
| `antrea.config.featureGates.EgressRBAC` | boolean |  | Enable Egress RBAC features. |
| `antrea.config.featureGates.EgressSeparateSubnet` | boolean |  | Allow users to allocate Egress IPs from a different subnet from the default Node subnet. |
| `antrea.config.featureGates.EgressTrafficShaping` | boolean |  | Enable Egress traffic shaping. |
| `antrea.config.featureGates.EndpointSlice` | boolean |  | Flag to enable/disable EndpointSlice support in AntreaProxy. If AntreaProxy is not enabled, this flag will not take effect |
| `antrea.config.featureGates.FlowExporter` | boolean |  | Flag to enable/disable flow exporter |
| `antrea.config.featureGates.L7FlowExporter` | boolean |  | Enable L7FlowExporter on Pods and Namespaces to export the application layer flows such as HTTP flows. |
| `antrea.config.featureGates.L7NetworkPolicy` | boolean |  | Enable users to protect their applications by specifying how they are allowed to communicate with others. |
| `antrea.config.featureGates.LoadBalancerModeDSR` | boolean |  | Allow users to specify the load balancer mode as DSR |
| `antrea.config.featureGates.Multicast` | boolean |  | Flag to enable/disable multicast traffic |
| `antrea.config.featureGates.Multicluster` | boolean |  | Enable Antrea Multi-cluster Gateway to support cross-cluster traffic.This feature is supported only with encap mode. |
| `antrea.config.featureGates.NFTablesHostNetworkMode` | boolean |  | Enable Antrea to use nftables instead of iptables to enforce netfilter rules in the Node's host network. |
| `antrea.config.featureGates.NetworkPolicyStats` | boolean |  | Flag to enable/disable network policy stats |
| `antrea.config.featureGates.NodeLatencyMonitor` | boolean |  | Enable NodeLatencyMonitor to monitor the latency between Nodes. |
| `antrea.config.featureGates.NodeNetworkPolicy` | boolean |  | Allow users to apply ClusterNetworkPolicy to Kubernetes Nodes. |
| `antrea.config.featureGates.NodePortLocal` | boolean |  | Flag to enable/disable NodePortLocal feature to make the pods reachable externally through NodePort |
| `antrea.config.featureGates.PacketCapture` | boolean |  | Enable PacketCapture feature which supports capturing packets and diagnose network issues. |
| `antrea.config.featureGates.PreferSameTrafficDistribution` | boolean |  | Enable PreferSameTrafficDistribution so that AntreaProxy can honor the Service's trafficDistribution settings. |
| `antrea.config.featureGates.SecondaryNetwork` | boolean |  | Enable support for provisioning secondary network interfaces for Pods (using Pod annotations). |
| `antrea.config.featureGates.ServiceExternalIP` | boolean |  | Flag to enable/disable managing external IPs for Load balancers services |
| `antrea.config.featureGates.ServiceTrafficDistribution` | boolean |  | Enable ServiceTrafficDistribution in AntreaProxy. |
| `antrea.config.featureGates.SupportBundleCollection` | boolean |  | Enable collecting support bundle files with SupportBundleCollection CRD. |
| `antrea.config.featureGates.TopologyAwareHints` | boolean |  | Enable TopologyAwareHints in AntreaProxy. This requires AntreaProxy and EndpointSlice to be enabled. |
| `antrea.config.featureGates.TrafficControl` | boolean |  | Enable mirroring or redirecting the traffic Pods send or receive. |
| `antrea.config.flowExporter.activeFlowTimeout` | string |  | Provide the active flow export timeout. |
| `antrea.config.flowExporter.collectorAddress` | string |  | Provide the IPFIX collector address as a string. |
| `antrea.config.flowExporter.enable` | boolean |  | Flag to enable flowExporter feature. |
| `antrea.config.flowExporter.idleFlowTimeout` | string |  | Provide the idle flow export timeout. |
| `antrea.config.flowExporter.pollInterval` | string |  | Provide flow poll interval as a duration string. |
| `antrea.config.flowExporter.protocolFilter` | array |  | Provide the set of protocols to filter specific flows that will be exported |
| `antrea.config.fqdnCacheMinTTL` | integer |  | fqdnCacheMinTTL helps address the issue of applications caching DNS response IPs beyond the TTL value for the DNS record. |
| `antrea.config.hostNetworkAcceleration.enable` | boolean |  | Enable to accelerate Pod-to-Pod traffic in the Node's host network using nftables flowtable when traffic mode is noEncap or hybrid. |
| `antrea.config.hostNetworkMode` | string |  | HostNetworkMode determines how antrea-agent implements Node host network netfilter rules, using either 'iptables' or 'nftables'. |
| `antrea.config.kubeAPIServerOverride` | string |  | Provide the address of Kubernetes apiserver. |
| `antrea.config.multicast.enable` | boolean |  | Flag to enable multicast feature. |
| `antrea.config.multicast.igmpQueryInterval` | string |  | The interval at which the antrea-agent sends IGMP queries to Pods. |
| `antrea.config.multicast.igmpQueryVersions` | array | `[]` | The versions of IGMP queries antrea-agent sends to pods. |
| `antrea.config.multicast.multicastInterfaces` | array | `[]` | The names of the interfaces on Nodes that are used to forward multicast traffic. |
| `antrea.config.multicastInterfaces` | array | `[]` | The names of the interfaces on Nodes that are used to forward multicast traffic. |
| `antrea.config.multicluster.enable` | boolean |  | Enable Antrea Multi-cluster Gateway to support cross-cluster traffic. |
| `antrea.config.multicluster.enablePodToPodConnectivity` | boolean |  | Enable Pod to Pod connectivity. |
| `antrea.config.multicluster.enableStretchedNetworkPolicy` | boolean |  | Enable Multi-cluster NetworkPolicy (ingress rules). |
| `antrea.config.multicluster.namespace` | string |  | The Namespace where Antrea Multi-cluster Controller is running.Default is antrea-agent's Namespace |
| `antrea.config.multicluster.trafficEncryptionMode` | string |  | Determines how cross-cluster traffic is encrypted. |
| `antrea.config.multicluster.wireGuard.port` | integer |  | WireGuard tunnel port for cross-cluster traffic. |
| `antrea.config.noSNAT` | boolean |  | Flag to enable/disable SNAT for the egress traffic from a Pod to the external network |
| `antrea.config.nodePortLocal.enabled` | boolean |  | Enable NodePortLocal feature. |
| `antrea.config.nodePortLocal.portRange` | string |  | Provide the port range used by NodePortLocal. |
| `antrea.config.packetInRate` | integer |  | packetInRate defines the OVS controller packet rate limits for different features. |
| `antrea.config.secondaryNetwork.ovsBridges` | array |  | Configuration of OVS bridges for the secondary network. |
| `antrea.config.serviceCIDR` | string |  | ClusterIP CIDR range for IPv4 Services |
| `antrea.config.serviceCIDRv6` | string |  | ClusterIP CIDR range for IPv6 Services |
| `antrea.config.snatFullyRandomPorts` | boolean |  | Fully randomize source port mapping in SNAT rules used for egress traffic from pods to the external network. |
| `antrea.config.tlsCipherSuites` | string |  | List of allowed cipher suites. If omitted, the default Go Cipher Suites will be used |
| `antrea.config.trafficEncapMode` | string |  | The traffic encapsulation mode. One of the following options => encap, noEncap, hybrid, networkPolicyOnly |
| `antrea.config.trafficEncryptionMode` | string |  | Determines how tunnel traffic is encrypted. One of the following options => none, ipsec, wireGuard |
| `antrea.config.transportInterface` | string |  | The name of the interface on Node which is used for tunneling or routing the traffic. |
| `antrea.config.transportInterfaceCIDRs` | array |  | The network CIDRs of the interface on Node which is used for tunneling or routing the traffic. |
| `antrea.config.tunnelCsum` | boolean |  | TunnelCsum determines whether to compute UDP encapsulation header (Geneve or VXLAN) checksums on outgoing packets. |
| `antrea.config.tunnelPort` | integer |  | TunnelPort is the destination port for UDP and TCP based tunnel protocols (Geneve, VXLAN, and STT). |
| `antrea.config.tunnelType` | string |  | Tunnel protocols used for encapsulating traffic across Nodes. One of the following options => geneve, vxlan, gre, stt |
| `antrea.config.wireGuard.port` | integer |  | The port for WireGuard to receive traffic. |
| `antrea.image.path` | string |  | The path of image |
| `antrea.image.pullPolicy` | string |  | The pull policy of image |
| `antrea.image.repository` | string |  | The repository of antrea image |
| `antrea.image.tag` | string |  | The image tag |
| `antrea.windows.config.antreaProxy.enable` | boolean |  |  |
| `antrea.windows.config.antreaProxy.proxyAll` | boolean |  |  |
| `antrea.windows.config.antreaProxy.serviceProxyName` | string |  |  |
| `antrea.windows.config.defaultMTU` | integer |  |  |
| `antrea.windows.config.featureGates.AntreaProxy` | boolean |  |  |
| `antrea.windows.config.featureGates.FlowExporter` | boolean |  |  |
| `antrea.windows.config.featureGates.NodePortLocal` | boolean |  |  |
| `antrea.windows.config.flowExporter.activeFlowTimeout` | string |  | Provide the active flow export timeout. |
| `antrea.windows.config.flowExporter.collectorAddress` | string |  | Provide the IPFIX collector address as a string. |
| `antrea.windows.config.flowExporter.idleFlowTimeout` | string |  | Provide the idle flow export timeout. |
| `antrea.windows.config.flowExporter.pollInterval` | string |  | Provide flow poll interval as a duration string. |
| `antrea.windows.config.kubeAPIServerOverride` | string |  |  |
| `antrea.windows.config.nodePortLocal.enabled` | boolean |  | Enable NodePortLocal feature. |
| `antrea.windows.config.nodePortLocal.portRange` | string |  | Provide the port range used by NodePortLocal. |
| `antrea.windows.config.serviceCIDR` | string |  |  |
| `antrea.windows.config.tlsCipherSuites` | string |  |  |
| `antrea.windows.config.transportInterface` | string |  | The name of the interface on Node which is used for tunneling or routing the traffic. |
| `antrea.windows.config.transportInterfaceCIDRs` | array | `[]` | The network CIDRs of the interface on Node which is used for tunneling or routing the traffic. |
| `antrea.windows.enable` | boolean |  | Enable indicates whether windows config shall be enabled in the cluster. |
| `antreaAPINetworkProxy.config.address` | string |  | Address to connect to the server. |
| `antreaAPINetworkProxy.config.agentID` | string |  | ID uniquely identifying the antrea-api-network-proxy agent to the server. It must match a DNS SAN in the client certificate presented to the server. |
| `antreaAPINetworkProxy.config.clientCert` | string |  | Client certificate presented to the server, base64 encoded. |
| `antreaAPINetworkProxy.config.clientKey` | string |  | Key of the client certificate presented to the server, base64 encoded. |
| `antreaAPINetworkProxy.config.serverCA` | string |  | CA used to validate certificate presented by the server, base64 encoded. |
| `antreaAPINetworkProxy.config.serverName` | string |  | Hostname to verify the server certificate. It is necessary when connecting through the TCP relay. |
| `antreaAPINetworkProxy.enable` | boolean |  | Enable indicates that a proxy gRPC tunnel will be established to a destination server, through which K8s API access can be provided. |
| `antrea_nsx.config.NSXManagers` | array |  | NSXManagers is a string slice that contains the IP address or domain name of the NSX Managers. |
| `antrea_nsx.config.bootstrapFrom` | string |  | BootstrapFrom is used to specify the bootstrap method, either Inline or SupervisorCluster.If SupervisorCluster is set, bootstrapSupervisorResourceName must be set, and clusterName, NSXManagers, vpcPath, ProxyEndpoints will be filled automatically by register job. |
| `antrea_nsx.config.bootstrapSupervisorResourceName` | string |  | bootstrapSupervisorResourceName is required if bootstrapFrom is SupervisorCluster. The value should be NSXServiceAccount resource name in the SupervisorCluster. |
| `antrea_nsx.config.ccp_adapter_conf.APIServerPort` | integer |  | Port on which the API server listens. |
| `antrea_nsx.config.ccp_adapter_conf.DebugServerPort` | integer |  | DebugServerPort is the port for the APIServer to serve on. Defaults to 16667. |
| `antrea_nsx.config.ccp_adapter_conf.EnableDebugServer` | boolean |  | EnableDebugServer indicates whether to enable the debug server. |
| `antrea_nsx.config.ccp_adapter_conf.NSXRPCDebug` | boolean |  | NSXRPCDebug indicates whether to enable NSX RPC debug mode. |
| `antrea_nsx.config.ccp_adapter_conf.RealizeErrorSyncIntervalSeconds` | integer |  | An interval for regularly report latest realization error in background. |
| `antrea_nsx.config.ccp_adapter_conf.RealizeTimeoutSeconds` | integer |  | Time to wait for realization. |
| `antrea_nsx.config.ccp_adapter_conf.ReconcilerBurst` | integer |  | Peak QPS =  ReconcilerWorkerCount * ReconcilerBurst |
| `antrea_nsx.config.ccp_adapter_conf.ReconcilerQPS` | number |  | Average QPS = ReconcilerWorkerCount * ReconcilerQPS |
| `antrea_nsx.config.ccp_adapter_conf.ReconcilerResyncSeconds` | integer |  | Period for Reconciler to rsync downstream events. |
| `antrea_nsx.config.ccp_adapter_conf.ReconcilerWorkerCount` | integer |  | Number of workers for reconciler. |
| `antrea_nsx.config.clusterName` | string |  | ClusterName is the name of the cluster. |
| `antrea_nsx.config.logFileMaxNum` | integer |  | log file number can be kept |
| `antrea_nsx.config.logFileMaxSize` | integer |  | log file max size in MB |
| `antrea_nsx.config.mp_adapter_conf.APIServerPort` | integer |  | Port on which the API server listens. |
| `antrea_nsx.config.mp_adapter_conf.ConditionTimeout` | integer |  | Monitor for determine the timeout. |
| `antrea_nsx.config.mp_adapter_conf.DebugServerPort` | integer |  | DebugServerPort is the port for the APIServer to serve on. Defaults to 16666. |
| `antrea_nsx.config.mp_adapter_conf.EnableDebugServer` | boolean |  | EnableDebugServer indicates whether to enable the debug server. |
| `antrea_nsx.config.mp_adapter_conf.InventoryBatchPeriod` | integer |  | InventoryBatchPeriod is the time in seconds to send out request even if the max batch size is not reached. |
| `antrea_nsx.config.mp_adapter_conf.InventoryBatchSize` | integer |  | InventoryBatchSize is the max objects in one inventory update request. |
| `antrea_nsx.config.mp_adapter_conf.InventoryGCPeriod` | integer |  | The time in seconds to run inventory garbage collection. |
| `antrea_nsx.config.mp_adapter_conf.NSXCAFile` | string |  | Path to the CA file. |
| `antrea_nsx.config.mp_adapter_conf.NSXClientAuthCertFile` | string |  | Path to the client authentication certificate file. |
| `antrea_nsx.config.mp_adapter_conf.NSXClientAuthKeyFile` | string |  | Path to the client authentication key file. |
| `antrea_nsx.config.mp_adapter_conf.NSXClientTimeout` | integer |  | Timeout for NSX client. |
| `antrea_nsx.config.mp_adapter_conf.NSXInsecure` | boolean |  | NSXInsecure indicates whether to enable insecure connections. |
| `antrea_nsx.config.mp_adapter_conf.NSXRPCConnType` | string |  | NsxRpcConnType is the NSX connection type: either mock or tnproxy. |
| `antrea_nsx.config.mp_adapter_conf.NSXRPCDebug` | boolean |  | NSXRPCDebug indicates whether to enable NSX RPC debug mode. |
| `antrea_nsx.config.mp_adapter_conf.NSXRemoteAuth` | boolean |  | NSXRemoteAuth indicates whether to use remote authentication. |
| `antrea_nsx.config.mp_adapter_conf.NSXVerifyServerName` | boolean |  | NSXVerifyServerName indicates whether to validate NSX server name when NSXInsecure is false. |
| `antrea_nsx.config.mp_adapter_conf.clusterType` | string | `WorkloadCluster` | ClusterType represents the type of the cluster. |
| `antrea_nsx.config.nsxCert` | string |  | NsxCert is base64 encoded NSX client certificate data.One line base64 encoded data. Can be generated by command: cat tls.crt \\| base64 -w 0 |
| `antrea_nsx.config.nsxKey` | string |  | NSXKey is base64 encoded NSX client key data.One line base64 encoded data. Can be generated by command: cat tls.key \\| base64 -w 0 |
| `antrea_nsx.config.proxyEndpoints.nsx_rpc_fwd_proxy` | array |  | NSXRPCFwdProxy is a string slice that contains the IP address or domain name of the NSX RPC forward proxy. |
| `antrea_nsx.config.proxyEndpoints.rest_api` | array |  | RestAPI is a string slice that contains the IP address or domain name of the REST API endpoint. |
| `antrea_nsx.config.vpcPath` | string |  | VPCPath is the VPC configuration path. |
| `antrea_nsx.enable` | boolean |  | Enable indicates whether nsxt adapter shall be enabled in the cluster. |
| `daemonset.updateStrategy` | string |  | Update strategy of daemonsets |
| `deployment.rollingUpdate.maxSurge` | integer |  | The maxSurge of rollingUpdate. Applied only if RollingUpdate is used as updateStrategy |
| `deployment.rollingUpdate.maxUnavailable` | integer |  | The maxUnavailable of rollingUpdate. Applied only if RollingUpdate is used as updateStrategy |
| `deployment.updateStrategy` | string |  | Update strategy of deployments |
| `flowAggregator.config.activeFlowRecordTimeout` | string | `60s` | A flow record will be exported to the collector once the elapsed time since the last export event in the flow aggregator is equal to the value of this timeout |
| `flowAggregator.config.aggregatorTransportProtocol` | string | `tcp` | Provide the transport protocol for the flow aggregator collecting process, which is tls, tcp or udp. |
| `flowAggregator.config.clusterID` | string | `` | Provide a clusterID to be added to records. By default, this ID is an auto-generated UUID which can be found in the antrea-cluster-identity ConfigMap. |
| `flowAggregator.config.flowAggregatorAddress` | string | `` | Provide an extra DNS name or IP address of flow aggregator for generating TLS certificate. |
| `flowAggregator.config.flowCollector.address` | string | `` | Provide the flow collector address as string with format <IP>:<port>[:<proto>], where proto is tcp or udp. |
| `flowAggregator.config.flowCollector.enable` | boolean | `false` | Enable is the switch to enable exporting flow records to external flow collector. |
| `flowAggregator.config.flowCollector.includeK8sNames` | boolean | `false` | Include the names of K8s objects (Pods, Nodes, ...) as information elements in exported records. Defaults to false |
| `flowAggregator.config.flowCollector.includeK8sUIDs` | boolean | `true` | Include the UIDs of K8s objects (Pods, Nodes, ...) as information elements in exported records. Defaults to true |
| `flowAggregator.config.flowCollector.maxIPFIXMsgSize` | integer | `0` | Maximum message size to use for IPFIX records. |
| `flowAggregator.config.flowCollector.recordFormat` | string | `IPFIX` | Provide format for records sent to the configured flow collector. Supported formats are IPFIX and JSON. |
| `flowAggregator.config.flowCollector.templateRefreshTimeout` | string | `600s` | Template retransmission interval when using the udp protocol to export records. |
| `flowAggregator.config.flowCollector.tls.clientCert` | string | `` | Client certificate presented to the server, base64 encoded. |
| `flowAggregator.config.flowCollector.tls.clientKey` | string | `` | Key of the client certificate presented to the server, base64 encoded. |
| `flowAggregator.config.flowCollector.tls.enable` | boolean | `false` | Enable TLS. |
| `flowAggregator.config.flowCollector.tls.minVersion` | string | `` | Minimum TLS version from: VersionTLS12, VersionTLS13. The current default is VersionTLS12. |
| `flowAggregator.config.flowCollector.tls.serverCA` | string | `` | CA used to validate certificate presented by the server, base64 encoded. |
| `flowAggregator.config.flowCollector.tls.serverName` | string | `` | ServerName is used to verify the hostname on the returned certificates. It is also included in the client's handshake (SNI) to support virtual hosting unless it is an IP address. |
| `flowAggregator.config.inactiveFlowRecordTimeout` | string | `90s` | A flow record is considered to be inactive if no matching record has been received by the flow aggregator in the specified interval |
| `flowAggregator.config.mode` | string | `Aggregate` |  |
| `flowAggregator.config.recordContents.podLabels` | boolean | `false` | Determine whether source and destination Pod labels will be included in the flow records. |
| `flowAggregator.enable` | boolean | `false` | Enable indicates whether flowAggregator shall be enabled in the cluster. |
| `infraProvider` | string |  | The cloud provider in use. One of the following options => aws, azure, vsphere, docker |
| `nodeSelector` | ? |  | NodeSelector configuration applied to all the deployments |
