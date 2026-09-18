# se-vks-platform
#
# Two API endpoints are involved. Supervisor targets apply to the Supervisor;
# the workloads target applies to the guest cluster. Separate kubeconfig
# contexts, separate API servers.
SUP     ?= wld-sup
NS      ?= se-namespace
CLUSTER ?= se-cluster-01
WL      ?= $(SUP):$(CLUSTER)

NSDIR := namespaces/$(NS)
CLDIR := $(NSDIR)/clusters/$(CLUSTER)

.PHONY: help
help:
	@grep -hE '^[a-z-]+:.*?## ' $(MAKEFILE_LIST) | awk -F':.*## ' '{printf "  %-12s %s\n", $$1, $$2}'

.PHONY: services
services: ## 0. Supervisor services (supervisor-wide, once)
	kubectl --context=$(SUP) apply -f supervisor-services/

.PHONY: namespace
namespace: ## 1. vSphere Namespace -> Supervisor
	kubectl --context=$(SUP) apply -f $(NSDIR)/00-namespace.yaml

.PHONY: preflight
preflight: ## 1b. Verify vCenter bound a VM class + storage policy
	@echo "-- VM classes in $(NS) (must be non-empty) --"
	@kubectl --context=$(SUP) -n $(NS) get virtualmachineclass 2>/dev/null || echo "   NONE - bind one in vCenter first"
	@echo "-- storage classes in $(NS) --"
	@kubectl --context=$(SUP) -n $(NS) get storageclass 2>/dev/null || echo "   NONE - bind a storage policy in vCenter first"
	@echo "-- names the cluster expects --"
	@grep -E 'value: (best-effort|vsan)' $(CLDIR)/00-cluster.yaml | sed 's/^/   /'

.PHONY: cluster
cluster: ## 2. Cluster -> Supervisor
	kubectl --context=$(SUP) apply -f $(CLDIR)/00-cluster.yaml

.PHONY: addons
addons: ## 3. Add-ons -> Supervisor
	kubectl --context=$(SUP) apply -f $(CLDIR)/addons/

.PHONY: workloads
workloads: ## 4. Applications -> WORKLOAD cluster
	kubectl --context=$(WL) apply -R -f $(CLDIR)/workloads/

.PHONY: status
status: ## Where everything stands
	@echo "-- namespace --"; kubectl --context=$(SUP) get ns $(NS) 2>/dev/null || echo "   not created"
	@echo "-- cluster --";   kubectl --context=$(SUP) -n $(NS) get cluster 2>/dev/null || echo "   none"
	@echo "-- addons --";    kubectl --context=$(SUP) -n $(NS) get clusteraddon 2>/dev/null || echo "   none"

.PHONY: login-wl
login-wl: ## Print the workload-cluster login command
	@echo "kubectl vsphere login --server=<wld-sup-vip> --vsphere-username=<user> \\"
	@echo "  --tanzu-kubernetes-cluster-namespace=$(NS) \\"
	@echo "  --tanzu-kubernetes-cluster-name=$(CLUSTER) --insecure-skip-tls-verify"
