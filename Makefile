# se-vks-platform
#
# Two API endpoints are involved. Supervisor targets apply to the Supervisor;
# the workloads target applies to the guest cluster. Separate kubeconfig
# contexts, separate API servers.
SUP     ?= wld-sup
NS      ?= se-namespace
CLUSTER ?= se-cluster-01
ISTIO_VER ?= 1.28
# kubectl vsphere login names the workload context after the cluster itself,
# not <supervisor>:<cluster>. Override with WL=... if yours differs.
WL      ?= $(CLUSTER)

NSDIR := namespaces/$(NS)
CLDIR := $(NSDIR)/clusters/$(CLUSTER)

.PHONY: help
help:
	@grep -hE '^[a-z-]+:.*?## ' $(MAKEFILE_LIST) | awk -F':.*## ' '{printf "  %-12s %s\n", $$1, $$2}'

.PHONY: services
services: ## 0. Supervisor services (supervisor-wide, once)
	kubectl --context=$(SUP) apply -f supervisor-services/

.PHONY: namespace
namespace: ## 1. How to create the namespace (vCenter, not a manifest)
	@echo "A vSphere Namespace is created in vCenter, not by kubectl."
	@echo "On this Supervisor a manifest apply is rejected:"
	@echo "  'User is not authorized to create selfservice namespaces'"
	@echo
	@echo "Workload Management > Namespaces > Create Namespace"
	@echo "  name     : $(NS)"
	@echo "  storage  : add the storage policy the cluster references"
	@echo "  VM class : add the VM class the cluster references"
	@echo "  perms    : grant your SSO user/group edit access"
	@echo
	@echo "Then run: make preflight"
	@echo
	@echo "-- does it exist yet? --"
	@kubectl --context=$(SUP) get ns $(NS) 2>/dev/null || echo "   not created"

.PHONY: namespace-selfservice
namespace-selfservice: ## 1-alt. Apply the namespace manifest (only if self-service is enabled)
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
addons: ## 3. Add-ons -> Supervisor (flat files only; istio is versioned, see below)
	kubectl --context=$(SUP) apply -f $(CLDIR)/addons/

.PHONY: istio
istio: ## 3b. Istio at ISTIO_VER (default 1.28) -> Supervisor
	kubectl --context=$(SUP) apply -f $(CLDIR)/addons/istio/$(ISTIO_VER)/addon.yaml

.PHONY: overlays
overlays: ## 3c. Deliver ytt overlays -> WORKLOAD cluster PackageInstalls
	@./apply-overlays.sh

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
