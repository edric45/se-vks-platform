#!/bin/sh
# L4 authorization demo. Run against a workload cluster that already has the
# Istio addon installed in ambient mode (see ../../addon.yaml).
#
#   KCTX=se-cluster-01 ./run.sh
#
# Takes about a minute. Leaves the namespace up; ./run.sh clean removes it.
set -eu
K="kubectl ${KCTX:+--context $KCTX}"
D="$(dirname "$0")"

if [ "${1:-}" = "clean" ]; then
  $K delete ns l4demo --ignore-not-found
  exit 0
fi

probe() {
  for c in allowed denied; do
    pod=$($K -n l4demo get pod -l app=$c -o name | head -1)
    # curl exits non-zero on a reset connection and still prints 000, so take
    # its output as-is and only substitute when it printed nothing at all.
    code=$($K -n l4demo exec "$pod" -c c -- \
      curl -s -o /dev/null -w '%{http_code}' --max-time 5 http://server/ 2>/dev/null) || true
    [ -n "$code" ] || code="000"
    printf '  %-8s -> server : HTTP %s\n' "$c" "$code"
  done
}

echo "=== deploying ==="
$K apply -f "$D/00-namespace.yaml"
$K apply -f "$D/10-workloads.yaml"
$K -n l4demo rollout status deploy/server --timeout=120s
$K -n l4demo rollout status deploy/allowed --timeout=120s
$K -n l4demo rollout status deploy/denied --timeout=120s

echo
echo "=== in the mesh? (WAYPOINT should be None, PROTOCOL HBONE) ==="
istioctl ${KCTX:+--context $KCTX} ztunnel-config workload --namespace l4demo 2>/dev/null \
  || echo "  (istioctl not on PATH -- skip)"

echo
echo "=== before any policy ==="
# Removed explicitly so a re-run on an existing namespace still shows an honest
# "before" -- otherwise the policy from the last run is already in force.
$K -n l4demo delete authorizationpolicy server-callers --ignore-not-found >/dev/null
sleep 3
probe

echo
echo "=== applying the L4 policy ==="
$K apply -f "$D/20-authorizationpolicy-l4.yaml"
sleep 5

echo
echo "=== after the policy ==="
probe

echo
echo "Expected: allowed 200, denied 000 (connection reset -- there is no HTTP"
echo "response to carry a 403, because ztunnel refuses at L4)."
echo
echo "ztunnel's own view of the two connections:"
echo "  kubectl ${KCTX:+--context $KCTX} -n istio-system logs ds/ztunnel --tail=30 | grep l4demo"
