# kapp-controller 0.60.4+vmware.3-fips-tkg.1

| Property | Type | Default | Description |
|---|---|---|---|
| `apiPort` | integer | `8443` | API port |
| `concurrency` | integer | `4` | Concurrency of kapp-controller deployment |
| `config.appDefaultSyncPeriod` | string | `` | Time duration value used as a default for App CR's spec.syncPeriod. Minimum is 30s. |
| `config.appMinimumSyncPeriod` | string | `` | Time duration value to force a minimum for App CR's spec.syncPeriod. Minimum is 30s. |
| `config.caCerts` | string | `` | A cert chain of trusted ca certs. These will be added to the system-wide cert pool of trusted ca's. Default is empty |
| `config.dangerousSkipTLSVerify` | string | `` | A comma delimited list of hostnames for which kapp controller should skip TLS verification. Default is empty |
| `config.httpProxy` | string | `` | The url/ip of a proxy for kapp controller to use when making network requests. Default is empty |
| `config.httpsProxy` | string | `` | The url/ip of a tls capable proxy for kapp controller to use when making network requests. Default is empty |
| `config.kappDeployRawOptions` | string | `` | JSON encoded array of kapp deploy rawOptions that are applied to all App CRs. |
| `config.noProxy` | string | `` | A comma delimited list of domain names which kapp controller should bypass the proxy for when making requests. Default is empty |
| `coreDNSIP` | string | `` | The coreDNSIP will be injected into /etc/resolv.conf of kapp-controller pod |
| `createNamespace` | boolean | `true` | Whether to create namespace specified for kapp-controller |
| `createPackagingNamespace` | boolean | `true` | Whether to create the global packaging namespace for kapp-controller |
| `daemonset.updateStrategy` | string | `` | Update strategy of daemonset, empty uses default strategy |
| `dangerousEnablePprof` | boolean | `false` | Whether to enable pprofiling for kapp-controller |
| `deployment.rollingUpdate.maxSurge` | integer | `0` | The maxSurge of rollingUpdate. Applied only if RollingUpdate is used as updateStrategy |
| `deployment.rollingUpdate.maxUnavailable` | integer | `1` | The maxUnavailable of rollingUpdate. Applied only if RollingUpdate is used as updateStrategy |
| `deployment.updateStrategy` | string | `` | Update strategy of deployments, empty uses default strategy |
| `enableApiPriorityAndFairness` | boolean | `true` | Whether to enable api priority and fairness |
| `hostNetwork` | boolean | `false` | HostNetwork of kapp-controller deployment. |
| `metricsBindAddress` | string | `` | Address for metrics server. |
| `metricsPort` | integer | `8080` | Metrics port |
| `namespace` | string | `kapp-controller` | The namespace in which to deploy kapp-controller |
| `nodeSelector` | ? |  | NodeSelector configuration applied to all the deployments |
| `packagingGlobalNamespace` | string | `kapp-controller-packaging-global` | The global packaging namespace for kapp-controller |
| `priorityClassName` | string | `` | PriorityClassName of kapp-controller deployment. |
| `tlsCipherSuites` | string | `` | Comma separated list of cipher suites - empty for language defaults |
| `tolerations` | array | `[]` | Toleration of kapp-controller deployment. |
