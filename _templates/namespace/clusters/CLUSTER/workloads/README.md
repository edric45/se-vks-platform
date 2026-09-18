# Workloads  ->  applied to the WORKLOAD CLUSTER

Everything in this directory targets the guest cluster, **not** the Supervisor.
Different kubeconfig context, different API server.

```sh
kubectl vsphere login --server=<sup-vip> --vsphere-username=<user> \
  --tanzu-kubernetes-cluster-namespace=<ns> \
  --tanzu-kubernetes-cluster-name=<cluster> --insecure-skip-tls-verify

kubectl --context=<cluster> apply -R -f .
```

One directory per application. Number files so `apply -f` ordering is correct:
namespace first, then config, then workload, then anything that exposes it.

Note that the session token from `kubectl vsphere login` lasts 10 hours, so
expect to re-login between working sessions.
