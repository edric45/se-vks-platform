# external-dns 0.21.0+vmware.1-vks.1

| Property | Type | Default | Description |
|---|---|---|---|
| `aws.credentials.accessKey` | string | `` | AWS access key. When provided along with the aws.secretKey, a Secret will be created and referenced in the external-dns Deployment. |
| `aws.credentials.secretKey` | string | `` | AWS secret key. When provided along with the aws.accessKey, a Secret will be created and referenced in the external-dns Deployment. |
| `azure.aadClientId` | string |  | AAD Client ID |
| `azure.aadClientSecret` | string |  | AAD Client Secret |
| `azure.cloud` | string |  | Cloud |
| `azure.resourceGroup` | string | `` | Resource Group |
| `azure.subscriptionId` | string | `` | Subscription ID |
| `azure.tenantId` | string | `` | Tenant ID |
| `azure.useManagedIdentityExtension` | boolean | `true` | Use manaaged identity extension |
| `azure.userAssignedIdentityID` | string |  | User Assigned Identity ID |
| `deployment.args` | array | `["--source=service","--txt-owner-id=k8s","--registry=txt","--domain-filter=k8s.example.org","--provider=rfc2136","--rfc2136-host=<RFC2136_Support_BIND_DNS_SERVER_IP>","--rfc2136-port=53","--rfc2136-zone=k8s.example.org","--rfc2136-tsig-secret=MTlQs3NNU=","--rfc2136-tsig-secret-alg=hmac-sha256","--rfc2136-tsig-keyname=externaldns-key","--rfc2136-tsig-axfr"]` | List of arguments passed via command-line to external-dns.  For more guidance on configuration options for your desired DNS provider, consult the ExternalDNS docs at https://github.com/kubernetes-sigs/external-dns#running-externaldns. |
| `deployment.env` | array |  | List of environment variables to set in the external-dns container. |
| `deployment.podLabels` | object |  | Labels to be added to all deployment pods |
| `deployment.resources.limits.cpu` | string | `` | Default CPU limits |
| `deployment.resources.limits.memory` | string | `` | Default Memory limits |
| `deployment.resources.requests.cpu` | string | `100m` | Default CPU requests |
| `deployment.resources.requests.memory` | string | `128Mi` | Default Memory requests |
| `deployment.securityContext` | object |  | SecurityContext defines the security options the external-dns container should be run with. More info: https://kubernetes.io/docs/tasks/configure-pod-container/security-context/ |
| `deployment.volumeMounts` | array |  | Pod volumes to mount into the external-dns container's filesystem. |
| `deployment.volumes` | array |  | List of volumes that can be mounted by containers belonging to the external-dns pod. More info: https://kubernetes.io/docs/concepts/storage/volumes |
| `namespace` | string | `tanzu-system-service-discovery` | The namespace in which to deploy ExternalDNS |
| `nsLimitRange.defaultLimits.cpu` | string | `` | Default CPU limits |
| `nsLimitRange.defaultLimits.memory` | string | `` | Default Memory limits |
| `nsLimitRange.defaultRequests.cpu` | string | `100m` | Default CPU requests |
| `nsLimitRange.defaultRequests.memory` | string | `128Mi` | Default Memory requests |
| `priorityClassName` | string | `` | The user defined priorityClass name of deployment pod |
| `serviceaccount.annotations` | object |  | Annotations that can be set on the external-dns service account. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/annotations/ |
| `tlsConfig.ca_crt` | string | `` | User input ca.crt to validate the DNS server connection, base64 code string required |
| `tlsConfig.tls_enable` | boolean | `false` | TLS enablement feature gate |
