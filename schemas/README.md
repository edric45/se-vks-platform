# Addon values schemas

Reference dump of the `valuesSchema` for every installable package on the
Supervisor, so addon options can be looked up without querying the cluster.

- `md/` — human-readable property tables (start here)
- `json/` — raw OpenAPI v3 schemas
- `dump-schemas.sh` — regenerate, or fetch a specific version

```sh
./dump-schemas.sh                  # newest version of every package
./dump-schemas.sh istio 1.28.2     # one specific version
```

Only the **newest version of each package** is dumped; every available version
is listed at the bottom. Use the script to pull an older one.

Some packages expose no values schema at all (nothing configurable) and show 0
options below. Three VKS addons — `carvel-repo`, `depot.kube-system.svc` and
`vks-static-resources` — have no Package object; they are internal plumbing.

Generated from Supervisor `wld-sup` (VKS 3.7.0).

## Quick reference

| Addon | Newest | Options | Schema |
|---|---|---|---|
| ako | 2.2.1 | 75 | [md](md/ako-2.2.1.md) · [json](json/ako-2.2.1.json) |
| antrea | 2.6.2 | 189 | [md](md/antrea-2.6.2.md) · [json](json/antrea-2.6.2.json) |
| argocd-service.vsphere.vmware.com | 1.1.0-25100889 | 3 | [md](md/argocd-service.vsphere.vmware.com-1.1.0-25100889.md) · [json](json/argocd-service.vsphere.vmware.com-1.1.0-25100889.json) |
| auto-attach.vksm.broadcom.com | 0.2.0 | 0 | [md](md/auto-attach.vksm.broadcom.com-0.2.0.md) · [json](json/auto-attach.vksm.broadcom.com-0.2.0.json) |
| calico | 3.31.5 | 23 | [md](md/calico-3.31.5.md) · [json](json/calico-3.31.5.json) |
| capabilities | 0.33.1 | 0 | [md](md/capabilities-0.33.1.md) · [json](json/capabilities-0.33.1.json) |
| cci-ns.vmware.com | 9.1.0-embedded | 3 | [md](md/cci-ns.vmware.com-9.1.0-embedded.md) · [json](json/cci-ns.vmware.com-9.1.0-embedded.json) |
| cert-manager | 1.20.2 | 17 | [md](md/cert-manager-1.20.2.md) · [json](json/cert-manager-1.20.2.json) |
| cilium | 1.19.4 | 0 | [md](md/cilium-1.19.4.md) · [json](json/cilium-1.19.4.json) |
| cluster-autoscaler | 1.36.0 | 19 | [md](md/cluster-autoscaler-1.36.0.md) · [json](json/cluster-autoscaler-1.36.0.json) |
| configuration.vsphere.vmware.com | 9.1.0-25233277 | 0 | [md](md/configuration.vsphere.vmware.com-9.1.0-25233277.md) · [json](json/configuration.vsphere.vmware.com-9.1.0-25233277.json) |
| contour | 1.33.4 | 65 | [md](md/contour-1.33.4.md) · [json](json/contour-1.33.4.json) |
| csi-proxy | 1.1.3 | 8 | [md](md/csi-proxy-1.1.3.md) · [json](json/csi-proxy-1.1.3.json) |
| dr-operator.vmware.com | 9.1.0-25369307 | 5 | [md](md/dr-operator.vmware.com-9.1.0-25369307.md) · [json](json/dr-operator.vmware.com-9.1.0-25369307.json) |
| external-dns | 0.21.0 | 29 | [md](md/external-dns-0.21.0.md) · [json](json/external-dns-0.21.0.json) |
| fluent-bit | 5.0.5 | 22 | [md](md/fluent-bit-5.0.5.md) · [json](json/fluent-bit-5.0.5.json) |
| gatekeeper | 3.22.2 | 36 | [md](md/gatekeeper-3.22.2.md) · [json](json/gatekeeper-3.22.2.json) |
| gateway-api | 1.5.1 | 0 | [md](md/gateway-api-1.5.1.md) · [json](json/gateway-api-1.5.1.json) |
| guest-cluster-auth-service | 1.4.8 | 3 | [md](md/guest-cluster-auth-service-1.4.8.md) · [json](json/guest-cluster-auth-service-1.4.8.json) |
| harbor | 2.14.2 | 185 | [md](md/harbor-2.14.2.md) · [json](json/harbor-2.14.2.json) |
| harbor | 2.15.1 | 185 | [md](md/harbor-2.15.1.md) · [json](json/harbor-2.15.1.json) |
| headlamp | 0.42.0 | 61 | [md](md/headlamp-0.42.0.md) · [json](json/headlamp-0.42.0.json) |
| helm-controller | 1.5.4 | 28 | [md](md/helm-controller-1.5.4.md) · [json](json/helm-controller-1.5.4.json) |
| istio | 1.30.0 | 93 | [md](md/istio-1.30.0.md) · [json](json/istio-1.30.0.json) |
| kapp-controller | 0.60.4 | 28 | [md](md/kapp-controller-0.60.4.md) · [json](json/kapp-controller-0.60.4.json) |
| kube-state-metrics.vsphere.vmware.com | 2.14.0-25195109 | 1 | [md](md/kube-state-metrics.vsphere.vmware.com-2.14.0-25195109.md) · [json](json/kube-state-metrics.vsphere.vmware.com-2.14.0-25195109.json) |
| metrics-aggregator.vmware.com | 0.1.0 | 11 | [md](md/metrics-aggregator.vmware.com-0.1.0.md) · [json](json/metrics-aggregator.vmware.com-0.1.0.json) |
| metrics-server | 0.8.1 | 19 | [md](md/metrics-server-0.8.1.md) · [json](json/metrics-server-0.8.1.json) |
| multus-cni | 4.2.4 | 14 | [md](md/multus-cni-4.2.4.md) · [json](json/multus-cni-4.2.4.json) |
| nfs-client | 4.13.2 | 44 | [md](md/nfs-client-4.13.2.md) · [json](json/nfs-client-4.13.2.json) |
| pinniped | 0.46.0 | 0 | [md](md/pinniped-0.46.0.md) · [json](json/pinniped-0.46.0.json) |
| prometheus | 3.5.3 | 137 | [md](md/prometheus-3.5.3.md) · [json](json/prometheus-3.5.3.json) |
| secret-store.vsphere.vmware.com | 9.2.0-25650518 | 1 | [md](md/secret-store.vsphere.vmware.com-9.2.0-25650518.md) · [json](json/secret-store.vsphere.vmware.com-9.2.0-25650518.json) |
| secretgen-controller | 0.21.1 | 6 | [md](md/secretgen-controller-0.21.1.md) · [json](json/secretgen-controller-0.21.1.json) |
| sriov-network-device-plugin | 3.11.0 | 3 | [md](md/sriov-network-device-plugin-3.11.0.md) · [json](json/sriov-network-device-plugin-3.11.0.json) |
| telegraf | 1.38.4 | 99 | [md](md/telegraf-1.38.4.md) · [json](json/telegraf-1.38.4.json) |
| tkg.vsphere.vmware.com | 3.7.0 | 16 | [md](md/tkg.vsphere.vmware.com-3.7.0.md) · [json](json/tkg.vsphere.vmware.com-3.7.0.json) |
| vault-injector | 1.7.4 | 24 | [md](md/vault-injector-1.7.4.md) · [json](json/vault-injector-1.7.4.json) |
| velero | 1.18.1 | 69 | [md](md/velero-1.18.1.md) · [json](json/velero-1.18.1.json) |
| velero.vsphere.vmware.com | 1.9.0-embedded | 3 | [md](md/velero.vsphere.vmware.com-1.9.0-embedded.md) · [json](json/velero.vsphere.vmware.com-1.9.0-embedded.json) |
| vsphere-cpi | 1.36.0 | 51 | [md](md/vsphere-cpi-1.36.0.md) · [json](json/vsphere-cpi-1.36.0.json) |
| vsphere-pv-csi | 3.8.0 | 10 | [md](md/vsphere-pv-csi-3.8.0.md) · [json](json/vsphere-pv-csi-3.8.0.json) |
| vsphere-pv-csi-webhook | 3.8.0 | 6 | [md](md/vsphere-pv-csi-webhook-3.8.0.md) · [json](json/vsphere-pv-csi-webhook-3.8.0.json) |
| whereabouts | 0.9.3 | 17 | [md](md/whereabouts-0.9.3.md) · [json](json/whereabouts-0.9.3.json) |
| windows-gmsa-webhook | 0.13.0 | 37 | [md](md/windows-gmsa-webhook-0.13.0.md) · [json](json/windows-gmsa-webhook-0.13.0.json) |

## All available versions

```

ako.kubernetes.vmware.com
    1.13.4+vmware.1-vks.1
    2.1.2+vmware.1-vks.1
    2.1.3+vmware.1-vks.1
    2.2.1+vmware.1-vks.1

antrea.tanzu.vmware.com
    1.5.3+tkg.2-zshippable
    1.7.2+vmware.1-tkg.1-advanced
    1.9.0+vmware.2-tkg.1-advanced-vmware
    1.11.1+vmware.4-tkg.1-advanced
    1.11.3+vmware.2-tkg.2-advanced
    1.13.3+vmware.3-tkg.1-vmware
    1.13.3+vmware.3-tkg.2-vmware
    1.13.3+vmware.3-tkg.3-vmware
    1.15.1+vmware.1-tkg.1-vmware
    2.1.0+vmware.3-tkg.1
    2.1.1+vmware.1-tkg.1
    2.1.2+vmware.1-tkg.1
    2.2.0+vmware.2-tkg.1
    2.2.2+vmware.1-tkg.1
    2.3.0+vmware.1-tkg.1
    2.3.1+vmware.1-tkg.1
    2.3.2+vmware.1-tkg.1
    2.3.2+vmware.2-tkg.1
    2.4.2+vmware.1-tkg.1
    2.4.4+vmware.1-tkg.1
    2.4.4+vmware.2-tkg.1
    2.4.5+vmware.1-tkg.1
    2.5.1+vmware.1-tkg.1
    2.5.1+vmware.2-tkg.1
    2.5.2+vmware.2-tkg.1
    2.6.1+vmware.1-tkg.1
    2.6.2+vmware.1-tkg.1

argocd-service.vsphere.vmware.com
    1.1.0-25100889

auto-attach.vksm.broadcom.com
    0.2.0

calico.tanzu.vmware.com
    3.22.1+vmware.1-tkg.2-zshippable
    3.24.1+vmware.1-tkg.1
    3.24.1+vmware.1-tkg.2-vmware
    3.25.1+vmware.2-tkg.1
    3.25.1+vmware.2-tkg.2-vmware
    3.26.3+vmware.1-tkg.1-vmware
    3.27.3+vmware.1-tkg.1-vmware
    3.27.3+vmware.1-tkg.2-vmware
    3.27.3+vmware.2-tkg.1-vmware
    3.27.5+vmware.2-tkg.1-vmware
    3.28.1+vmware.2-tkg.1
    3.28.3+vmware.1-tkg.1
    3.28.5+vmware.2-fips-tkg.1
    3.29.1+vmware.2-fips-tkg.1
    3.29.2+vmware.2-fips-tkg.1
    3.29.6+vmware.4-fips-tkg.1
    3.30.0+vmware.2-fips-tkg.1
    3.30.2+vmware.3-fips-tkg.1
    3.30.3+vmware.8-fips-tkg.1
    3.30.5+vmware.3-fips-tkg.1
    3.30.6+vmware.1-fips-tkg.1
    3.30.6+vmware.3-fips-tkg.1
    3.30.6+vmware.4-fips-tkg.1
    3.31.5+vmware.1-fips-tkg.1
    3.31.5+vmware.3-fips-tkg.1

capabilities.tanzu.vmware.com
    0.28.0+vmware.2
    0.28.0-dev-19-g0e3cb04b+vmware.1
    0.29.0+vmware.1
    0.30.0+vmware.1
    0.32.1+vmware.1
    0.33.1+vmware.1

cci-ns.vmware.com
    9.1.0-embedded+739b5075

cert-manager.kubernetes.vmware.com
    1.18.2+vmware.2-vks.2
    1.18.3+vmware.1-vks.1
    1.19.1+vmware.1-vks.1
    1.19.2+vmware.1-vks.1
    1.19.4+vmware.2-vks.1
    1.20.2+vmware.1-vks.1

cilium.kubernetes.vmware.com
    1.19.4+vmware.1-vks.1

cluster-autoscaler.kubernetes.vmware.com
    1.31.3+vmware.1-vks.1
    1.32.2+vmware.1-vks.1
    1.33.0+vmware.2-vks.1
    1.33.0+vmware.3-vks.1
    1.34.0+vmware.1-vks.1
    1.34.2+vmware.1-vks.1
    1.34.2+vmware.2-vks.1
    1.35.0+vmware.1-vks.1
    1.35.0+vmware.3-vks.1
    1.36.0+vmware.1-vks.1

configuration.vsphere.vmware.com
    9.1.0-25233277

contour.kubernetes.vmware.com
    1.32.0+vmware.1-vks.1
    1.33.0+vmware.1-vks.1
    1.33.0+vmware.2-vks.1
    1.33.1+vmware.1-vks.1
    1.33.4+vmware.1-vks.1

csi-proxy.tanzu.vmware.com
    1.1.3+vmware.1-tkg.1
    1.1.3+vmware.2-tkg.2
    1.1.3+vmware.2-tkg.3

dr-operator.vmware.com
    9.1.0-25369307

external-dns.kubernetes.vmware.com
    0.18.0+vmware.1-vks.1
    0.18.0+vmware.2-vks.1
    0.20.0+vmware.1-vks.1
    0.21.0+vmware.1-vks.1

fluent-bit.kubernetes.vmware.com
    4.0.8+vmware.1-vks.1
    4.0.8+vmware.2-vks.1
    4.1.1+vmware.1-vks.1
    4.2.2+vmware.1-vks.1
    5.0.5+vmware.1-vks.1

gatekeeper.kubernetes.vmware.com
    3.22.2+vmware.1-vks.1

gateway-api.tanzu.vmware.com
    0.8.1+vmware.1-tkg.1-vmware
    1.0.0+vmware.1-tkg.1-vmware
    1.0.0+vmware.1-tkg.2-vmware
    1.0.0+vmware.1-tkg.3-vmware
    1.0.0+vmware.1-tkg.4-vmware
    1.2.1+vmware.2-tkg.1
    1.2.1+vmware.6-tkg.1
    1.2.1+vmware.8-tkg.1
    1.3.0+vmware.3-tkg.1
    1.3.0+vmware.6-tkg.1
    1.3.0+vmware.7-tkg.1
    1.4.0+vmware.2-tkg.1
    1.4.0+vmware.4-tkg.1
    1.5.1+vmware.1-tkg.1
    1.5.1+vmware.4-tkg.1

guest-cluster-auth-service.tanzu.vmware.com
    1.0.0+tkg.2-zshippable
    1.1.0+tkg.1
    1.3.0+tkg.1-vmware
    1.3.0+tkg.2-vmware
    1.3.0+tkg.4-vmware
    1.3.3+tkg.1-vmware
    1.3.3+tkg.2-vmware
    1.3.3+tkg.3-vmware
    1.4.0+vmware.1-tkg.1
    1.4.1+vmware.1-tkg.1
    1.4.2+vmware.1-tkg.1
    1.4.3+vmware.1-tkg.1
    1.4.4+vmware.1-tkg.1
    1.4.5+vmware.1-tkg.1
    1.4.6+vmware.1-tkg.1
    1.4.7+vmware.1-tkg.1
    1.4.8+vmware.1-tkg.1

harbor.kubernetes.vmware.com
    2.13.4+vmware.1-vks.1
    2.14.0+vmware.1-vks.1
    2.14.1+vmware.1-vks.1
    2.14.2+vmware.1-vks.1
    2.14.4+vmware.1-vks.1
    2.15.1+vmware.1-vks.1

harbor.tanzu.vmware.com
    2.14.2+vmware.2-vks.1

headlamp.kubernetes.vmware.com
    0.42.0+vmware.1-vks.1

helm-controller.kubernetes.vmware.com
    1.5.4+v4.01.04-vmware.1-vks.1

istio.kubernetes.vmware.com
    1.27.1+vmware.1-vks.1
    1.27.4+vmware.1-vks.1
    1.27.5+vmware.1-vks.1
    1.28.2+vmware.1-vks.1
    1.28.7+vmware.1-vks.1
    1.30.0+vmware.1-vks.1

kapp-controller.tanzu.vmware.com
    0.41.2+vmware.1-tkg.1-zshippable
    0.41.5+vmware.1-tkg.1
    0.41.7+vmware.1-tkg.1-vmware
    0.45.2+vmware.1-tkg.1
    0.45.2+vmware.1-tkg.3-vmware
    0.48.2+vmware.1-tkg.1-vmware
    0.48.2+vmware.2-tkg.1-vmware
    0.50.0+vmware.1-tkg.1-vmware
    0.50.0+vmware.1-tkg.2-vmware
    0.50.0+vmware.1-tkg.3-vmware
    0.50.0+vmware.2-tkg.1-vmware
    0.53.0+vmware.7-tkg.2
    0.53.0+vmware.8-tkg.3
    0.55.0+vmware.1-fips-tkg.1
    0.56.1+vmware.8-fips-tkg.1
    0.56.1+vmware.9-fips-tkg.3
    0.58.0+vmware.9-fips-tkg.2
    0.59.0+vmware.1-fips-tkg.1
    0.59.1+vmware.4-fips-tkg.1
    0.59.1+vmware.5-fips-tkg.1
    0.59.8+vmware.1-fips-tkg.1
    0.60.4+vmware.3-fips-tkg.1

kube-state-metrics.vsphere.vmware.com
    2.14.0-25195109

metrics-aggregator.vmware.com
    0.1.0

metrics-server.tanzu.vmware.com
    0.6.1+vmware.1-tkg.3-zshippable
    0.6.2+vmware.1-tkg.1
    0.6.2+vmware.1-tkg.2-vmware
    0.6.2+vmware.1-tkg.3-vmware
    0.6.2+vmware.1-tkg.5-vmware
    0.6.2+vmware.3-tkg.5-vmware
    0.6.2+vmware.3-tkg.6-vmware
    0.6.2+vmware.3-tkg.7-vmware
    0.7.1+vmware.3-tkg.1
    0.7.1+vmware.5-tkg.2
    0.7.2+vmware.5-tkg.1
    0.7.2+vmware.5-tkg.2
    0.7.2+vmware.7-fips-tkg.1
    0.8.0+vmware.4-fips-tkg.1
    0.8.0+vmware.6-fips-tkg.1
    0.8.1+vmware.1-fips-tkg.1
    0.8.1+vmware.3-fips-tkg.1

multus-cni.kubernetes.vmware.com
    4.2.4+vmware.1-vks.1

nfs-client.kubernetes.vmware.com
    4.13.2+vmware.1-vks.1

pinniped.tanzu.vmware.com
    0.12.1+vmware.2-tkg.2-zshippable
    0.12.1+vmware.3-tkg.3
    0.12.1+vmware.3-tkg.4-vmware
    0.24.0+vmware.1-tkg.1
    0.24.0+vmware.1-tkg.2-vmware
    0.25.0+vmware.2-tkg.1-vmware
    0.25.0+vmware.2-tkg.2-vmware
    0.25.0+vmware.2-tkg.3-vmware
    0.32.0+vmware.1-tkg.1
    0.35.0+vmware.1-tkg.1
    0.39.0+vmware.1-tkg.1
    0.39.0+vmware.2-tkg.1
    0.39.0+vmware.2-tkg.2
    0.39.0+vmware.3-tkg.1
    0.40.0+vmware.4-tkg.1
    0.41.0+vmware.6-tkg.1
    0.42.0+vmware.4-tkg.1
    0.46.0+vmware.1-tkg.1
    0.46.0+vmware.8-tkg.2

prometheus.kubernetes.vmware.com
    3.5.0+vmware.1-vks.2
    3.5.0+vmware.2-vks.1
    3.5.0+vmware.3-vks.1
    3.5.3+vmware.1-vks.1

secretgen-controller.tanzu.vmware.com
    0.11.0+vmware.2-tkg.1-zshippable
    0.11.2+vmware.1-tkg.1
    0.11.2+vmware.1-tkg.3-vmware
    0.14.2+vmware.2-tkg.2
    0.14.2+vmware.2-tkg.3-vmware
    0.15.0+vmware.1-tkg.1-vmware
    0.16.1+vmware.1-tkg.1-vmware
    0.16.1+vmware.1-tkg.2-vmware
    0.18.0+vmware.3-tkg.3
    0.18.1+vmware.3-fips-tkg.1
    0.19.1+vmware.2-fips-tkg.1
    0.19.2+vmware.7-fips-tkg.1
    0.19.2+vmware.8-fips-tkg.1
    0.20.0+vmware.1-fips-tkg.1
    0.20.1+vmware.1-fips-tkg.1
    0.20.1+vmware.3-fips-tkg.1
    0.21.1+vmware.4-fips-tkg.1

secret-store.vsphere.vmware.com
    9.0.0+c3eabdc
    9.2.0-25594770
    9.2.0-25650518

sriov-network-device-plugin.kubernetes.vmware.com
    3.10.0+vmware.1-vks.1
    3.10.0+vmware.3-vks.1
    3.11.0+vmware.1-vks.1
    3.11.0+vmware.3-vks.1

telegraf.kubernetes.vmware.com
    1.35.4+vmware.1-vks.1
    1.35.4+vmware.2-vks.1
    1.36.4+vmware.1-vks.1
    1.37.1+vmware.1-vks.1
    1.38.4+vmware.1-vks.1

tkg.vsphere.vmware.com
    3.6.1-embedded+v1.35
    3.6.2+v1.35
    3.6.3+v1.35
    3.7.0+v1.36

vault-injector.kubernetes.vmware.com
    1.6.2+vmware.1-vks.1
    1.7.4+vmware.1-vks.1

velero.kubernetes.vmware.com
    1.16.2+vmware.2-vks.1
    1.16.2+vmware.3-vks.1
    1.17.0+vmware.1-vks.1
    1.17.1+vmware.1-vks.1
    1.17.2+vmware.1-vks.1
    1.17.2+vmware.3-vks.1
    1.18.1+vmware.1-vks.1

velero.vsphere.vmware.com
    1.9.0-embedded+25369333

vsphere-cpi.tanzu.vmware.com
    1.23.1+vmware.1-tkg.2-zshippable
    1.23.3+vmware.1-tkg.1
    1.24.3+vmware.1-tkg.1
    1.25.1+vmware.2-tkg.2-vmware
    1.26.2+vmware.1-tkg.1
    1.26.2+vmware.1-tkg.3-vmware
    1.27.0+vmware.1-tkg.2-vmware
    1.28.0+vmware.1-tkg.1-vmware
    1.28.0+vmware.1-tkg.2-vmware
    1.29.0+vmware.1-tkg.1-vmware
    1.29.0+vmware.1-tkg.2-vmware
    1.30.1+vmware.1-tkg.1-vmware
    1.30.1+vmware.1-tkg.2-vmware
    1.31.0+vmware.1-tkg.1
    1.31.1+vmware.1-tkg.1
    1.32.2+vmware.1-tkg.1
    1.33.0+vmware.1-tkg.1
    1.33.0+vmware.2-tkg.1
    1.34.0+vmware.1-tkg.1
    1.34.0+vmware.2-tkg.1
    1.34.0+vmware.3-tkg.1
    1.35.0+vmware.1-tkg.1
    1.35.1+vmware.1-tkg.1
    1.35.1+vmware.2-tkg.1
    1.36.0+vmware.1-tkg.1
    1.36.0+vmware.2-tkg.1

vsphere-pv-csi-webhook.kubernetes.vmware.com
    3.6.0+vmware.1-vks.1
    3.6.0+vmware.2-vks.1
    3.7.0+vmware.1-vks.1
    3.8.0+vmware.1-vks.1

vsphere-pv-csi.tanzu.vmware.com
    2.6.0+vmware.1-tkg.1-zshippable
    2.6.0+vmware.2-tkg.1
    2.6.1+vmware.1-tkg.1
    2.7.1+vmware.1-tkg.2-vmware
    3.1.0+vmware.1-tkg.1
    3.1.0+vmware.1-tkg.2-vmware
    3.1.0+vmware.1-tkg.3-vmware
    3.1.0+vmware.1-tkg.6-vmware
    3.2.0+vmware.1-tkg.2-vmware
    3.3.0+vmware.1-tkg.3-vmware
    3.3.1+vmware.1-tkg.2
    3.3.2+vmware.1-tkg.1
    3.3.2+vmware.2-tkg.1
    3.4.0+vmware.1-tkg.1
    3.4.0+vmware.2-tkg.1
    3.5.0+vmware.1-tkg.1
    3.5.0+vmware.2-tkg.1
    3.5.0+vmware.4-tkg.1
    3.6.0+vmware.1-tkg.1
    3.6.0+vmware.2-tkg.1
    3.6.0+vmware.3-tkg.1
    3.6.0+vmware.5-tkg.1
    3.7.0+vmware.1-tkg.1
    3.7.0+vmware.2-tkg.1
    3.7.0+vmware.4-tkg.1
    3.8.0+vmware.2-tkg.1
    3.8.0+vmware.3-tkg.1

whereabouts.kubernetes.vmware.com
    0.9.3+vmware.1-vks.1

windows-gmsa-webhook.kubernetes.vmware.com
    0.13.0+vmware.3-vks.1
    0.13.0+vmware.4-vks.1
    0.13.0+vmware.5-vks.1
    0.13.0+vmware.7-vks.1
```
