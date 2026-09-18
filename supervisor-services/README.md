# Supervisor services  ->  applied to the SUPERVISOR

Supervisor-wide, installed once, not per-namespace. Each appears as its own
`svc-*` namespace on the Supervisor once installed.

```sh
kubectl --context=<sup> get supervisorservices
kubectl --context=<sup> get supervisorservicedefinitions
```

Add one YAML per service here. These are `appplatform.wcp.vmware.com/v1alpha2`
`SupervisorService` objects.

Note that many supervisor services are installed through the vCenter UI
(Workload Management > Services) rather than by manifest. Where that is the
case, record the service and its version in a markdown note here rather than
leaving the directory misleadingly empty.
