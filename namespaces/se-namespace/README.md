# Namespace: se-namespace

## How this namespace is created

**In vCenter, not from a manifest.** Verified on wld-sup 2026-09-18: applying
`00-namespace.yaml` is rejected by the Supervisor admission webhook with
*"User is not authorized to create selfservice namespaces"*. This Supervisor has
no namespace self-service machinery at all.

Create it here instead:

> **Workload Management > Namespaces > Create Namespace**
> - name: `se-namespace`
> - Storage: add `vsan-default-storage-policy`
> - VM Service > VM Classes: add `best-effort-medium`
> - Permissions: grant your SSO user or group edit access

Two misleading signals to ignore:

| Check | Says | Reality |
|---|---|---|
| `kubectl auth can-i create namespaces` | `yes` | RBAC allows it; the vCenter webhook still refuses |
| `kubectl apply --dry-run=server` | `created` | The validating webhook does not reject on dry-run |

Neither is proof. Only a real apply tells you, and here it fails.

## What is in git, and what is not

| | Where |
|---|---|
| The namespace itself | **vCenter only** (see above) |
| Storage policy binding | **vCenter only.** Namespaces > se-namespace > Storage |
| VM class binding | **vCenter only.** Same screen, VM Service > VM Classes |
| Namespace permissions | **vCenter only.** Namespace > Permissions |
| Resource pool limits | **vCenter only** |
| The Cluster in it | `clusters/se-cluster-01/00-cluster.yaml` -- git, applied to Supervisor |
| Add-ons | `clusters/se-cluster-01/addons/` -- git, applied to Supervisor |
| Applications | `clusters/se-cluster-01/workloads/` -- git, applied to workload cluster |

## Before applying the Cluster

`00-cluster.yaml` references `vmClass` and `storageClass` **by name**. If those
are not bound to the namespace in vCenter, the Cluster will not provision and
the failure is not obvious.

```sh
make preflight
```

or by hand:

```sh
kubectl --context=wld-sup -n se-namespace get virtualmachineclass   # must be non-empty
kubectl --context=wld-sup -n se-namespace get storageclass          # must contain the named policy
```
