# cluster-autoscaler 1.36.0+vmware.1-vks.1

| Property | Type | Default | Description |
|---|---|---|---|
| `arguments.enforceNodeGroupMinSize` | boolean | `true` | Should ClusterAutoscaler scale up the node group to the configured min size if needed. |
| `arguments.extraArguments` | array |  | Other Cluster Autoscaler container arguments |
| `arguments.ignoreDaemonsetsUtilization` | boolean | `true` | Whether DaemonSet pods will be ignored when calculating resource utilization for scaling down. |
| `arguments.logLevel` | integer | `5` | Autoscaler pod log level |
| `arguments.maxNodeProvisionTime` | string | `15m` | Maximum amount of time Cluster Autoscaler waits for a node to be provisioned. |
| `arguments.maxNodesTotal` | integer | `0` | Maximum total number of nodes in the cluster, worker plus control plane. |
| `arguments.metricsPort` | integer | `8085` | metrics and liveness probe endpoints port |
| `arguments.scaleDownDelayAfterAdd` | string | `10m` | Amount of time that Cluster Autoscaler waits after a scale-up operation and then resumes scale-down scans. |
| `arguments.scaleDownDelayAfterDelete` | string | `10s` | Amount of time that Cluster Autoscaler waits after deleting a node and then resumes scale-down scans |
| `arguments.scaleDownDelayAfterFailure` | string | `3m` | Amount of time that Cluster Autoscaler waits after a scale-down failure and then resumes scale-down scans. |
| `arguments.scaleDownUnneededTime` | string | `10m` | Amount of time that Cluster Autoscaler must wait before scaling down an eligible node. |
| `arguments.startupTaint` | string | `node.cluster.x-k8s.io/uninitialized` | Specifies a taint to ignore in node templates when considering to scale a node group |
| `clusterConfig.clusterName` | string | `` | Workload cluster name |
| `clusterConfig.clusterNamespace` | string | `` | Management namespace where the workload cluster is hosted |
| `paused` | boolean | `false` | To pause the cluster autoscaler which will scale the replicas to 0 or 1 |
| `priorityClassName` | string | `` | PriorityClass name for autoscaler pod |
| `resources.requests.cpu` | string | `25m` | measured in cores or millicores, e.g., 500m = 0.5 core |
| `resources.requests.memory` | string | `50Mi` | measured in bytes, e.g., 256Mi, 1Gi |
| `vksAddonManagement` | boolean | `false` | To use the new mgmt secret name with cluster name prefix |
