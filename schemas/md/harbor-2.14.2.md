# harbor 2.14.2+vmware.2-vks.1

| Property | Type | Default | Description |
|---|---|---|---|
| `caBundleSecretName` | string |  | The custom ca bundle secret, the secret must contain key named "ca.crt", which will be injected into the trust store for core, jobservice, registry, trivy components |
| `cache.enabled` | boolean | `false` | Enable cache for Harbor. |
| `cache.expireHours` | integer | `24` | The expire hour of cache. |
| `concurrentRequestLimit.registry.enabled` | boolean | `false` | Enable the concurrent request limit for registry service (/v2/*) when it's true |
| `concurrentRequestLimit.registry.max` | integer | `500` | The max in flight requests to registry service (/v2/*) |
| `contourHttpProxy.idleTimeout` | string |  | Timeout for how long the proxy should wait while there is no activity during single request/response (for HTTP/1.1) or stream (for HTTP/2). |
| `contourHttpProxy.timeout` | string |  | Timeout for receiving a response from the server after processing a request from client. |
| `core.replicas` | integer | `1` | The replicas for the core component. |
| `core.secret` | string |  | Secret is used when core server communicates with other components. |
| `core.xsrfKey` | string |  | The XSRF key. Must be a string of 32 chars. |
| `createNetworkPolicy` | boolean | `false` | Create a networkpolicy in Harbor's namespace when it's true.  This is required to be true for Harbor Supervisor Service |
| `database.external.coreDatabase` | string | `registry` | The db name for external database |
| `database.external.host` | string | `` | The hostname for external database |
| `database.external.password` | string | `` | The password for external database |
| `database.external.port` | string | `5432` | The port for external database |
| `database.external.sslmode` | string | `disable` | sslmode for external database |
| `database.external.username` | string | `postgres` | The username for external database |
| `database.maxIdleConns` | integer |  | The initial value of maxIdleConns |
| `database.maxOpenConns` | integer |  | The initial value of maxOpenConns |
| `database.password` | string |  | The initial password of the internal postgres database. |
| `database.shmSizeLimit` | integer |  | The initial value of shmSizeLimit |
| `database.type` | string | `internal` | The type of postgres dabasbase, either internal as default , or external |
| `enableContourHttpProxy` | boolean | `true` | Use contour http proxy to expose Harbor's endpoints when it's true. |
| `enableNginxLoadBalancer` | boolean | `false` | Use nginx and LoadBalancer to expose Harbor's endpoints when it's true. |
| `exporter.cacheDuration` | integer |  | The initial value of cacheDuration. |
| `harborAdminPassword` | string |  | The initial password of Harbor admin. |
| `hostname` | string | `harbor.yourdomain.com` | The FQDN for accessing Harbor admin UI and Registry service. |
| `ingress.className` | string | `contour` | The ingress class name to be used. |
| `jobservice.registryHttpClientTimeout` | integer |  | The request timeout for registry http client |
| `jobservice.replicas` | integer | `1` | The replicas for the jobservice component. |
| `jobservice.secret` | string |  | Secret is used when job service communicates with other components. |
| `logLevel` | string | `info` | The log level of core, exporter, jobservice, registry. |
| `metrics.core.path` | string | `/metrics` | The path of the metrics. |
| `metrics.core.port` | integer | `8001` | The port of the metrics. |
| `metrics.enabled` | boolean | `false` | Enable the metrics when it's true |
| `metrics.exporter.path` | string | `/metrics` | The path of the metrics. |
| `metrics.exporter.port` | integer | `8001` | The port of the metrics. |
| `metrics.jobservice.path` | string | `/metrics` | The path of the metrics. |
| `metrics.jobservice.port` | integer | `8001` | The port of the metrics. |
| `metrics.registry.path` | string | `/metrics` | The path of the metrics. |
| `metrics.registry.port` | integer | `8001` | The port of the metrics. |
| `namespace` | string | `tanzu-system-registry` | The namespace to install Harbor. |
| `network.ipFamilies` | array | `[]` | The array of network ipFamilies. Default [] is equivalent to have both ["IPv4","IPv6"]. Or you can choose one of ["IPv4"] or ["IPv6"] |
| `persistence.imageChartStorage.azure.accountkey` | string | `base64encodedaccountkey` | Account key of azure storage. |
| `persistence.imageChartStorage.azure.accountname` | string | `accountname` | Account name of azure storage. |
| `persistence.imageChartStorage.azure.container` | string | `containername` | Container name of azure storage. |
| `persistence.imageChartStorage.azure.realm` | string | `core.windows.net` | Realm for azure storage. |
| `persistence.imageChartStorage.disableredirect` | boolean | `false` | Specify whether to disable `redirect` for images and chart storage, for backends which not supported it (such as using minio for `s3` storage type), please disable it. To disable redirects, simply set `disableredirect` to `true` instead. Refer to https://github.com/docker/distribution/blob/master/docs/configuration.md#redirect for the detail. |
| `persistence.imageChartStorage.filesystem.rootdirectory` | string | `/storage` | The rootdirectory in filesystem. |
| `persistence.imageChartStorage.gcs.bucket` | string | `bucketname` | Bucket name of gcs. |
| `persistence.imageChartStorage.gcs.chunksize` | integer | `5242880` | Check size for gcs. |
| `persistence.imageChartStorage.gcs.encodedkey` | string | `base64-encoded-json-key-file` | The base64 encoded json file which contains the key |
| `persistence.imageChartStorage.gcs.rootdirectory` | string |  | The rootdirectory in gcs. |
| `persistence.imageChartStorage.oss.accesskeyid` | string | `accesskeyid` | Access key id of oss. |
| `persistence.imageChartStorage.oss.accesskeysecret` | string | `accesskeysecret` | Access key secert of oss. |
| `persistence.imageChartStorage.oss.bucket` | string | `bucketname` | Bucket name of oss. |
| `persistence.imageChartStorage.oss.chunksize` | string |  | Chunk size for the oss, eg 10M. |
| `persistence.imageChartStorage.oss.encrypt` | boolean |  | Encrypt of oss. |
| `persistence.imageChartStorage.oss.endpoint` | string |  | Endpoint of oss. |
| `persistence.imageChartStorage.oss.internal` | boolean |  | Use the internal endpoint when it's true. |
| `persistence.imageChartStorage.oss.region` | string | `regionname` | Region of oss. |
| `persistence.imageChartStorage.oss.rootdirectory` | string |  | The rootdirectory in oss. |
| `persistence.imageChartStorage.oss.secure` | boolean |  | Secure of oss. |
| `persistence.imageChartStorage.s3.accesskey` | string |  | Access key of s3. |
| `persistence.imageChartStorage.s3.bucket` | string | `bucketname` | Bucket name of s3. |
| `persistence.imageChartStorage.s3.chunksize` | integer |  | Check size for s3. |
| `persistence.imageChartStorage.s3.encrypt` | boolean | `false` | Encrypt for s3. |
| `persistence.imageChartStorage.s3.keyid` | string |  | Keyid of s3. |
| `persistence.imageChartStorage.s3.multipartcopychunksize` | integer |  | multi part copy chunk size of s3. |
| `persistence.imageChartStorage.s3.multipartcopymaxconcurrency` | integer |  | multi part copy max concurrency of s3. |
| `persistence.imageChartStorage.s3.multipartcopythresholdsize` | integer |  | multi part copy threshold size of s3. |
| `persistence.imageChartStorage.s3.region` | string | `us-west-1` | Region of s3. |
| `persistence.imageChartStorage.s3.regionendpoint` | string |  | Region endpoint of s3, eg http://myobjects.local |
| `persistence.imageChartStorage.s3.rootdirectory` | string |  | The rootdirectory in s3. |
| `persistence.imageChartStorage.s3.secretkey` | string |  | Secret key of s3. |
| `persistence.imageChartStorage.s3.secure` | boolean | `true` | Secure for s3. |
| `persistence.imageChartStorage.s3.skipverify` | boolean | `false` | skipverify for s3. |
| `persistence.imageChartStorage.s3.storageclass` | string | `STANDARD` | Storage class of s3. |
| `persistence.imageChartStorage.s3.v4auth` | boolean | `true` | Use v4auth for s3 when it's true. |
| `persistence.imageChartStorage.swift.accesskey` | string |  | Access key of swift. |
| `persistence.imageChartStorage.swift.authurl` | string | `https://storage.myprovider.com/v3/auth` | Auth url of swift. |
| `persistence.imageChartStorage.swift.authversion` | string |  | Auth version of swift. |
| `persistence.imageChartStorage.swift.chunksize` | string |  | Check size of swift, eg 5M. |
| `persistence.imageChartStorage.swift.container` | string | `containername` | Container of swift. |
| `persistence.imageChartStorage.swift.domain` | string |  | Domain of swift. |
| `persistence.imageChartStorage.swift.domainid` | string |  | Domain id of swift. |
| `persistence.imageChartStorage.swift.endpointtype` | string |  | Endpoint type of swift, eg public. |
| `persistence.imageChartStorage.swift.insecureskipverify` | boolean |  | Ignore the cert verify when it's true. |
| `persistence.imageChartStorage.swift.password` | string | `password` | Password of swift. |
| `persistence.imageChartStorage.swift.prefix` | string |  | Prefix path of swift. |
| `persistence.imageChartStorage.swift.region` | string |  | Region of swift. |
| `persistence.imageChartStorage.swift.secretkey` | string |  | Secret key of swift. |
| `persistence.imageChartStorage.swift.tempurlcontainerkey` | boolean |  | Use temp url container key of swift when it's true. |
| `persistence.imageChartStorage.swift.tempurlmethods` | string |  | Temp url methods of swift. |
| `persistence.imageChartStorage.swift.tenant` | string |  | Tenant of swift. |
| `persistence.imageChartStorage.swift.tenantid` | string |  | Tenant id of swift. |
| `persistence.imageChartStorage.swift.trustid` | string |  | Trust id of swift. |
| `persistence.imageChartStorage.swift.username` | string | `username` | Username of swift. |
| `persistence.imageChartStorage.type` | string | `filesystem` | Specify the type of storage: "filesystem", "azure", "gcs", "s3", "swift", "oss" and fill the information needed in the corresponding section. The type must be "filesystem" if you want to use persistent volumes for registry and chartmuseum |
| `persistence.persistentVolumeClaim.database.accessMode` | string | `ReadWriteOnce` | Access mode of the PVC. |
| `persistence.persistentVolumeClaim.database.existingClaim` | string | `` | Use the existing PVC which must be created manually before bound, and specify the "subPath" if the PVC is shared with other components |
| `persistence.persistentVolumeClaim.database.size` | string | `1Gi` | Size of the PVC. |
| `persistence.persistentVolumeClaim.database.storageClass` | string | `` | Specify the "storageClass" used to provision the volume. Or the default StorageClass will be used(the default). Set it to "-" to disable dynamic provisioning |
| `persistence.persistentVolumeClaim.database.subPath` | string | `` | The "subPath" if the PVC is shared with other components. |
| `persistence.persistentVolumeClaim.jobservice.jobLog.accessMode` | string | `ReadWriteOnce` | Access mode of the PVC. |
| `persistence.persistentVolumeClaim.jobservice.jobLog.existingClaim` | string | `` | Use the existing PVC which must be created manually before bound, and specify the "subPath" if the PVC is shared with other components |
| `persistence.persistentVolumeClaim.jobservice.jobLog.size` | string | `1Gi` | Size of the PVC. |
| `persistence.persistentVolumeClaim.jobservice.jobLog.storageClass` | string | `` | Specify the "storageClass" used to provision the volume. Or the default StorageClass will be used(the default). Set it to "-" to disable dynamic provisioning |
| `persistence.persistentVolumeClaim.jobservice.jobLog.subPath` | string | `` | The "subPath" if the PVC is shared with other components. |
| `persistence.persistentVolumeClaim.redis.accessMode` | string | `ReadWriteOnce` | Access mode of the PVC. |
| `persistence.persistentVolumeClaim.redis.existingClaim` | string | `` | Use the existing PVC which must be created manually before bound, and specify the "subPath" if the PVC is shared with other components |
| `persistence.persistentVolumeClaim.redis.size` | string | `1Gi` | Size of the PVC. |
| `persistence.persistentVolumeClaim.redis.storageClass` | string | `` | Specify the "storageClass" used to provision the volume. Or the default StorageClass will be used(the default). Set it to "-" to disable dynamic provisioning |
| `persistence.persistentVolumeClaim.redis.subPath` | string | `` | The "subPath" if the PVC is shared with other components. |
| `persistence.persistentVolumeClaim.registry.accessMode` | string | `ReadWriteOnce` | Access mode of the PVC. |
| `persistence.persistentVolumeClaim.registry.existingClaim` | string | `` | Use the existing PVC which must be created manually before bound, and specify the "subPath" if the PVC is shared with other components |
| `persistence.persistentVolumeClaim.registry.size` | string | `10Gi` | Size of the PVC. |
| `persistence.persistentVolumeClaim.registry.storageClass` | string | `` | Specify the "storageClass" used to provision the volume. Or the default StorageClass will be used(the default). Set it to "-" to disable dynamic provisioning |
| `persistence.persistentVolumeClaim.registry.subPath` | string | `` | The "subPath" if the PVC is shared with other components. |
| `persistence.persistentVolumeClaim.trivy.accessMode` | string | `ReadWriteOnce` | Access mode of the PVC. |
| `persistence.persistentVolumeClaim.trivy.existingClaim` | string | `` | Use the existing PVC which must be created manually before bound, and specify the "subPath" if the PVC is shared with other components |
| `persistence.persistentVolumeClaim.trivy.size` | string | `5Gi` | Size of the PVC. |
| `persistence.persistentVolumeClaim.trivy.storageClass` | string | `` | Specify the "storageClass" used to provision the volume. Or the default StorageClass will be used(the default). Set it to "-" to disable dynamic provisioning |
| `persistence.persistentVolumeClaim.trivy.subPath` | string | `` | The "subPath" if the PVC is shared with other components. |
| `port.https` | integer | `443` | The network port of the Envoy service in Contour or other Ingress Controller. |
| `priorityClassName` | string |  | The priority class name for all harbor pods |
| `proxy.httpProxy` | string | `` | HTTP proxy URL. |
| `proxy.httpsProxy` | string | `` | HTTPS proxy URL. |
| `proxy.noProxy` | string | `127.0.0.1,localhost,.local,.internal` | Ignore proxy for the domains. |
| `pspNames` | string |  | The PSP names used by Harbor pods. The names are separated by ','. 'null' means all PSP can be used. |
| `redis.external.addr` | string | `192.168.0.2:6379` | The address with port of external redis |
| `redis.external.cacheLayerDatabaseIndex` | integer |  | The split coreDatabase db into 2 seperate db, one is cacheLayerDatabaseIndex, but it can be configured to "7", this config is optional |
| `redis.external.coreDatabaseIndex` | integer | `0` | The coreDatabaseIndex must be 0 as the library Harbor |
| `redis.external.harborDatabaseIndex` | integer |  | The split coreDatabase db into 2 seperate db, one is harborDatabaseIndex, but it can be configured to "6", this config is optional |
| `redis.external.jobserviceDatabaseIndex` | integer | `1` | The jobservice redis db index, 1 as default |
| `redis.external.password` | string | `` | The password of external redis |
| `redis.external.registryDatabaseIndex` | integer | `2` | The registry redis db index, 2 as default |
| `redis.external.sentinelMasterSet` | string |  | The name of the set of Redis instances to monitor, it must be set to support redis+sentinel |
| `redis.external.trivyAdapterIndex` | integer | `5` | The trivy redis db index, 5 as default |
| `redis.type` | string | `internal` | The type of redis, either internal as default, or external |
| `registry.replicas` | integer | `1` | The replicas for the registry component. |
| `registry.secret` | string |  | Secret is used to secure the upload state from client and registry storage backend. |
| `resources.containers` | array | `[{"cpuLimit":"1000m","cpuRequest":"500m","memoryLimit":"2Gi","memoryRequest":"512Mi","name":"core"},{"cpuLimit":"2000m","cpuRequest":"1000m","memoryLimit":"2Gi","memoryRequest":"1Gi","name":"database"},{"cpuLimit":"1000m","cpuRequest":"500m","memoryLimit":"2Gi","memoryRequest":"512Mi","name":"jobservice"},{"cpuLimit":"300m","cpuRequest":"100m","memoryLimit":"256Mi","memoryRequest":"128Mi","name":"portal"},{"cpuLimit":"500m","cpuRequest":"200m","memoryLimit":"1Gi","memoryRequest":"256Mi","name":"redis"},{"cpuLimit":"1000m","cpuRequest":"500m","memoryLimit":"2Gi","memoryRequest":"512Mi","name":"registry"},{"cpuLimit":"500m","cpuRequest":"200m","memoryLimit":"512Mi","memoryRequest":"256Mi","name":"registryctl"},{"cpuLimit":"2000m","cpuRequest":"500m","memoryLimit":"4Gi","memoryRequest":"1Gi","name":"trivy"},{"cpuLimit":"300m","cpuRequest":"100m","memoryLimit":"256Mi","memoryRequest":"128Mi","name":"exporter"}]` | The resource requests and limits for Harbor containers. |
| `resources.namespaceLimitRange.defaultCPULimit` | string | `1000m` | The default CPU limit for the namespace. |
| `resources.namespaceLimitRange.defaultCPURequest` | string | `300m` | The default CPU request for the namespace. |
| `resources.namespaceLimitRange.defaultMemoryLimit` | string | `2Gi` | The default memory limit for the namespace. |
| `resources.namespaceLimitRange.defaultMemoryRequest` | string | `256Mi` | The default memory request for the namespace. |
| `secretKey` | string |  | The secret key used for encryption. Must be a string of 16 chars. |
| `tlsCertificate.ca.crt` | string |  | The certificate of CA, this enables the download, link on portal to download the certificate of CA. Note that ca.crt is a key and not nested. |
| `tlsCertificate.signingSettings.additionalDnsNames` | array | `[]` | The DNS names, in addition to hostname in values.yaml, to be included in the TLS certificate SAN. |
| `tlsCertificate.signingSettings.caIssuer.ca.crt` | string |  | The CA certificate to sign the TLS certificate. |
| `tlsCertificate.signingSettings.caIssuer.ca.key` | string |  | The CA private key to sign the TLS certificate. |
| `tlsCertificate.signingSettings.ipAddresses` | array | `[]` | The IP addresses to be included in the TLS certificate SAN. |
| `tlsCertificate.tls.crt` | string |  | The certificate. Note that tls.crt is a key and not nested. |
| `tlsCertificate.tls.key` | string |  | The private key. Note that tls.key is a key and not nested. |
| `tlsCertificate.tlsSecretLabels` | object |  | the labels you want to add for the harbor-tls secret generated by the tlsCertificate |
| `tlsCertificateSecretName` | string |  | The name of the secret if you want to use your own TLS certificate for harbor FQDN, which contains keys named "tls.crt" and "tls.key". |
| `trace.attributes` | object |  | The attributes is a key value dict contains user defined attributes used to initialize trace provider. |
| `trace.enabled` | boolean | `false` | Enable tracing for Harbor. |
| `trace.jaeger.agent_host` | string |  | The agent_host of jaeger in agent mode. |
| `trace.jaeger.agent_port` | integer |  | The agent_port of jaeger in agent mode. |
| `trace.jaeger.endpoint` | string | `http://hostname:14268/api/traces` | The endpoint of jaeger. |
| `trace.jaeger.password` | string |  | The password of jaeger in collector mode. |
| `trace.jaeger.username` | string |  | The username of jaeger in collector mode. |
| `trace.namespace` | string |  | The namespace used to differentiate different harbor services. |
| `trace.otel.compression` | boolean | `false` | Whether to set compression when enabling tracing with Otel. |
| `trace.otel.endpoint` | string | `hostname:4318` | The endpoint of otel. |
| `trace.otel.insecure` | boolean | `true` | Whether to connect the collector insecurely. |
| `trace.otel.timeout` | integer | `10` | The max waiting time for the backend to process each spans batch, in seconds. |
| `trace.otel.url_path` | string | `/v1/traces` | The url path of tracing with Otel. |
| `trace.provider` | string | `jaeger` | The provider type of tracing, jaeger or otel. |
| `trace.sample_rate` | number | `1` | Set sample_rate to 1 if you wanna sampling 100% of trace data; set 0.5 if you wanna sampling 50% of trace data, and so forth. |
| `trivy.dbRepository` | string | `ghcr.io/aquasecurity/trivy-db` | Repository for vulnerability database. You could override it to use a custom or mirrored repository |
| `trivy.enabled` | boolean | `true` | Whether to install Trivy scanner. |
| `trivy.gitHubToken` | string | `` | the GitHub access token to download Trivy DB. |
| `trivy.insecure` | boolean | `false` | The flag to skip verifying registry certificate. e.g. It would skips verifying the self-hosted registry's certificate for the vulnerability database repository when insecure is set to true. |
| `trivy.javaDBRepository` | string | `ghcr.io/aquasecurity/trivy-java-db` | Repository for Java vulnerability database. You could override it to use a custom or mirrored repository |
| `trivy.offlineScan` | boolean | `false` | The offlineScan option prevents Trivy from sending API requests to identify dependencies. |
| `trivy.replicas` | integer | `1` | The replicas for the trivy component. |
| `trivy.skipJavaDBUpdate` | boolean | `false` | The flag to disable Trivy Java DB downloads from remote repository. |
| `trivy.skipUpdate` | boolean | `false` | The flag to disable Trivy DB downloads from remote repository. |
| `trivy.timeout` | string | `` | The timeout set for trivy scanner, it should be a number followed by a letter like "h", "m", "s", or "ms", i.e. 1h, 5m, 60s, 1000ms. |
| `trivy.tmpdir` | string | `` | If /tmp doesn't work for you, you can change it by setting this environment variable. Normally would be /home/scanner |
| `vmciRelayProxy.enabled` | boolean | `false` | Deploy the VMCI relay proxy as a sidecar when it's set to true. |
| `vmciRelayProxy.managementServices` | array |  | Management services configuration for the vmci relay proxy. |
