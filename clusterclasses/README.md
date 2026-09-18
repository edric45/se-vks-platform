# Custom ClusterClasses

A custom ClusterClass must live in `vmware-system-vks-public`, not in your
vSphere Namespace, because a ClusterClass can only be referenced from a
namespace that publishes it.

A Cluster then points at it:

```yaml
spec:
  topology:
    classRef:
      name: custom-<name>-v3.6.0
      namespace: vmware-system-vks-public
```

Base a custom class on the newest `builtin-generic-vX.Y.Z` the Supervisor
offers, and keep the version suffix aligned with it so the lineage is obvious.
