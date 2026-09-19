# metrics-server 0.8.1+vmware.3-fips-tkg.1

| Property | Type | Default | Description |
|---|---|---|---|
| `daemonset.updateStrategy` | string |  | Update strategy of daemonsets |
| `deployment.rollingUpdate.maxSurge` | integer |  | The maxSurge of rollingUpdate. Applied only if RollingUpdate is used as updateStrategy |
| `deployment.rollingUpdate.maxUnavailable` | integer |  | The maxUnavailable of rollingUpdate. Applied only if RollingUpdate is used as updateStrategy |
| `deployment.updateStrategy` | string |  | Update strategy of deployments |
| `metricsServer.config.apiServiceInsecureTLS` | boolean | `true` | Whether to enable insecure TLS for metrics-server api service |
| `metricsServer.config.args` | array | `[]` | Arguments passed into metrics-server container |
| `metricsServer.config.probe.failureThreshold` | integer | `3` | Probe failureThreshold of metrics-server deployment |
| `metricsServer.config.probe.periodSeconds` | integer | `10` | Probe period of metrics-server deployment |
| `metricsServer.config.securePort` | integer | `4443` | The HTTPS secure port used by metrics-server |
| `metricsServer.config.tolerations` | ? | `[]` | Metrics-server deployment tolerations |
| `metricsServer.config.updateStrategy` | string | `RollingUpdate` | The update strategy of the metrics-server deployment |
| `metricsServer.createNamespace` | boolean | `false` | Whether to create namespace specified for metrics-server |
| `metricsServer.image.name` | string | `` | The path of image |
| `metricsServer.image.pullPolicy` | string | `IfNotPresent` | The pull policy of image |
| `metricsServer.image.repository` | string | `` | The repository of metrics-server image |
| `metricsServer.image.tag` | string | `` | The image tag |
| `metricsServer.namespace` | string |  | The namespace value used by older templates, will be overwriten if top level namespace is present, kept for backward compatibility |
| `namespace` | string | `kube-system` | The namespace in which metrics-server is deployed |
| `nodeSelector` | ? |  | NodeSelector configuration applied to all the deployments |
