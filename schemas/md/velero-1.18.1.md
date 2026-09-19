# velero 1.18.1+vmware.1-vks.1

| Property | Type | Default | Description |
|---|---|---|---|
| `annotations` | object | `{}` | Annotations added to the Velero and node-agent pods |
| `backupRepository.config.cacheLimitMB` | integer | `5000` | Size of local cache |
| `backupRepository.config.fullMaintenanceInterval` | string | `normalGC` | Interval for full maintenance |
| `backupRepository.defaultMaintenanceFrequency` | string | `1h` | Default maintenance frequency for backup repositories |
| `backupRepository.maintenanceJobConfig.globalConfig.loadAffinity` | array | `[]` | Global maintenance job load affinity |
| `backupRepository.maintenanceJobConfig.globalConfig.podResources.cpuLimit` | string | `0` |  |
| `backupRepository.maintenanceJobConfig.globalConfig.podResources.cpuRequest` | string | `0` |  |
| `backupRepository.maintenanceJobConfig.globalConfig.podResources.ephemeralStorageLimit` | string | `0` |  |
| `backupRepository.maintenanceJobConfig.globalConfig.podResources.ephemeralStorageRequest` | string | `0` |  |
| `backupRepository.maintenanceJobConfig.globalConfig.podResources.memoryLimit` | string | `0` |  |
| `backupRepository.maintenanceJobConfig.globalConfig.podResources.memoryRequest` | string | `0` |  |
| `backupRepository.maintenanceJobConfig.globalConfig.priorityClassName` | string | `` | The PriorityClass's name used for maintenance Job's pods. |
| `backupRepository.maintenanceJobConfig.perBackupRepository` | array |  |  |
| `backupStorageLocation.bucket` | string | `` | Name of the storage bucket where backups should be stored |
| `backupStorageLocation.caCert` | string | `` | Content of the certificate used when verifying TLS connections to the storage |
| `backupStorageLocation.caCertRef.key` | string | `` | The key of the secret to select from.  Must be a valid secret key |
| `backupStorageLocation.caCertRef.name` | string | `` | The name of the secret in the pod's namespace to select from. |
| `backupStorageLocation.config` | object | `{"region":"minio","s3ForcePathStyle":"true","s3Url":"http://127.0.0.1:9000"}` | Provider-specific configuration fields. Refer to https://github.com/vmware-tanzu/velero-plugin-for-aws/blob/main/backupstoragelocation.md for AWS S3 and S3-compatible storage |
| `backupStorageLocation.credential` | string | `` | Content of the credentials for backup storage |
| `backupStorageLocation.prefix` | string | `` | Prefix under which all Velero data should be stored within the bucket |
| `backupStorageLocation.provider` | string | `aws` | Provider name for backup storage |
| `features` | array | `["EnableCSI"]` | Feature flags |
| `labels` | object | `{}` | Labels added to the Velero and node-agent pods |
| `logLevel` | string | `info` | Log level |
| `namespace` | string | `velero` | Namespace where Velero is deployed |
| `nodeAgent.config.backupPVC` | array | `[]` | Config for backupPVC (intermediate PVC) of snapshot data movement |
| `nodeAgent.config.cachePVC.residentThresholdInMB` | string | `` |  |
| `nodeAgent.config.cachePVC.storageClass` | string | `` |  |
| `nodeAgent.config.loadAffinity` | array | `[]` | Data path load affinity |
| `nodeAgent.config.loadConcurrency.globalConfig` | integer | `1` | Global data path load concurrency |
| `nodeAgent.config.loadConcurrency.perNodeConfig` | array | `[]` | Data path load concurrency per node |
| `nodeAgent.config.podAnnotations` | object | `{}` |  |
| `nodeAgent.config.podLabels` | object | `{}` |  |
| `nodeAgent.config.podResources.cpuLimit` | string | `0` |  |
| `nodeAgent.config.podResources.cpuRequest` | string | `0` |  |
| `nodeAgent.config.podResources.ephemeralStorageLimit` | string | `0` |  |
| `nodeAgent.config.podResources.ephemeralStorageRequest` | string | `0` |  |
| `nodeAgent.config.podResources.memoryLimit` | string | `0` |  |
| `nodeAgent.config.podResources.memoryRequest` | string | `0` |  |
| `nodeAgent.config.priorityClassName` | string | `` | The PriorityClass's name used for the data mover pods. |
| `nodeAgent.config.privilegedFsBackup` | boolean | `false` |  |
| `nodeAgent.config.restorePVC.ignoreDelayBinding` | boolean | `false` |  |
| `nodeAgent.dataMoverPrepareTimeout` | string | `30m` | How long to wait for preparing a DataUpload/DataDownload |
| `nodeAgent.enableOnLinux` | boolean | `true` | Enable node-agent on Linux nodes |
| `nodeAgent.enableOnWindows` | boolean | `false` | Enable node-agent on Windows nodes |
| `nodeAgent.kubeletRootDir` | string | `/var/lib/kubelet` | kubelet mount path for nodes where running node-agent |
| `nodeAgent.nodeAgentDisableHostPath` | boolean | `false` | Determines whether to disable hostPath volumes for node-agent |
| `nodeAgent.privileged` | boolean | `false` | Use privileged mode for node-agent. Required to backup block devices |
| `nodeAgent.resources.cpuLimit` | string | `0` |  |
| `nodeAgent.resources.cpuRequest` | string | `0` |  |
| `nodeAgent.resources.memoryLimit` | string | `0` |  |
| `nodeAgent.resources.memoryRequest` | string | `0` |  |
| `nsLimitRange.defaultLimits.cpu` | string | `` | The default cpu limits |
| `nsLimitRange.defaultLimits.memory` | string | `` | The default memory limits |
| `nsLimitRange.defaultRequests.cpu` | string | `250m` | The default cpu requests |
| `nsLimitRange.defaultRequests.memory` | string | `128Mi` | The default memory requests |
| `priorityClassName` | string | `` | The PriorityClass's name used for Velero Deployment and node-agent DaemonSet pods. |
| `serviceAccount.annotations` | object | `{}` | Annotations added to the auto-created ServiceAccount |
| `serviceAccount.name` | string | `` | ServiceAccount set to the Velero and node-agent pods, users should create the ServiceAccount and the RoleBinding/ClusterRoleBinding before the installation. A default ServiceAccount/ClusterRoleBinding will be created automatically if leave the property empty. |
| `velero.disableInformerCache` | boolean | `false` | Disable informer cache for Get calls on restore. With this enabled, it will speed up restore in cases where there are backup resources which already exist in the cluster, but for very large clusters this will increase velero memory usage. |
| `velero.garbageCollectionFrequency` | string | `1h` | How often the garbage collection runs for expired backups |
| `velero.itemBlockWorkerCount` | integer | `1` | Number of worker threads to process ItemBlocks |
| `velero.plugins` | array | `[]` | Plugin container images to install into the Velero Deployment. The AWS plugin is included by default, no need to specify it here |
| `velero.podVolumeOperationTimeout` | string | `4h` | How long to wait for pod volume operations to complete before timing out |
| `velero.resources.cpuLimit` | string | `1000m` |  |
| `velero.resources.cpuRequest` | string | `500m` |  |
| `velero.resources.memoryLimit` | string | `512Mi` |  |
| `velero.resources.memoryRequest` | string | `128Mi` |  |
| `velero.restoreResourcePriorities` | string | `` | Desired order of resource restores, the priority list contains two parts which are split by "-" element. The resources before "-" element are restored first as high priorities, the resources after "-" element are restored last as low priorities, and any resource not in the list will be restored alphabetically between the high and low priorities. |
