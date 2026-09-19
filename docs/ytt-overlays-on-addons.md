# Patching a VKS addon with a ytt overlay

Reference for modifying an addon beyond what its `AddonConfig` values expose —
for example injecting environment variables into istiod, which the Istio addon
has no option for.

**Read the caveats at the end before using this.** It works, but it is cluster-only
state that git never sees, and a mistake silently wedges the addon's
reconciliation.

## Where things live

The addon chain ends in a `PackageInstall` on the **workload cluster**:

```
Supervisor                          Workload cluster
  AddonConfig   (your values)  -->    PackageInstall  vmware-system-tkg/se-cluster-01-istio
  AddonInstall  (targeting)             +-- values from Secret  se-cluster-01-istio-values
                                        +-- overlay from Secret <-- you add this
```

The overlay Secret must be in the **same namespace as the PackageInstall**,
i.e. `vmware-system-tkg` on the workload cluster — not on the Supervisor, and
not in `istio-system`.

The Istio package templates with `ytt` then `kbld`, and its ytt step reads
`config/`. Your overlay is appended to that ytt invocation, so standard
`@ytt:overlay` matchers apply to the package's rendered output.

```
fetch:    imgpkgBundle
template: ytt (paths: ["config/"]) -> kbld
deploy:   kapp
```

## Steps

### 1. Write the overlay

Each key in the Secret becomes a file ytt reads. Example patching istiod's
environment — **syntax illustration, not a tested configuration**:

```yaml
# istiod-ca.yml
#@ load("@ytt:overlay", "overlay")

#@overlay/match by=overlay.subset({"kind":"Deployment","metadata":{"name":"istiod"}})
---
spec:
  template:
    spec:
      containers:
      #@overlay/match by=overlay.subset({"name":"discovery"})
      - name: discovery
        #@overlay/match missing_ok=True
        env:
        #@overlay/append
        - name: ENABLE_CA_SERVER
          value: "false"
```

`#@overlay/match` selects the object, `#@overlay/append` adds to a list, and
`missing_ok=True` allows creating a field that is not already present. Getting a
matcher wrong is the usual cause of a failed render.

### 2. Create the Secret on the workload cluster

```sh
kubectl -n vmware-system-tkg create secret generic istio-ca-overlay \
  --from-file=istiod-ca.yml=./istiod-ca.yml
```

### 3. Annotate the PackageInstall

```sh
kubectl -n vmware-system-tkg annotate packageinstall se-cluster-01-istio \
  ext.packaging.carvel.dev/ytt-paths-from-secret-name.0=istio-ca-overlay --overwrite
```

The trailing `.0` is an index — add `.1`, `.2` for further overlay Secrets.

### 4. Watch the reconcile

```sh
kubectl -n vmware-system-tkg get packageinstall se-cluster-01-istio \
  -o jsonpath='{.status.friendlyDescription}{"\n"}'
kubectl -n vmware-system-tkg get packageinstall se-cluster-01-istio \
  -o jsonpath='{.status.usefulErrorMessage}{"\n"}'
```

`usefulErrorMessage` is where render failures surface.

### 5. Remove it

```sh
kubectl -n vmware-system-tkg annotate packageinstall se-cluster-01-istio \
  ext.packaging.carvel.dev/ytt-paths-from-secret-name.0-
kubectl -n vmware-system-tkg delete secret istio-ca-overlay
```

Reconciliation recovers on the next cycle.

## Verified on this cluster

Tested 2026-09-19 on `se-cluster-01`, Istio addon 1.30.0:

- kapp-controller **does** honour the annotation on an addon-generated
  PackageInstall. Pointing it at a non-existent Secret produced
  `Reconcile failed: secrets "istio-ca-overlay-test" not found`, which proves the
  hook is live rather than ignored.
- Removing the annotation recovered reconciliation within one cycle.

## Caveats

**There is no declarative path.** `AddonInstall.spec` has exactly seven fields —
`addonConfigNameTemplate`, `addonRef`, `clusters`, `crossNamespaceSelection`,
`paused`, `releaseFilter`, `stopMatchingBehavior`. None carries annotations or
overlays. The annotation can only be applied directly to the generated
PackageInstall, so it lives outside git.

**It may not survive.** The PackageInstall is created by the VKS addon
controller and has no ownerReferences and no managedFields, meaning field
management is stripped. Whether an addon **upgrade** re-pushes it and drops the
annotation was not tested. Assume it needs reapplying after any addon version
change or cluster rebuild.

**Failures are quiet.** A bad reference does not surface as an addon error in an
obvious place; the ClusterAddon keeps reporting, while the PackageInstall sits
failed. During testing this masked an unrelated config change for roughly twenty
minutes, and the symptom was simply that a value never took effect.

**Prefer a supported route where one exists.** For the Istio CA specifically, no
overlay is needed: istiod reads a plug-in CA from a Secret named `cacerts` in
`istio-system`, which cert-manager can issue and rotate. That is fully
declarative through `AddonConfig`. See `../namespaces/se-namespace/clusters/se-cluster-01/addons/cert-manager.yaml`.
