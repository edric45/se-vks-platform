# vault-injector 1.7.4+vmware.1-vks.1

| Property | Type | Default | Description |
|---|---|---|---|
| `agentInjectCpuLimit` | string | `500m` | CPU limit for agent sidecar |
| `agentInjectCpuRequest` | string | `250m` | CPU request for agent sidecar |
| `agentInjectDefaultTemplate` | string | `map` | Default template type for secret injection |
| `agentInjectListen` | string | `:8080` | Agent inject listen address |
| `agentInjectLogFormat` | string | `standard` | Log format for agent injector |
| `agentInjectLogLevel` | string | `info` | Log level for agent injector |
| `agentInjectMemLimit` | string | `128Mi` | Memory limit for agent sidecar |
| `agentInjectMemRequest` | string | `64Mi` | Memory request for agent sidecar |
| `agentInjectTLSAuto` | string | `vault-agent-injector-cfg` | TLS auto configuration name |
| `agentInjectUseLeaderElector` | string | `true` | Enable leader election for agent injector |
| `agentInjectVaultAddr` | string | `` | Vault address for agent injection. If empty, will be auto-configured |
| `agentInjectVaultImage` | string | `` | Vault image for agent sidecar. If empty, will use default |
| `externalIP` | string | `` | External IP address for secret-store-service endpoints |
| `namespace` | string | `vks-vault-injector` | Namespace where Vault Injector will be deployed |
| `nsLimitRange.defaultLimits.cpu` | string | `500m` | Default CPU limit. Set to empty string to omit. |
| `nsLimitRange.defaultLimits.memory` | string | `128Mi` | Default memory limit. Set to empty string to omit. |
| `nsLimitRange.defaultRequests.cpu` | string | `250m` | Default CPU request |
| `nsLimitRange.defaultRequests.memory` | string | `64Mi` | Default memory request |
| `priorityClassName` | string | `` | Pod priority class for vault-injector pods. If empty, defaults to vmware-system-important on Kubernetes >= 1.34, otherwise no priority class is set. |
| `replicas` | integer | `1` | Number of replicas for vault-injector deployment |
| `resources.limits.cpu` | string | `500m` | CPU limit for vault-injector containers |
| `resources.limits.memory` | string | `128Mi` | Memory limit for vault-injector containers |
| `resources.requests.cpu` | string | `250m` | CPU request for vault-injector containers |
| `resources.requests.memory` | string | `64Mi` | Memory request for vault-injector containers |
