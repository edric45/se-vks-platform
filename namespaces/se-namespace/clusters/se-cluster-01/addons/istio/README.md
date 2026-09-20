# Istio addon, by version

One directory per minor version. Only one should be applied to a cluster at a
time -- the `releaseFilter` in each pins an exact release, so switching versions
means applying a different directory, not editing one in place.

```
istio/
  1.28/
    addon.yaml            AddonConfig + AddonInstall  -> Supervisor
    overlays/             ytt inputs  -> workload cluster PackageInstall
```

Apply with:

```sh
make istio ISTIO_VER=1.28
```

The overlays are NOT applied to the Supervisor. They are delivered to the
workload cluster's PackageInstall via a Secret plus an annotation -- see
../overlays/README.md for the mechanism and its caveats.
