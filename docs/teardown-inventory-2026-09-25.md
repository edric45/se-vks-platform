# Teardown inventory — se-cluster-01, 2026-09-25

Captured immediately before `kubectl delete cluster se-cluster-01`, so the
ArgoCD rebuild can be compared against it.

## Supervisor side (se-namespace)
```
NAME                                     CLUSTERCLASS             AVAILABLE   CP DESIRED   CP AVAILABLE   CP UP-TO-DATE   W DESIRED   W AVAILABLE   W UP-TO-DATE   PHASE         AGE     VERSION
cluster.cluster.x-k8s.io/se-cluster-01   builtin-generic-v3.7.0   True        1            1              1               2           2             2              Provisioned   7d10h   v1.35.6+vmware.2

NAME                                                                   ADDON          PAUSED   AGE
addoninstall.addons.kubernetes.vmware.com/se-cluster-01-cert-manager   cert-manager            6d20h
addoninstall.addons.kubernetes.vmware.com/se-cluster-01-headlamp       headlamp                6d2h
addoninstall.addons.kubernetes.vmware.com/se-cluster-01-istio          istio                   5d10h
```

### AddonConfigs — note only 3 of 11 are ours
The other 8 are driven by platform-owned AddonInstalls outside this namespace
(cni-addon-antrea-*, vcfops-prometheus-addoninstall, vault-injector-global-installer,
builtin-helm-controller-addoninstall, vks-static-*-install, carvel-repo, depot).
Do NOT `delete addonconfig --all` — that would take out the CNI.
```
NAME                                  ADDONCONFIGDEFINITION                                                   CLUSTER         READY   AGE
se-cluster-01-antrea                  antrea.tanzu.vmware.com.2.5.2---vmware.2-tkg.1                          se-cluster-01   True    7d10h
se-cluster-01-carvel-repo             carvel-repo-1.0.0                                                       se-cluster-01   True    7d10h
se-cluster-01-cert-manager            cert-manager.kubernetes.vmware.com.1.20.2---vmware.1-vks.1              se-cluster-01   True    6d20h
se-cluster-01-depot.kube-system.svc   depot.kube-system.svc-1.0.0                                             se-cluster-01   True    7d10h
se-cluster-01-headlamp                headlamp.kubernetes.vmware.com.0.42.0---vmware.1-vks.1                  se-cluster-01   True    6d2h
se-cluster-01-helm-controller         helm-controller.kubernetes.vmware.com.1.5.4---v4.01.04-vmware.1-vks.1   se-cluster-01   True    7d10h
se-cluster-01-istio                   istio.kubernetes.vmware.com.1.28.2---vmware.1-vks.1                     se-cluster-01   True    5d10h
se-cluster-01-prometheus              prometheus.kubernetes.vmware.com.3.5.3---vmware.1-vks.1                 se-cluster-01   True    7d10h
se-cluster-01-telegraf                telegraf.kubernetes.vmware.com.1.38.4---vmware.1-vks.1                  se-cluster-01   True    7d10h
se-cluster-01-vault-injector          vault-injector.kubernetes.vmware.com.1.7.4---vmware.1-vks.1             se-cluster-01   True    7d10h
se-cluster-01-vks-static-resources    vks-static-v1.35.6---vmware.2-vkr.3-def                                 se-cluster-01   True    7d10h
```

## Workload cluster
```
### namespaces
NAME                                 STATUS   AGE
cert-manager                         Active   6d19h
default                              Active   7d10h
flow-aggregator                      Active   7d10h
headlamp                             Active   6d2h
istio-system                         Active   5d10h
kube-node-lease                      Active   7d10h
kube-public                          Active   7d10h
kube-system                          Active   7d10h
l4demo                               Active   3d2h
pinniped-concierge                   Active   7d10h
secretgen-controller                 Active   7d10h
tanzu-system-monitoring              Active   7d10h
tanzu-system-telegraf                Active   7d10h
tkg-system                           Active   7d10h
velero-vsphere-plugin-backupdriver   Active   7d10h
vks-vault-injector                   Active   7d10h
vmware-system-antrea                 Active   7d10h
vmware-system-auth                   Active   7d10h
vmware-system-cloud-provider         Active   7d10h
vmware-system-csi                    Active   7d10h
vmware-system-helm                   Active   7d10h
vmware-system-tkg                    Active   7d10h

### PVCs  <-- the one that can block teardown
NAMESPACE                 NAME                STATUS   VOLUME                                     CAPACITY   ACCESS MODES   STORAGECLASS                              VOLUMEATTRIBUTESCLASS   AGE
tanzu-system-monitoring   alertmanager        Bound    pvc-7f91eea0-30c5-4b2f-bd43-d36b292ef487   2Gi        RWO            vsan-default-storage-policy-latebinding   <unset>                 7d10h
tanzu-system-monitoring   prometheus-server   Bound    pvc-0e80b4e3-faae-44b6-9f37-47b357e135e5   150Gi      RWO            vsan-default-storage-policy-latebinding   <unset>                 7d10h

### LoadBalancer services
NAMESPACE   NAME       TYPE           CLUSTER-IP      EXTERNAL-IP    PORT(S)         AGE
headlamp    headlamp   LoadBalancer   10.99.209.212   172.17.10.26   443:32321/TCP   6d2h

### nodes
NAME                                                 STATUS   ROLES           AGE    VERSION            INTERNAL-IP   EXTERNAL-IP   OS-IMAGE                 KERNEL-VERSION   CONTAINER-RUNTIME
se-cluster-01-se-cluster-01-np01-cjpf6-sqm4q-fj2sd   Ready    <none>          7d1h   v1.35.6+vmware.2   172.30.0.6    <none>        VMware Photon OS/Linux   6.1.176-4.ph5    containerd://2.2.5+vmware.3-fips
se-cluster-01-se-cluster-01-np01-cjpf6-sqm4q-lbdb8   Ready    <none>          7d1h   v1.35.6+vmware.2   172.30.0.7    <none>        VMware Photon OS/Linux   6.1.176-4.ph5    containerd://2.2.5+vmware.3-fips
se-cluster-01-tvd2q-jkzcg                            Ready    control-plane   7d1h   v1.35.6+vmware.2   172.30.0.5    <none>        VMware Photon OS/Linux   6.1.176-4.ph5    containerd://2.2.5+vmware.3-fips
```
