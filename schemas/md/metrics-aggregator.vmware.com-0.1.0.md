# metrics-aggregator.vmware.com 0.1.0

| Property | Type | Default | Description |
|---|---|---|---|
| `cpuRequests` | string | `50m` |  |
| `memoryRequests` | string | `64Mi` |  |
| `metricsHTTPRemoteEndpoint.host` | string | `` | Remote endpoint Hostname or IP address |
| `metricsHTTPRemoteEndpoint.port` | integer | `443` | Remote endpoint port |
| `metricsHTTPRemoteEndpoint.tlsClientSecretName` | string | `` | Name of the secret which contains the TLS configuration required to push metrics to remote endpoint. |
| `metricsHTTPRemoteEndpoint.tlsClientSecretNamespace` | string | `vmware-system-monitoring` | Namespace from which SecretImport needs to import the secret containing the TLS configuration required to push metrics to remote endpoint. |
| `mgmtProxyAdminPort` | integer | `10003` |  |
| `mgmtProxyPodPriority` | integer | `-1000000` |  |
| `namespace` | string | `metrics-aggregator` |  |
| `supervisorUUID` | String | `` |  |
| `vCenterUUID` | String | `` |  |
