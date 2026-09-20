#!/bin/sh
# Deliver ytt overlay files to the workload cluster's PackageInstalls.
#
# These cannot be declared in git-applied manifests: AddonInstall has no field
# that carries the annotation, and it does not propagate metadata to the
# generated PackageInstall (tested). So this is the one imperative step, and it
# must be re-run after a cluster rebuild and possibly after an addon upgrade.
#
# Canary that the wiring is still live:
#   kubectl -n <app-ns> get hpa waypoint      # absent => istio overlay was lost
#   kubectl -n headlamp get sa headlamp-debug # absent => headlamp overlay was lost
set -u
WL="${WL:-se-cluster-01}"
ISTIO_VER="${ISTIO_VER:-1.28}"
CLDIR="namespaces/se-namespace/clusters/se-cluster-01"
cd "$(dirname "$0")"

wire() {  # $1=packageinstall  $2=secret name  $3=file
  [ -f "$3" ] || { echo "skip $2: $3 not found"; return 0; }
  kubectl --context="$WL" -n vmware-system-tkg create secret generic "$2" \
    --from-file="$(basename "$3")=$3" --dry-run=client -o yaml \
    | kubectl --context="$WL" apply -f - >/dev/null
  kubectl --context="$WL" -n vmware-system-tkg annotate packageinstall "$1" \
    ext.packaging.carvel.dev/ytt-paths-from-secret-name.0="$2" --overwrite >/dev/null
  echo "wired $2 -> $1"
}

wire se-cluster-01-istio    istio-waypoint-defaults-overlay "$CLDIR/addons/istio/$ISTIO_VER/overlays/waypoint-defaults.yml"
wire se-cluster-01-headlamp headlamp-rbac-overlay           "$CLDIR/addons/overlays/headlamp-rbac.yml"

echo
echo "reconcile takes 2-5 minutes; check with:"
echo "  kubectl -n vmware-system-tkg get packageinstall -o custom-columns=NAME:.metadata.name,STATUS:.status.friendlyDescription"
