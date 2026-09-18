# Add-ons  ->  applied to the SUPERVISOR

Each add-on is a pair: an `AddonConfig` holding the values, and an
`AddonInstall` selecting the target cluster and pinning the release.

Both live in the **vSphere Namespace**, not on the workload cluster.

```sh
kubectl --context=wld-sup apply -f .
kubectl --context=wld-sup -n se-namespace get clusteraddon
```

Two fields on `AddonConfig` are controller-owned and must be omitted:
`addonConfigDefinitionRef` and `clusterName`. The controller fills them in from
the `AddonInstall`. Setting them yourself produces a warning and they are
cleared.

To find available add-ons and their exact release names:

```sh
kubectl --context=wld-sup -n vmware-system-vks-public get addonreleases
```

`stopMatchingBehavior: Delete` means deleting the AddonInstall **uninstalls**
the add-on from the cluster.
