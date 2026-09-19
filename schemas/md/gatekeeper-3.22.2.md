# gatekeeper 3.22.2+vmware.1-vks.1

| Property | Type | Default | Description |
|---|---|---|---|
| `audit.priorityClassName` | string |  | PriorityClass name for Gatekeeper audit Pods. When unset, the upstream Gatekeeper chart default applies (system-cluster-critical). To use a different class, create the PriorityClass on the cluster first.  |
| `audit.resources.limits.cpu` | string |  | CPU limit (e.g., "500m", "1") |
| `audit.resources.limits.memory` | string | `512Mi` | Memory limit (e.g., "1Gi", "2Gi") |
| `audit.resources.requests.cpu` | string | `100m` | CPU request (e.g., "100m", "500m") |
| `audit.resources.requests.memory` | string | `512Mi` | Memory request (e.g., "512Mi", "1Gi") |
| `auditChunkSize` | integer | `500` | Maximum number of results to return per audit page |
| `auditFromCache` | boolean | `false` | Enable auditing from OPA cache for improved performance. When true, audit runs evaluate cached data instead of making fresh API calls. Improves audit performance in large clusters but may miss recent resource changes.  |
| `auditInterval` | integer | `60` | Interval between audit runs (in seconds) |
| `constraintViolationsLimit` | integer | `20` | Limit number of reported violations per constraint |
| `controllerManager.priorityClassName` | string |  | PriorityClass name for Gatekeeper controller-manager Pods (pod spec priorityClassName). When unset, the upstream Gatekeeper chart default applies (system-cluster-critical). To use a different class, create the PriorityClass on the cluster first.  |
| `controllerManager.resources.limits.cpu` | string |  | CPU limit (e.g., "1000m", "2") |
| `controllerManager.resources.limits.memory` | string | `512Mi` | Memory limit (e.g., "1Gi", "2Gi") |
| `controllerManager.resources.requests.cpu` | string | `100m` | CPU request (e.g., "200m", "1") |
| `controllerManager.resources.requests.memory` | string | `512Mi` | Memory request (e.g., "512Mi", "1Gi") |
| `disableMutation` | boolean | `false` | Disable mutating admission webhook functionality. When true, Gatekeeper will only perform validation (deny/allow) and skip any mutation policies. Useful for environments that only need policy enforcement without modification.  |
| `enableDeleteOperations` | boolean | `false` | Enable policy evaluation for DELETE operations. When true, policies can evaluate and potentially block resource deletion attempts. Useful for preventing deletion of critical resources or enforcing cleanup policies.  |
| `enableExternalData` | boolean | `true` | Enable External Data Provider support for policies to query external APIs during admission control. Required for advanced enterprise integrations with identity systems, vulnerability scanners, and compliance databases.  |
| `enableK8sNativeValidation` | boolean | `true` | Enable Kubernetes native ValidatingAdmissionPolicy integration. When true, compatible policies are automatically converted to native K8s validation for improved performance. Complex policies fall back to webhook evaluation. Requires Kubernetes 1.30+ for full functionality.  |
| `enableRuntimeDefaultSeccompProfile` | boolean | `true` | Enable RuntimeDefault seccomp profile for enhanced container security. Restricts system calls that containers can make, reducing attack surface and improving security posture. Required for SRP compliance.  |
| `externaldataProviderResponseCacheTTL` | string | `3m` | Cache duration for external data provider responses (e.g., "3m", "30s", "1h"). Higher values improve performance but may result in stale data. Must be a valid duration string with units (s=seconds, m=minutes, h=hours).  |
| `logLevel` | string | `INFO` | Log level for the Gatekeeper controller and audit pods |
| `mutatingWebhookTimeoutSeconds` | integer | `1` | Timeout in seconds for mutating admission webhook calls. Should be lower than validating webhook timeout for faster mutation processing.  |
| `nsLimitRange.defaultLimits.cpu` | string |  | Default CPU limits |
| `nsLimitRange.defaultLimits.memory` | string | `` | Default Memory limits |
| `nsLimitRange.defaultRequests.cpu` | string | `200m` | Default CPU requests |
| `nsLimitRange.defaultRequests.memory` | string | `512Mi` | Default Memory requests |
| `nsResourceQuota.enabled` | boolean | `false` | Enable ResourceQuota for the namespace |
| `nsResourceQuota.quotas.limits.cpu` | string |  | Total CPU limits limit (e.g., "8000m" for 8 CPUs) |
| `nsResourceQuota.quotas.limits.memory` | string |  | Total memory limits limit (e.g., "16Gi") |
| `nsResourceQuota.quotas.objects.persistentvolumeclaims` | string | `` | Maximum number of PVCs (e.g., "10") |
| `nsResourceQuota.quotas.objects.pods` | string | `` | Maximum number of pods (e.g., "50") |
| `nsResourceQuota.quotas.requests.cpu` | string |  | Total CPU requests limit (e.g., "4000m" for 4 CPUs) |
| `nsResourceQuota.quotas.requests.memory` | string |  | Total memory requests limit (e.g., "8Gi") |
| `registry_secret_names` | array | `["gatekeeper-reg-creds"]` | Names of Secrets in gatekeeper-system used as imagePullSecrets for pulling Gatekeeper images. When installed via the VKS AddonConfig framework, customizing this list automatically wires the new name(s) into every pod and Job spec. When installed via direct `vcf package install --values-file ...`, only the default name (`gatekeeper-reg-creds`) is wired through values/use-tag-values.yaml; using a custom name in this path additionally requires setting `image.pullSecrets` and the four hook-specific pullSecrets paths (`postInstall.labelNamespace.image.pullSecrets`, `postInstall.probeWebhook.image.pullSecrets`, `postUpgrade.labelNamespace.image.pullSecrets`, `preUninstall.deleteWebhookConfigurations.image.pullSecrets`) to match. Most customers should leave this at the default and instead populate the `gatekeeper-reg-creds` Secret on the cluster.  |
| `replicas` | integer | `3` | Number of controller manager replicas |
| `validatingWebhookTimeoutSeconds` | integer | `3` | Timeout in seconds for validating admission webhook calls. Higher values allow complex policies more time to evaluate but may impact cluster responsiveness.  |
