# headlamp 0.42.0+vmware.1-vks.1

| Property | Type | Default | Description |
|---|---|---|---|
| `config.extraArgs` | array | `[]` |  |
| `config.pluginsDir` | string | `/headlamp-plugins` |  |
| `config.watchPlugins` | boolean | `false` |  |
| `createNamespace` | boolean | `true` | Whether to create the namespace as part of the install. |
| `gatewayApi.enabled` | boolean | `false` |  |
| `gatewayApi.gateway.className` | string | `istio` |  |
| `gatewayApi.gateway.create` | boolean | `true` |  |
| `gatewayApi.gateway.name` | string | `headlamp-gateway` |  |
| `hostname` | string | `headlamp.vks.example.com` | Global hostname used for Gateway routing and Certificate SANs. |
| `image.pullPolicy` | string | `IfNotPresent` | imagePullPolicy for the headlamp container. |
| `image.repository` | string | `` | Image repository (defaults to the bundled image). |
| `image.tag` | string | `` | Image tag (defaults to the bundled image). |
| `installedAddons` | array | `[]` | List of addons to install from the image's /plugins directory. |
| `logo.altText` | string | `` |  |
| `logo.url` | string | `` | URL to a SVG/PNG logo, or a data URI. |
| `namespace` | string | `headlamp` | Namespace where headlamp will be deployed. |
| `nodeSelector` | object | `{"kubernetes.io/os":"linux"}` |  |
| `nsLimitRange.defaultLimits.cpu` | string | `` |  |
| `nsLimitRange.defaultLimits.memory` | string | `` |  |
| `nsLimitRange.defaultRequests.cpu` | string | `100m` |  |
| `nsLimitRange.defaultRequests.memory` | string | `128Mi` |  |
| `oidc.callbackURL` | string | `` | Explicit OIDC redirect/callback URL. Required when Headlamp is behind a reverse proxy or Gateway API route. |
| `oidc.clientID` | string | `` | OIDC client ID. |
| `oidc.clientSecret` | string | `` | OIDC client secret. Stored in a K8s Secret (secret.name) when secret.create=true. |
| `oidc.enabled` | boolean | `false` |  |
| `oidc.externalSecret.enabled` | boolean | `false` | When true, use the Secret named externalSecret.name instead of creating one. |
| `oidc.externalSecret.name` | string | `` | Name of the pre-existing Secret. Must contain keys clientID, clientSecret, issuerURL, scopes. |
| `oidc.issuerURL` | string | `` | OIDC issuer URL (e.g. https://accounts.google.com). |
| `oidc.scopes` | array | `["openid","email","profile"]` | OIDC scopes requested during authentication. |
| `oidc.secret.create` | boolean | `true` | Create a Secret from the provided clientID/clientSecret/issuerURL/scopes values. |
| `oidc.secret.name` | string | `headlamp-oidc` | Name of the Secret to create or reference. |
| `oidc.useCookie` | boolean | `false` | Enable OIDC cookie for authentication outside of the cluster. |
| `oidc.usePKCE` | boolean | `false` | Enable PKCE (Proof Key for Code Exchange) for enhanced security in the OIDC flow. |
| `pluginsManager.configContent` | string | `` | Content for the plugin.yml inside the ConfigMap. |
| `pluginsManager.enabled` | boolean | `false` |  |
| `pluginsManager.version` | string | `latest` |  |
| `priorityClassName` | string | `` | Pod priority class. When empty, defaults to vmware-system-observability on Kubernetes >= 1.34.0 (auto-detected on VKS). |
| `replicaCount` | integer | `1` | Number of headlamp-server replicas. |
| `resources.limits.cpu` | string | `500m` |  |
| `resources.limits.memory` | string | `256Mi` |  |
| `resources.requests.cpu` | string | `100m` |  |
| `resources.requests.memory` | string | `128Mi` |  |
| `service.annotations` | object |  |  |
| `service.port` | integer | `443` |  |
| `service.targetPort` | integer | `443` |  |
| `service.type` | string | `LoadBalancer` |  |
| `tls.certManager.certificate.commonName` | string | `Headlamp CA` |  |
| `tls.certManager.certificate.duration` | string | `87600h` |  |
| `tls.certManager.certificate.isCA` | boolean | `true` |  |
| `tls.certManager.certificate.privateKey.algorithm` | string | `RSA` |  |
| `tls.certManager.certificate.privateKey.encoding` | string | `PKCS1` |  |
| `tls.certManager.certificate.privateKey.size` | integer | `2048` |  |
| `tls.certManager.certificate.renewBefore` | string | `360h` |  |
| `tls.certManager.enabled` | boolean | `true` |  |
| `tls.certManager.ipAddresses` | array |  |  |
| `tls.certManager.issuer.create` | boolean | `true` |  |
| `tls.certManager.issuer.kind` | string | `Issuer` |  |
| `tls.certManager.issuer.name` | string | `headlamp-issuer` |  |
| `tls.certManager.secretName` | string | `headlamp-tls-cert` |  |
| `tls.existingSecret` | string | `` |  |
| `tolerations` | array | `[]` |  |
