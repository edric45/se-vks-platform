# Overlays for the Istio addon

Files here are delivered to the Istio package through kapp-controller's
`ext.packaging.carvel.dev/ytt-paths-from-secret-name` annotation. They are added
to ytt's input set when the package renders.

## Two modes, one mechanism

**Adding a new object** — a plain Kubernetes manifest, no ytt syntax. ytt emits
every non-annotated YAML document in its inputs, so the object is appended to
the package output and kapp then owns it.

That is what `waypoint-defaults.yml` does.

**Patching an existing object** — needs real overlay syntax:

```yaml
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
        - name: SOME_VAR
          value: "value"
```

Only objects the package actually renders can be patched. The waypoint
Deployment cannot: istiod generates it at runtime when a Gateway is created, it
carries no `kapp.k14s.io/app` label, and it is never in the package. That is why
`waypoint-defaults.yml` adds a ConfigMap for istiod to read instead of trying to
patch the Deployment.

## Applying

```sh
kubectl --context=se-cluster-01 -n vmware-system-tkg create secret generic \
  istio-waypoint-defaults-overlay \
  --from-file=waypoint-defaults.yml=./waypoint-defaults.yml \
  --dry-run=client -o yaml | kubectl --context=se-cluster-01 apply -f -

kubectl --context=se-cluster-01 -n vmware-system-tkg annotate packageinstall se-cluster-01-istio \
  ext.packaging.carvel.dev/ytt-paths-from-secret-name.0=istio-waypoint-defaults-overlay --overwrite
```

Add further overlay Secrets as `.1`, `.2`, and so on.

## Verifying

```sh
kubectl -n vmware-system-tkg get packageinstall se-cluster-01-istio \
  -o jsonpath='{.status.friendlyDescription}{"\n"}{.status.usefulErrorMessage}{"\n"}'

# the injected object should carry the package's kapp app label
kubectl -n istio-system get cm istio-waypoint-defaults -o jsonpath='{.metadata.labels}'
```

## Removing

```sh
kubectl -n vmware-system-tkg annotate packageinstall se-cluster-01-istio \
  ext.packaging.carvel.dev/ytt-paths-from-secret-name.0-
kubectl -n vmware-system-tkg delete secret istio-waypoint-defaults-overlay
```

## Caveat

The **annotation** lives only on the cluster. `AddonInstall` has no field that
carries it, so it is not in git and must be reapplied after an addon upgrade or
a cluster rebuild. The object the overlay produces *is* kapp-managed, but the
wiring that produces it is not.
