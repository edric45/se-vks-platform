#!/bin/sh
# Trim kubeconfig back to just the contexts for this environment.
#
# Every `kubectl vsphere login` against the Supervisor enumerates EVERY vSphere
# Namespace the user can see and creates a context for each -- even when the
# login is scoped with --tanzu-kubernetes-cluster-name. On a shared lab that is
# dozens of contexts. Run this after logging in.
set -u
KEEP="${KEEP:-172.17.10.2 se-namespace se-cluster-01}"

keep_ctx() { for k in $KEEP; do [ "$1" = "$k" ] && return 0; done; return 1; }

n=0
for c in $(kubectl config get-contexts -o name 2>/dev/null); do
  keep_ctx "$c" || { kubectl config delete-context "$c" >/dev/null 2>&1 && n=$((n+1)); }
done
echo "removed $n contexts"

# clusters and users referenced by no remaining context
used_c=$(kubectl config view -o jsonpath='{range .contexts[*]}{.context.cluster}{"\n"}{end}' 2>/dev/null | sort -u)
used_u=$(kubectl config view -o jsonpath='{range .contexts[*]}{.context.user}{"\n"}{end}' 2>/dev/null | sort -u)
n=0
for x in $(kubectl config get-clusters 2>/dev/null | tail -n +2); do
  echo "$used_c" | grep -qx "$x" || { kubectl config delete-cluster "$x" >/dev/null 2>&1 && n=$((n+1)); }
done
echo "removed $n orphaned clusters"
n=0
for x in $(kubectl config get-users 2>/dev/null | tail -n +2); do
  echo "$used_u" | grep -qx "$x" || { kubectl config delete-user "$x" >/dev/null 2>&1 && n=$((n+1)); }
done
echo "removed $n orphaned users"
kubectl config get-contexts
