# secretgen-controller 0.21.1+vmware.4-fips-tkg.1

| Property | Type | Default | Description |
|---|---|---|---|
| `create_namespace` | boolean | `true` | Whether to create namespace specified for secretgen-controller |
| `deployment.nodeSelector` | ? |  | NodeSelector configuration applied to all the deployments |
| `deployment.rollingUpdate.maxSurge` | integer | `0` | The maxSurge of rollingUpdate. Applied only if RollingUpdate is used as updateStrategy |
| `deployment.rollingUpdate.maxUnavailable` | integer | `1` | The maxUnavailable of rollingUpdate. Applied only if RollingUpdate is used as updateStrategy |
| `deployment.updateStrategy` | string | `` | Update strategy of deployments, empty uses default strategy |
| `namespace` | string | `secretgen-controller` | The namespace in which to deploy secretgen-controller |
