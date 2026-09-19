# telegraf 1.38.4+vmware.1-vks.1

| Property | Type | Default | Description |
|---|---|---|---|
| `SecretImportNamespace` | string | `kube-system` | The namespace in which the telegraf Secret will be imported |
| `agent.interval` | string | `300s` | interval to scrape metrics |
| `clusterRole.rules` | array | `[]` |  |
| `cpOnlyforDaemonSet` | boolean | `false` | whether only Telegraf DaemonSet running on control plane node |
| `createNamespace` | boolean | `true` | Whether to create namespace specified for telegraf |
| `daemonSet.resources.limits.cpu` | string | `500m` |  |
| `daemonSet.resources.limits.memory` | string | `500Mi` |  |
| `daemonSet.resources.requests.cpu` | string | `0m` |  |
| `daemonSet.resources.requests.memory` | string | `100Mi` |  |
| `deploymentMode.resources.limits.cpu` | string | `500m` |  |
| `deploymentMode.resources.limits.memory` | string | `500Mi` |  |
| `deploymentMode.resources.requests.cpu` | string | `0m` |  |
| `deploymentMode.resources.requests.memory` | string | `100Mi` |  |
| `domainName` | string | `cluster.local` | domain name of the the current VKS cluster |
| `enabledDaemonSet` | boolean | `true` | whether enable Telegraf DaemonSet |
| `enabledDeployment` | boolean | `true` | whether enable Telegraf Deployment |
| `endpointIP` | string | `<ip>` | The endpoint IP of service loadbalancer |
| `endpointPort` | integer | `10093` | The endpoint Port of service loadbalancer |
| `extraPluginsForDaemonSet.aggregatorPlugins` | object |  |  |
| `extraPluginsForDaemonSet.inputPlugins` | object |  |  |
| `extraPluginsForDaemonSet.outputPlugins` | object |  | self defined output plugins for telegraf daemonset |
| `extraPluginsForDaemonSet.processorPlugins` | object |  |  |
| `extraPluginsForDeployment.aggregatorPlugins` | object |  |  |
| `extraPluginsForDeployment.inputPlugins` | object |  |  |
| `extraPluginsForDeployment.outputPlugins` | object |  |  |
| `extraPluginsForDeployment.processorPlugins` | object |  |  |
| `global_tags` | object |  | global tags(key:value pairs), applicable to telegraf daemonset and deployment |
| `inputPluginsForDaemonSet.etcd_healthz.enabled` | boolean | `true` | control to enable this plugin or not |
| `inputPluginsForDaemonSet.etcd_healthz.name_prefix` | string | `etcd_health_` |  |
| `inputPluginsForDaemonSet.etcd_metrics.enabled` | boolean | `true` | control to enable this plugin or not |
| `inputPluginsForDaemonSet.etcd_metrics.namedrop` | array |  | list of namedrop |
| `inputPluginsForDaemonSet.etcd_metrics.namepass` | array | `["etcd_server_has_leader","etcd_server_leader_changes_seen_total","etcd_server_proposals_committed_total","etcd_server_proposals_applied_total","etcd_server_proposals_pending","etcd_server_proposals_failed_total","etcd_disk_backend_commit_duration_seconds_sum","etcd_request_duration_seconds_count","etcd_request_duration_seconds_sum","etcd_request_duration_seconds_bucket","etcd_disk_backend_commit_duration_seconds_sum","etcd_disk_backend_commit_duration_seconds","etcd_disk_backend_commit_duration_seconds_count","etcd_mvcc_db_total_size_in_bytes","etcd_mvcc_db_total_size_in_use_in_bytes","etcd_network_peer_round_trip_time_seconds","etcd_disk_wal_fsync_duration_seconds","etcd_network_peer_received_failures_total","etcd_server_client_requests_total","etcd_server_is_leader","etcd_server_health_failures","etcd_server_heartbeat_send_failures_total","etcd_network_peer_sent_failures_total","etcd_server_quota_backend_bytes"]` | list of namepass |
| `inputPluginsForDaemonSet.hostCPU.enabled` | boolean | `true` | control to enable this plugin or not |
| `inputPluginsForDaemonSet.hostCPU.fieldexclude` | array |  | list of fieldexclude |
| `inputPluginsForDaemonSet.hostCPU.fieldinclude` | array | `["time_user","time_system","time_idle","time_active","time_iowait","time_irq","time_softirq","usage_user","usage_system","usage_active","usage_iowait","usage_irq","usage_softirq"]` | list of fieldinclude |
| `inputPluginsForDaemonSet.hostDisk.enabled` | boolean | `true` | control to enable this plugin or not |
| `inputPluginsForDaemonSet.hostDisk.fieldexclude` | array |  | list of fieldexclude |
| `inputPluginsForDaemonSet.hostDisk.fieldinclude` | array |  | list of fieldinclude |
| `inputPluginsForDaemonSet.hostDiskIO.enabled` | boolean | `true` | control to enable this plugin or not |
| `inputPluginsForDaemonSet.hostDiskIO.fieldexclude` | array |  | list of fieldexclude |
| `inputPluginsForDaemonSet.hostDiskIO.fieldinclude` | array | `["merged_reads","merged_writes"]` | list of fieldinclude |
| `inputPluginsForDaemonSet.hostMem.enabled` | boolean | `true` | control to enable this plugin or not |
| `inputPluginsForDaemonSet.hostMem.fieldexclude` | array | `[]` | list of fieldexclude |
| `inputPluginsForDaemonSet.hostMem.fieldinclude` | array | `["active","available","available_percent","buffered","cached","free","used","used_percent"]` | list of fieldinclude |
| `inputPluginsForDaemonSet.hostNet.enabled` | boolean | `true` | control to enable this plugin or not |
| `inputPluginsForDaemonSet.hostNet.fieldexclude` | array |  | list of fieldexclude |
| `inputPluginsForDaemonSet.hostNet.fieldinclude` | array |  | list of fieldinclude |
| `inputPluginsForDaemonSet.hostNetStat.enabled` | boolean | `true` | control to enable this plugin or not |
| `inputPluginsForDaemonSet.hostNetStat.fieldexclude` | array |  | list of fieldexclude |
| `inputPluginsForDaemonSet.hostNetStat.fieldinclude` | array |  | list of fieldinclude |
| `inputPluginsForDaemonSet.kube_apiserver_healthz.enabled` | boolean | `true` | control to enable this plugin or not |
| `inputPluginsForDaemonSet.kube_apiserver_healthz.name_prefix` | string | `apiserver_health_` |  |
| `inputPluginsForDaemonSet.kube_apiserver_metrics.enabled` | boolean | `true` | control to enable this plugin or not |
| `inputPluginsForDaemonSet.kube_apiserver_metrics.namedrop` | array |  | list of namedrop |
| `inputPluginsForDaemonSet.kube_apiserver_metrics.namepass` | array | `["apiserver_request_total","apiserver_current_inflight_requests","apiserver_current_inqueue_requests","apiserver_admission_webhook_admission_duration_seconds","go_goroutines","workqueue_adds_total","workqueue_depth","workqueue_queue_duration_seconds_bucket","apiserver_request_duration_seconds","apiserver_storage_objects","etcd_request_duration_seconds","apiserver_storage_size_bytes","workqueue_queue_duration_seconds"]` | list of namepass |
| `inputPluginsForDaemonSet.kube_controller_manager_healthz.enabled` | boolean | `true` | control to enable this plugin or not |
| `inputPluginsForDaemonSet.kube_controller_manager_healthz.name_prefix` | string | `controller_manager_health_` |  |
| `inputPluginsForDaemonSet.kube_controller_manager_metrics.enabled` | boolean | `true` | control to enable this plugin or not |
| `inputPluginsForDaemonSet.kube_controller_manager_metrics.namedrop` | array |  | list of namedrop |
| `inputPluginsForDaemonSet.kube_controller_manager_metrics.namepass` | array | `["workqueue_depth","workqueue_queue_duration_seconds_bucket","leader_election_master_status"]` | list of namepass |
| `inputPluginsForDaemonSet.kube_scheduler_healthz.enabled` | boolean | `true` | control to enable this plugin or not |
| `inputPluginsForDaemonSet.kube_scheduler_healthz.name_prefix` | string | `scheduler_health_` |  |
| `inputPluginsForDaemonSet.kube_scheduler_metrics.enabled` | boolean | `true` | control to enable this plugin or not |
| `inputPluginsForDaemonSet.kube_scheduler_metrics.namedrop` | array |  | list of namedrop |
| `inputPluginsForDaemonSet.kube_scheduler_metrics.namepass` | array | `["workqueue_depth","workqueue_adds_total","workqueue_queue_duration_seconds_bucket","scheduler_pending_pods","rest_client_requests_total","workqueue_queue_duration_seconds","leader_election_master_status","scheduler_queue_incoming_pods_total","scheduler_preemption_attempts_total","scheduler_preemption_victims","scheduler_schedule_attempts_total"]` | list of namepass |
| `inputPluginsForDaemonSet.kubelet_metrics.enabled` | boolean | `true` | control to enable this plugin or not |
| `inputPluginsForDaemonSet.kubelet_metrics.namedrop` | array |  | list of namedrop |
| `inputPluginsForDaemonSet.kubelet_metrics.namepass` | array | `["container_cpu_cfs_throttled_periods_total","container_network_receive_errors_total","container_memory_working_set_bytes","container_network_receive_packets_dropped_total","container_network_receive_packets_total","container_network_transmit_errors_total","container_network_transmit_packets_dropped_total","container_network_transmit_packets_total","container_fs_reads_total","container_fs_writes_total","container_fs_reads_bytes_total","container_fs_writes_bytes_total","container_cpu_cfs_periods_total","container_memory_failcnt","container_cpu_usage_seconds_total","kubelet_running_pods","kubelet_running_containers","kubernetes_node_cpu_usage_nanocores","kubernetes_node_memory_usage_bytes","kubernetes_pod_container_cpu_usage_core_nanoseconds","kubernetes_pod_container_cpu_usage_nanocores","kubernetes_pod_container_memory_rss_bytes","kubernetes_pod_container_memory_usage_bytes","kubernetes_pod_network_tx_errors","kubernetes_pod_network_tx_bytes","kubernetes_pod_volume_available_bytes","kubernetes_pod_volume_capacity_bytes","kubernetes_pod_volume_used_bytes"]` | list of namepass |
| `inputPluginsForDeployment.dcgm_exporter_metrics.dcgm_services` | array | `["http://nvidia-dcgm-exporter.gpu-operator.svc.cluster.local:9400/metrics"]` |  |
| `inputPluginsForDeployment.dcgm_exporter_metrics.enabled` | boolean | `false` |  |
| `inputPluginsForDeployment.dcgm_exporter_metrics.name_prefix` | string | `dcgm_metrics_` |  |
| `inputPluginsForDeployment.dcgm_exporter_metrics.namepass` | array | `["DCGM_FI_DEV_MEM_COPY_UTIL","DCGM_FI_DEV_GPU_UTIL","DCGM_FI_DEV_VGPU_MEMORY_USAGE"]` | list of namepass |
| `inputPluginsForDeployment.kube_state_metrics.enabled` | boolean | `true` |  |
| `inputPluginsForDeployment.kube_state_metrics.kubernetes_services` | array | `["http://prometheus-kube-state-metrics.tanzu-system-monitoring.svc.cluster.local:8080/metrics"]` |  |
| `inputPluginsForDeployment.kube_state_metrics.name_prefix` | string | `ksm_metrics_` |  |
| `inputPluginsForDeployment.kube_state_metrics.namepass` | array | `["kube_pod_container_resource_requests","kube_pod_container_resource_limits","kube_pod_container_state_started","kube_pod_container_info","kube_pod_owner","kube_pod_info","kube_pod_container_status_restarts_total","kube_pod_status_phase","kube_deployment_status_condition","kube_deployment_spec_replicas","kube_deployment_status_replicas_available","kube_persistentvolumeclaim_status_phase","kube_persistentvolume_csi_attributes","kube_persistentvolumeclaim_info","kube_persistentvolume_volume_mode","kube_storageclass_info","kube_persistentvolume_annotations","kube_persistentvolume_capacity_bytes","kube_persistentvolume_status_phase","kube_persistentvolume_claim_ref","kube_persistentvolume_labels","kube_persistentvolume_info","kube_persistentvolume_created","kube_persistentvolume_deletion_timestamp","kube_volumeattachment_spec_source_persistentvolume","kube_pod_spec_volumes_persistentvolumeclaims_info","kube_volumeattachment_info","kube_namespace_labels","kube_node_annotations","kube_persistentvolumeclaim_resource_requests_storage_bytes","kube_cronjob_info","kube_pod_container_status_running","kube_node_info","kube_node_status_capacity","kube_node_status_allocatable","kube_node_status_condition","kube_node_status_addresses","kube_node_role"]` | list of namepass |
| `inputPluginsForDeployment.node_exporter_metrics.enabled` | boolean | `true` |  |
| `inputPluginsForDeployment.node_exporter_metrics.kubernetes_services` | array | `["http://prometheus-node-exporter.tanzu-system-monitoring.svc.cluster.local:9100/metrics"]` |  |
| `inputPluginsForDeployment.node_exporter_metrics.name_prefix` | string | `ksm_metrics_` |  |
| `inputPluginsForDeployment.node_exporter_metrics.namepass` | array |  | list of namepass |
| `isMetricProxyConfigured` | boolean | `false` | control whether to enable proxyServer |
| `isObservabilityResourceCreated` | boolean | `false` | Whether to create observability related resources |
| `namespace` | string | `tanzu-system-telegraf` | The namespace in which to install telegraf |
| `nsLimitRange.defaultLimits.cpu` | string | `` | The default cpu limits. |
| `nsLimitRange.defaultLimits.memory` | string | `` | The default memory limits. |
| `nsLimitRange.defaultRequests.cpu` | string | `0m` | The default cpu requests. |
| `nsLimitRange.defaultRequests.memory` | string | `100Mi` | The default memory requests. |
| `outputPlugins.file.enabled` | boolean | `true` | control to enable this plugin or not |
| `outputPlugins.file.files` | array | `["stdout"]` | list of file |
| `outputPlugins.file.namepass` | array | `["error","fail"]` | list of namepass |
| `outputPlugins.proxyServer.ca` | string |  | ca of proxyserver, please paste the base64 of the raw data |
| `outputPlugins.proxyServer.clusterUUID` | string | `<cluster uuid>` | workloadclusterUUID |
| `outputPlugins.proxyServer.crt` | string |  | cert of proxyserver, please paste the base64 of the raw data |
| `outputPlugins.proxyServer.enabled` | boolean | `false` | control to enable this plugin or not |
| `outputPlugins.proxyServer.ip` | string | `<ip>` | ip address of service LB |
| `outputPlugins.proxyServer.key` | string |  | key of proxyserver, please paste the base64 of the raw data |
| `outputPlugins.proxyServer.port` | integer | `10093` | ip port of service LB |
| `outputPlugins.proxyServer.serviceDomain` | string | `managedcluster.local` | serviceDomain of proxyServer |
| `priorityClassName` | string | `` | The priorityClassName of telegraf deamonset and telegraf deployment. |
