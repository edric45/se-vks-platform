# Phase 0: Inventory

Purpose: record exactly what the VKS Istio add-on installed and what it lets us
configure. Run 2026-09-20 against se-cluster-01 (Supervisor wld-sup / 172.17.10.2).

## Commands and output

### Cluster and Supervisor
```
$ kubectl version
Client Version: v1.36.2
Kustomize Version: v5.8.1
Server Version: v1.35.6+vmware.2

$ kubectl get nodes -o wide
NAME                                                 STATUS   ROLES           AGE   VERSION            INTERNAL-IP   EXTERNAL-IP   OS-IMAGE                 KERNEL-VERSION   CONTAINER-RUNTIME
se-cluster-01-se-cluster-01-np01-cjpf6-sqm4q-fj2sd   Ready    <none>          38h   v1.35.6+vmware.2   172.30.0.6    <none>        VMware Photon OS/Linux   6.1.176-4.ph5    containerd://2.2.5+vmware.3-fips
se-cluster-01-se-cluster-01-np01-cjpf6-sqm4q-lbdb8   Ready    <none>          38h   v1.35.6+vmware.2   172.30.0.7    <none>        VMware Photon OS/Linux   6.1.176-4.ph5    containerd://2.2.5+vmware.3-fips
se-cluster-01-tvd2q-jkzcg                            Ready    control-plane   38h   v1.35.6+vmware.2   172.30.0.5    <none>        VMware Photon OS/Linux   6.1.176-4.ph5    containerd://2.2.5+vmware.3-fips

$ kubectl --context=<supervisor> -n se-namespace get cluster
NAME            CLUSTERCLASS             AVAILABLE   CP DESIRED   CP AVAILABLE   CP UP-TO-DATE   W DESIRED   W AVAILABLE   W UP-TO-DATE   PHASE         AGE   VERSION
se-cluster-01   builtin-generic-v3.7.0   True        1            1              1               2           2             2              Provisioned   47h   v1.35.6+vmware.2
```

### The add-on: PackageInstall, Package, values
```
$ kubectl -n vmware-system-tkg get packageinstall
NAME                                       PACKAGE NAME                                  PACKAGE VERSION                 DESCRIPTION           AGE     PAUSED
se-cluster-01-antrea                       antrea.tanzu.vmware.com                       2.5.2+vmware.2-tkg.1            Reconcile succeeded   47h     
se-cluster-01-cert-manager                 cert-manager.kubernetes.vmware.com            1.20.2+vmware.1-vks.1           Reconcile succeeded   32h     
se-cluster-01-gateway-api                  gateway-api.tanzu.vmware.com                  1.4.0+vmware.4-tkg.1            Reconcile succeeded   47h     
se-cluster-01-guest-cluster-auth-service   guest-cluster-auth-service.tanzu.vmware.com   1.4.8+vmware.1-tkg.1            Reconcile succeeded   47h     
se-cluster-01-headlamp                     headlamp.kubernetes.vmware.com                0.42.0+vmware.1-vks.1           Reconcile succeeded   15h     
se-cluster-01-helm-controller              helm-controller.kubernetes.vmware.com         1.5.4+v4.01.04-vmware.1-vks.1   Reconcile succeeded   47h     
se-cluster-01-istio                        istio.kubernetes.vmware.com                   1.28.2+vmware.1-vks.1           Reconcile succeeded   4m39s   
se-cluster-01-metrics-server               metrics-server.tanzu.vmware.com               0.8.1+vmware.3-fips-tkg.1       Reconcile succeeded   47h     
se-cluster-01-pinniped                     pinniped.tanzu.vmware.com                     0.46.0+vmware.8-tkg.2           Reconcile succeeded   47h     
se-cluster-01-prometheus                   prometheus.kubernetes.vmware.com              3.5.3+vmware.1-vks.1            Reconcile succeeded   47h     
se-cluster-01-secretgen-controller         secretgen-controller.tanzu.vmware.com         0.21.1+vmware.4-fips-tkg.1      Reconcile succeeded   47h     
se-cluster-01-telegraf                     telegraf.kubernetes.vmware.com                1.38.4+vmware.1-vks.1           Reconcile succeeded   47h     
se-cluster-01-vault-injector               vault-injector.kubernetes.vmware.com          1.7.4+vmware.1-vks.1            Reconcile succeeded   47h     
se-cluster-01-vsphere-cpi                  vsphere-cpi.tanzu.vmware.com                  1.35.1+vmware.2-tkg.1           Reconcile succeeded   47h     
se-cluster-01-vsphere-pv-csi               vsphere-pv-csi.tanzu.vmware.com               3.7.0+vmware.4-tkg.1            Reconcile succeeded   47h     

$ kubectl --context=<supervisor> -n vmware-system-vks-public get packages | grep istio
istio.kubernetes.vmware.com.1.27.1+vmware.1-vks.1                         istio.kubernetes.vmware.com                         1.27.1+vmware.1-vks.1                  2380h44m55s
istio.kubernetes.vmware.com.1.27.4+vmware.1-vks.1                         istio.kubernetes.vmware.com                         1.27.4+vmware.1-vks.1                  2380h44m55s
istio.kubernetes.vmware.com.1.27.5+vmware.1-vks.1                         istio.kubernetes.vmware.com                         1.27.5+vmware.1-vks.1                  2380h44m55s
istio.kubernetes.vmware.com.1.28.2+vmware.1-vks.1                         istio.kubernetes.vmware.com                         1.28.2+vmware.1-vks.1                  2380h44m55s
istio.kubernetes.vmware.com.1.28.7+vmware.1-vks.1                         istio.kubernetes.vmware.com                         1.28.7+vmware.1-vks.1                  1737h40m29s
istio.kubernetes.vmware.com.1.30.0+vmware.1-vks.1                         istio.kubernetes.vmware.com                         1.30.0+vmware.1-vks.1                  1737h40m29s

$ kubectl -n vmware-system-tkg get packageinstall se-cluster-01-istio -o jsonpath=... (spec)
{
    "packageRef": {
        "refName": "istio.kubernetes.vmware.com",
        "versionSelection": {
            "constraints": "1.28.2+vmware.1-vks.1"
        }
    },
    "serviceAccountName": "tanzu-cluster-bootstrap-sa",
    "values": [
        {
            "secretRef": {
                "name": "se-cluster-01-istio-values"
            }
        }
    ]
}
```

### Values in use (fully resolved, includes add-on defaults)
```yaml
istio:
  ambientMode:
      enabled: true
      ztunnel:
          resources:
              requests:
                  cpu: 200m
                  memory: 512Mi
  enableGatewayAPIInference: false
  enableStrictMTLS: false
  gateways:
      egress:
          autoscaling:
              enabled: false
              maxReplicas: 5
              minReplicas: 1
          enabled: false
          namespace: istio-egress
          namespaceLimitRange:
              defaultRequests:
                  cpu: 100m
                  memory: 128Mi
          priorityClassName: ""
          replicas: 1
          resources:
              limits:
                  cpu: 2000m
                  memory: 1024Mi
              requests:
                  cpu: 100m
                  memory: 128Mi
      ingress:
          autoscaling:
              enabled: false
              maxReplicas: 5
              minReplicas: 1
          enabled: false
          namespace: istio-ingress
          namespaceLimitRange:
              defaultRequests:
                  cpu: 100m
                  memory: 128Mi
          priorityClassName: ""
          replicas: 1
          resources:
              limits:
                  cpu: 2000m
                  memory: 1024Mi
              requests:
                  cpu: 100m
                  memory: 128Mi
  istioCNI:
      enabled: true
      resources:
          requests:
              cpu: 100m
              memory: 100Mi
  meshConfig:
      accessLogFile: /dev/stdout
      connectTimeout: 10s
      enableDNSProxy: false
      enablePrometheusMerge: true
      enableTracing: true
      externalIstiod: false
      ingressControllerMode: STRICT
      ingressSelector: ingressgateway
      meshID: ""
      meshMTLS:
          minProtocolVersion: TLSV1_2
      network: ""
      proxy:
          resources:
              limits:
                  cpu: 2000m
                  memory: 1024Mi
              requests:
                  cpu: 100m
                  memory: 128Mi
      trustDomain: cluster.local
      trustDomainAliases: []
      waypoint:
          resources:
              limits:
                  cpu: "3"
                  memory: 2Gi
              requests:
                  cpu: 300m
                  memory: 512Mi
  namespace: istio-system
  namespaceLimitRange:
      defaultRequests:
          cpu: 100m
          memory: 64Mi
  pilot:
      autoscaling:
          enabled: false
          maxReplicas: 5
          minReplicas: 2
      priorityClassName: ""
      replicas: 2
      resources:
          requests:
              cpu: 500m
              memory: 2048Mi
  support:
      priorityClassName: ""
      resources:
          requests:
              cpu: 100m
              memory: 64Mi
```

### What got installed
```
$ kubectl get all -n istio-system -o wide
NAME                                READY   STATUS    RESTARTS   AGE     IP               NODE                                                 NOMINATED NODE   READINESS GATES
pod/istio-cni-node-2tfhl            1/1     Running   0          4m59s   192.168.147.21   se-cluster-01-se-cluster-01-np01-cjpf6-sqm4q-fj2sd   <none>           <none>
pod/istio-cni-node-6xcsl            1/1     Running   0          4m59s   192.168.148.12   se-cluster-01-tvd2q-jkzcg                            <none>           <none>
pod/istio-cni-node-rmkxm            1/1     Running   0          4m59s   192.168.146.25   se-cluster-01-se-cluster-01-np01-cjpf6-sqm4q-lbdb8   <none>           <none>
pod/istio-support-5646f468b-m57vd   1/1     Running   0          4m59s   192.168.146.23   se-cluster-01-se-cluster-01-np01-cjpf6-sqm4q-lbdb8   <none>           <none>
pod/istiod-5f5ff7b7f6-ttghz         1/1     Running   0          4m59s   192.168.147.20   se-cluster-01-se-cluster-01-np01-cjpf6-sqm4q-fj2sd   <none>           <none>
pod/istiod-5f5ff7b7f6-xfsb9         1/1     Running   0          4m59s   192.168.146.24   se-cluster-01-se-cluster-01-np01-cjpf6-sqm4q-lbdb8   <none>           <none>
pod/ztunnel-c6bsl                   1/1     Running   0          4m59s   192.168.146.26   se-cluster-01-se-cluster-01-np01-cjpf6-sqm4q-lbdb8   <none>           <none>
pod/ztunnel-p79fx                   1/1     Running   0          4m59s   192.168.148.13   se-cluster-01-tvd2q-jkzcg                            <none>           <none>
pod/ztunnel-vlb74                   1/1     Running   0          4m59s   192.168.147.22   se-cluster-01-se-cluster-01-np01-cjpf6-sqm4q-fj2sd   <none>           <none>

NAME             TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)                                 AGE     SELECTOR
service/istiod   ClusterIP   10.100.127.253   <none>        15010/TCP,15012/TCP,443/TCP,15014/TCP   4m59s   app=istiod,istio=pilot,kapp.k14s.io/app=1789926656602105793

NAME                            DESIRED   CURRENT   READY   UP-TO-DATE   AVAILABLE   NODE SELECTOR            AGE     CONTAINERS    IMAGES                                                                                                                                                                                 SELECTOR
daemonset.apps/istio-cni-node   3         3         3       3            3           kubernetes.io/os=linux   4m59s   install-cni   projects.packages.broadcom.com/vsphere/supervisor/vks-standard-packages/3.6.0-20260211/vks-standard-packages@sha256:934d53e6336b4c04e3ba805c07b0fc1680d6c9a3e1382e47c5f5718fcab42937   k8s-app=istio-cni-node,kapp.k14s.io/app=1789926656602105793
daemonset.apps/ztunnel          3         3         3       3            3           kubernetes.io/os=linux   4m59s   istio-proxy   projects.packages.broadcom.com/vsphere/supervisor/vks-standard-packages/3.6.0-20260211/vks-standard-packages@sha256:25b952f4419c024e9336e92e772a0f0414b5d94174c9747d602320098630017c   app=ztunnel,kapp.k14s.io/app=1789926656602105793

NAME                            READY   UP-TO-DATE   AVAILABLE   AGE     CONTAINERS      IMAGES                                                                                                                                                                                 SELECTOR
deployment.apps/istio-support   1/1     1            1           4m59s   istio-support   projects.packages.broadcom.com/vsphere/supervisor/vks-standard-packages/3.6.0-20260211/vks-standard-packages@sha256:629eb71a0e08d1f4065106ac02ef395248c91755e233b5c7aaabcc6050ee78ad   app=istio-support,kapp.k14s.io/app=1789926656602105793
deployment.apps/istiod          2/2     2            2           4m59s   discovery       projects.packages.broadcom.com/vsphere/supervisor/vks-standard-packages/3.6.0-20260211/vks-standard-packages@sha256:ccbd72a54d8d36429e8ab8913ff241228648b5f76c1a09912696ae0738a5dc3d   istio=pilot,kapp.k14s.io/app=1789926656602105793

NAME                                      DESIRED   CURRENT   READY   AGE     CONTAINERS      IMAGES                                                                                                                                                                                 SELECTOR
replicaset.apps/istio-support-5646f468b   1         1         1       4m59s   istio-support   projects.packages.broadcom.com/vsphere/supervisor/vks-standard-packages/3.6.0-20260211/vks-standard-packages@sha256:629eb71a0e08d1f4065106ac02ef395248c91755e233b5c7aaabcc6050ee78ad   app=istio-support,kapp.k14s.io/app=1789926656602105793,pod-template-hash=5646f468b
replicaset.apps/istiod-5f5ff7b7f6         2         2         2       4m59s   discovery       projects.packages.broadcom.com/vsphere/supervisor/vks-standard-packages/3.6.0-20260211/vks-standard-packages@sha256:ccbd72a54d8d36429e8ab8913ff241228648b5f76c1a09912696ae0738a5dc3d   istio=pilot,kapp.k14s.io/app=1789926656602105793,pod-template-hash=5f5ff7b7f6

$ kubectl get ns istio-system --show-labels
NAME           STATUS   AGE    LABELS
istio-system   Active   5m4s   kapp.k14s.io/app=1789926656602105793,kapp.k14s.io/association=v1.6e90eba7e3f3e6e153b8f8d099d87e47,kubernetes.io/metadata.name=istio-system,pod-security.kubernetes.io/enforce=privileged

$ kubectl get ds -n istio-system -o jsonpath=... updateStrategy
ztunnel: {"rollingUpdate":{"maxSurge":1,"maxUnavailable":0},"type":"RollingUpdate"}
istio-cni-node: {"rollingUpdate":{"maxSurge":0,"maxUnavailable":1},"type":"RollingUpdate"}

$ kubectl get mutatingwebhookconfiguration,validatingwebhookconfiguration | grep -i istio
mutatingwebhookconfiguration.admissionregistration.k8s.io/istio-sidecar-injector     4     4m43s
validatingwebhookconfiguration.admissionregistration.k8s.io/istio-validator-istio-system   1     4m43s
validatingwebhookconfiguration.admissionregistration.k8s.io/istiod-default-validator       1     4m43s
```

### istiod environment (CA_TRUSTED_NODE_ACCOUNTS is the one to confirm)
```
        REVISION	        = default
        PILOT_CERT_PROVIDER	        = istiod
        POD_NAME	        name: POD_NAMESPACE
        SERVICE_ACCOUNT	        name: KUBECONFIG
        = /var/run/secrets/remote/config	        CA_TRUSTED_NODE_ACCOUNTS
        = istio-system/ztunnel	        PILOT_ENABLE_AMBIENT
        = true	        PILOT_TRACE_SAMPLING
        = 1	        PILOT_ENABLE_ANALYSIS
        = false	        CLUSTER_ID
        = Kubernetes	        GOMEMLIMIT
        GOMAXPROCS	        name: PLATFORM
```

### istio-cni configuration as installed
```
AMBIENT_DNS_CAPTURE=true
AMBIENT_ENABLED=true
    matchLabels:
      istio.io/dataplane-mode: ambient
- namespaceSelector:
    matchLabels:
      istio.io/dataplane-mode: ambient
  podSelector:
    matchExpressions:
    - key: istio.io/dataplane-mode
      operator: NotIn
      values:
      - none
AMBIENT_IPV6=false
AMBIENT_RECONCILE_POD_RULES_ON_STARTUP=false
CHAINED_CNI_PLUGIN=true
CURRENT_AGENT_VERSION=latest
EXCLUDE_NAMESPACES=kube-system
ISTIO_OWNED_CNI_CONFIG=false
NATIVE_NFTABLES=false
REPAIR_BROKEN_POD_LABEL_KEY=cni.istio.io/uninitialized
REPAIR_BROKEN_POD_LABEL_VALUE=true
REPAIR_DELETE_PODS=false
REPAIR_ENABLED=true
REPAIR_INIT_CONTAINER_NAME=istio-validation
REPAIR_LABEL_PODS=false
REPAIR_REPAIR_PODS=true
```

### Gateway API: owned by a separate add-on, not by Istio
```
$ kubectl get gatewayclass -o wide
NAME             CONTROLLER                    ACCEPTED   AGE   DESCRIPTION
istio            istio.io/gateway-controller   True       47h   The default Istio GatewayClass
istio-remote     istio.io/unmanaged-gateway    True       47h   Remote to this cluster. Does not deploy or affect configuration.
istio-waypoint   istio.io/mesh-controller      True       47h   The default Istio waypoint GatewayClass

$ kubectl get crd | grep gateway.networking.k8s.io
backendtlspolicies.gateway.networking.k8s.io
gatewayclasses.gateway.networking.k8s.io
gateways.gateway.networking.k8s.io
grpcroutes.gateway.networking.k8s.io
httproutes.gateway.networking.k8s.io
referencegrants.gateway.networking.k8s.io

$ bundle-version / channel
v1.4.0  channel=standard

$ which PackageInstall owns them
se-cluster-01-gateway-api                  gateway-api.tanzu.vmware.com                  1.4.0+vmware.4-tkg.1            Reconcile succeeded   47h     
```

### Values schema: hit count per checklist term

Searching raw/00-values-schema.json for the terms the customer checklist asks about.
A zero means the add-on exposes no setting for it at any level.

```
ambient                  6
excludeNamespaces        0
dnsCapture               0
outboundTrafficPolicy    0
caAddress                0
caCertificates           0
pluginCA                 0
cert-manager             0
istio-csr                0
trustDomain              3
waypoint                 3
updateStrategy           0
env                      6
```

### istioctl
```
$ istioctl version
client version: 1.28.2
control plane version: 1.28-dev
data plane version: 1.28-dev (3 proxies)

$ istioctl x precheck
✔ No issues found when checking the cluster. Istio is safe to install or upgrade!
  To get started, check out https://istio.io/latest/docs/setup/getting-started/.

$ istioctl proxy-status
NAME                           CLUSTER        ISTIOD                      VERSION      SUBSCRIBED TYPES
ztunnel-c6bsl.istio-system     Kubernetes     istiod-5f5ff7b7f6-ttghz     1.28-dev     2 (WADS,WDS)
ztunnel-p79fx.istio-system     Kubernetes     istiod-5f5ff7b7f6-xfsb9     1.28-dev     2 (WADS,WDS)
ztunnel-vlb74.istio-system     Kubernetes     istiod-5f5ff7b7f6-ttghz     1.28-dev     2 (WADS,WDS)
```

### Load balancer
```
$ kubectl get svc -A | grep LoadBalancer
headlamp                  headlamp                        LoadBalancer   10.99.209.212    172.17.10.26   443:32321/TCP                           15h

$ kubectl get pods -A | grep -iE "ako|avi"
(none — AKO is not installed on this cluster; Avi provides L4 via the Supervisor)
```

## Observations

**Versions.** Guest cluster Kubernetes `v1.35.6+vmware.2`; ClusterClass
`builtin-generic-v3.7.0`. Istio add-on release
`istio.kubernetes.vmware.com.1.28.2-vmware.1-vks.1`. istiod reports its
control plane version as **`1.28-dev`** — this is how the VMware build
identifies itself, not an unstable build. `istioctl` 1.28.2 matches.

**Environment differs from the brief's stated assumptions.** The brief expects
VKS 3.6.x; this Supervisor offers `builtin-generic-v3.7.0` and six Istio
releases (1.27.1, 1.27.4, 1.27.5, 1.28.2, 1.28.7, 1.30.0). 1.28.2 was selected
deliberately to match the brief.

**Data plane.** ztunnel 3/3 and istio-cni-node 3/3, one per node, across one
control plane and two workers. istiod at 2 replicas
(`istio.pilot.replicas: 2`). No sidecar injector webhook is in use for
workloads: ambient only.

**Mesh starts PERMISSIVE.** `enableStrictMTLS: false`, and no
PeerAuthentication exists in any namespace. This is required for the estate:
the unenrolled `legacy` namespace must reach the mesh in Phases 2 and 3.

**No ingress gateway installed.** `gateways.ingress.enabled: false` and
`gateways.egress.enabled: false`. Phase 10 will create a Gateway API
`Gateway` with `gatewayClassName: istio`, which participates in ambient,
rather than the add-on's classic sidecar-mode gateway.

**istio-cni as installed.** `EXCLUDE_NAMESPACES: "kube-system"` — note this is
`kube-system` only; `istio-system` is **not** excluded, contrary to the
customer checklist's request. `AMBIENT_DNS_CAPTURE: "true"`.

**CA.** `CA_TRUSTED_NODE_ACCOUNTS=istio-system/ztunnel` is set by the add-on with no
configuration required. This is the setting the customer checklist asks for
under istio-csr; it is present by default because ambient needs it — ztunnel
requests certificates on behalf of workloads on its node.

**Values schema: what the add-on does and does not expose.** Searching the
76 KB schema for the checklist terms:

| Term | Hits | Meaning |
|---|---|---|
| `ambient` | yes | `ambientMode.enabled` and ztunnel resources |
| `waypoint` | 3 | `meshConfig.waypoint.resources` only — no HPA, no PDB |
| `trustDomain` | 3 | `meshConfig.trustDomain`, `trustDomainAliases` |
| `excludeNamespaces` | **0** | no way to change istio-cni exclusions |
| `dnsCapture` | **0** | not tunable; default `true` applies |
| `outboundTrafficPolicy` | **0** | not exposed |
| `caAddress` | **0** | |
| `caCertificates` | **0** | |
| `pluginCA` | **0** | |
| `cert-manager` | **0** | |
| `istio-csr` | **0** | |
| `updateStrategy` | **0** | no canary control for the istio-cni DaemonSet |

The CA row is the significant one: **the add-on exposes no CA configuration of
any kind.** Phase 14 tests whether istiod honours a hand-made `cacerts`
Secret regardless.

**Gateway API is owned by a separate add-on.** CRDs come from the
`gateway-api` PackageInstall at bundle version **v1.4.0, standard channel**.
Istio ships only `networking.istio.io` CRDs. `TCPRoute`, `TLSRoute` and
`UDPRoute` are **absent** (0 CRDs matched), as expected for the standard
channel. All three GatewayClasses (`istio`, `istio-remote`,
`istio-waypoint`) are registered by the Istio add-on.

**Load balancer.** Avi provides L4 through the Supervisor; no AKO pods run on
this cluster. Services of type LoadBalancer receive a VIP in 172.17.10.x.

## Open questions

- The control plane reporting `1.28-dev` rather than `1.28.2` is a VMware
  build convention. Not investigated further.
- `updateStrategy` returning 0 schema hits confirms the customer's canary
  istio-cni rollout request cannot be satisfied through add-on values. Whether
  the DaemonSet's own `maxUnavailable` can be patched via a ytt overlay was
  not tested in this phase.
