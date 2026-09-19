# windows-gmsa-webhook 0.13.0+vmware.7-vks.1

| Property | Type | Default | Description |
|---|---|---|---|
| `affinity.nodeAffinity.preferredDuringSchedulingIgnoredDuringExecution` | array |  |  |
| `burst` | integer | `50` | Burst value |
| `certificates.caBundle` | string | `` | If cert-manager integration is disabled, add self-signed ca.crt in base64 format |
| `certificates.certManager.domainName` | string | `cluster.local` | The domain name of the cluster |
| `certificates.certManager.enabled` | boolean | `true` | Enable cert manager integration. Cert manager should be already installed at the k8s cluster |
| `certificates.certReload.enabled` | boolean | `false` | Enable cert reload when the certs change |
| `certificates.secretName` | string | `gmsa-server-cert` | If cert-manager integration is disabled, upload certs data (ca.crt, tls.crt and tls.key) as k8s secretName in the namespace |
| `credential.domainJoinConfig.dnsName` | string | `` | DNS Domain Name |
| `credential.domainJoinConfig.dnsTreeName` | string | `` | DNS Domain Name Root |
| `credential.domainJoinConfig.guid` | string | `` | GUID of Domain |
| `credential.domainJoinConfig.machineAccountName` | string | `` | Username of the GMSA account |
| `credential.domainJoinConfig.netBiosName` | string | `` | NETBIOS Domain Name |
| `credential.domainJoinConfig.sid` | string | `` | SID of Domain |
| `credential.hostAccountConfig.pluginGUID` | string | `` | CCG Plugin GUID |
| `credential.hostAccountConfig.pluginInput` | string | `` | Format of this field is dependent upon specific CCG Plugin |
| `credential.hostAccountConfig.portableCcgVersion` | string | `1` | This needs to equal the current version of CCG which right now is '1' |
| `namespace` | string | `windows-gmsa-webhook` | The namespace where the windows-gmsa-webhook is deployed |
| `nodeSelector` | object | `{}` | The selector for the pod to fit on a node |
| `nsLimitRange.defaultLimits.cpu` | string | `` | The default cpu limits |
| `nsLimitRange.defaultLimits.memory` | string | `` | The default memory limits |
| `nsLimitRange.defaultRequests.cpu` | string | `300m` | The default cpu requests |
| `nsLimitRange.defaultRequests.memory` | string | `256Mi` | The default memory requests |
| `podDisruptionBudget.maxUnavailable` | integer | `1` | The maximum number of unavailable webhook pod. Only works when minAvailable is not set |
| `podDisruptionBudget.minAvailable` | integer | `1` | The minimum number of available webhook pod |
| `priorityClassName` | string | `` | The name of PriorityClass |
| `qps` | number | `30` | QPS value |
| `randomHostname` | boolean | `false` | Whether generate a random hostname for pod if it is empty |
| `replicaCount` | integer | `2` | The replica count of webhook pod |
| `resourceQuota.limits.cpu` | string | `` | The cpu limits |
| `resourceQuota.limits.memory` | string | `` | The memory limits |
| `resourceQuota.requests.cpu` | string | `1000m` | The cpu requests |
| `resourceQuota.requests.memory` | string | `1024Mi` | The memory requests |
| `resources.limits.cpu` | string | `` | The maximum amount of CPU resource allowed for windows-gmsa-webhook container |
| `resources.limits.memory` | string | `` | The maximum amount of memory resource allowed for windows-gmsa-webhook container |
| `resources.requests.cpu` | string | `300m` | The minimum amount of CPU resource required for windows-gmsa-webhook container |
| `resources.requests.memory` | string | `256Mi` | The minimum amount of memory resource required for windows-gmsa-webhook container |
| `tolerations` | object | `[{"effect":"NoSchedule","key":"node-role.kubernetes.io/master"},{"effect":"NoSchedule","key":"node-role.kubernetes.io/control-plane"}]` | The taint pod must tolerate |
