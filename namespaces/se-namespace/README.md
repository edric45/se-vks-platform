# Namespace: se-namespace

## What is in git, and what is not

| | Where |
|---|---|
| The namespace object | `00-namespace.yaml`, applied to the Supervisor |
| Storage policy binding | **vCenter only.** Workload Management > Namespaces > *(ns)* > Storage |
| VM class binding | **vCenter only.** Same screen, VM Service > VM Classes |
| Resource limits | **vCenter only**, unless you add a ResourceQuota here |
| RBAC / permissions | **vCenter only.** Namespace > Permissions |

This split is the single most important thing to understand about this repo. A
vSphere Namespace is a vCenter construct. The Supervisor API will happily create
the namespace object from `00-namespace.yaml`, but the storage and VM class
bindings that a Cluster depends on are attached in vCenter and cannot be
expressed as manifests.

## Before applying a Cluster

Confirm the namespace actually has what the Cluster references:

```sh
kubectl --context=wld-sup -n se-namespace get virtualmachineclass       # must be non-empty
kubectl --context=wld-sup -n se-namespace get storageclass              # must include the one the Cluster names
```

The Cluster's `vmClass` and `storageClass` topology variables must match names
that appear in those two lists. A mismatch leaves the Cluster stuck in
provisioning with no obvious error.
