# L4 authorization demo (ztunnel, no waypoint)

Shows where `AuthorizationPolicy` is enforced in ambient mode, and what it can
and cannot see. Three pods, identical except for their ServiceAccount; one
policy; measurable before/after.

Run it:

```sh
KCTX=se-cluster-01 ./run.sh          # deploy, probe, apply policy, probe again
KCTX=se-cluster-01 ./run.sh clean    # delete the namespace
```

Requires the Istio addon already installed in ambient mode
(`ambientMode.enabled: true` in [`../../addon.yaml`](../../addon.yaml)).
Nothing else — no istioctl, no waypoint, no sidecars.

## Result from this lab (se-cluster-01, Istio 1.28.2)

```
=== before any policy ===
  allowed  -> server : HTTP 200
  denied   -> server : HTTP 200

=== after the policy ===
  allowed  -> server : HTTP 200
  denied   -> server : HTTP 000
```

ztunnel's own log for the refused connection:

```
error  access  connection complete
  src.identity="spiffe://cluster.local/ns/l4demo/sa/denied"
  dst.identity="spiffe://cluster.local/ns/l4demo/sa/server"
  dst.hbone_addr=192.168.146.38:8080
  bytes_sent=0 bytes_recv=0 duration="1ms"
  error="http status: 401 Unauthorized"
```

`bytes_sent=0` — the connection is refused before any application data moves.
The `401` is on the HBONE tunnel itself, not something the app ever sees; curl
sees a reset, hence `000`.

## When L4 authorization comes into picture

**On every meshed connection.** ztunnel is in the path for every pod in an
ambient namespace, so it evaluates L4 policy on every connection. The namespace
label is the entire opt-in.

It is the right layer whenever the rule is answerable from *who is connecting
and to what port*:

| Field | ztunnel (L4) | Needs a waypoint (L7) |
|---|---|---|
| `source.principals` | yes | |
| `source.namespaces` | yes | |
| `source.serviceAccounts` | yes | |
| `destination.ports` | yes | |
| `operation.methods` | | yes |
| `operation.paths` | | yes |
| `operation.hosts` | | yes |
| `request.headers` / JWT claims | | yes |

Put an L7 field in a policy with no waypoint and it does not fail open — Istio
denies the whole connection at L4 rather than admit traffic it cannot evaluate.
[`30-authorizationpolicy-l7.yaml`](30-authorizationpolicy-l7.yaml) has both the
broken form and the waypoint that fixes it.

## Three things worth pointing out when demoing this

**Identity, not address.** `principals` matches the SPIFFE name in the peer's
mTLS certificate. The `denied` pod can relabel itself `app: allowed`, take the
other pod's IP after a reschedule, or be moved to another node, and it is still
refused — it cannot obtain the `allowed` service account's certificate. This is
the difference from a NetworkPolicy, which matches on pod selector and CIDR and
is enforced by the CNI on packets.

**The first ALLOW policy flips the workload to default-deny.** Before it, both
callers got 200; after it, anything not matched is refused, with no DENY policy
anywhere. This is the operational trap: scrapes, health checkers and sidecar-less
callers break the moment the first policy lands. Scope the selector tightly and
enumerate every legitimate caller, including Prometheus.

**A reset is not a 403.** ztunnel refuses at L4, so there is no HTTP response to
carry a status code. If you see a 403, a waypoint refused it at L7. Useful as a
first diagnostic: the failure shape tells you which layer denied you.

## A waypoint does not switch L4 enforcement off

Both layers run at once. ztunnel keeps enforcing workload-selector policies at
the server pod even after a waypoint is in the path — and the connection it sees
now comes from the **waypoint's** identity, not the original client's.

Measured here with `20-*.yaml` listing only `sa/allowed`, then adding a waypoint:

```
allowed  GET  -> 503      <-- waypoint admitted it; ztunnel then refused the waypoint
allowed  POST -> 403
denied   GET  -> 403
```

The waypoint's own access log names the cause:

```
UF,URX upstream_reset_before_response_started{connection_termination}
"envoy://connect_originate/192.168.146.38:8080"
```

Add `cluster.local/ns/l4demo/sa/waypoint` to the principals list and it resolves:

```
allowed  GET  -> 200
allowed  POST -> 403      <-- waypoint's Envoy, L7
denied   GET  -> 403      <-- also the waypoint now, not the L4 reset
```

Two things fall out of that. Any workload-level L4 policy must allow the
waypoint's service account or you break your own L7 path in a way that looks
like an application fault. And once a Service routes through a waypoint, the
client's connection terminates there, so the client-facing denial becomes a 403
rather than a reset — the reset only appears when there is no waypoint.

## Relationship to NetworkPolicy

They are complementary and both apply — a connection must pass the CNI's
NetworkPolicy *and* ztunnel's AuthorizationPolicy. They deny for different
reasons and in different places:

| | NetworkPolicy | L4 AuthorizationPolicy |
|---|---|---|
| Enforced by | CNI (Antrea here) | ztunnel |
| Matches on | pod selector, namespace, CIDR | SPIFFE identity from the cert |
| Covers non-mesh destinations | yes | no |
| Constrains egress to arbitrary IPs | yes | no (needs an egress waypoint + ServiceEntry) |
| Survives IP reuse / relabelling | no | yes |
| Disabled by removing one namespace label | no | yes |

### The gap, measured

The `denied` pod is under a strict identity-based ALLOW policy and cannot reach
`server` in its own namespace. From that same pod:

```
denied -> 172.17.10.2:6443   (Supervisor API)  : 401   <-- reached
denied -> 172.30.0.6:10250   (node kubelet)    : 404   <-- reached
denied -> kubernetes.default:443                : 403   <-- reached
```

Every one of those is a completed TCP+TLS connection; the status codes are the
*targets* rejecting the credentials, not the network refusing the connection.
Istio's L4 authorization constrains nothing here, because none of those
destinations are meshed workloads — the policy is evaluated at the *destination*
by that destination's ztunnel, and there isn't one.

So AuthorizationPolicy is not a superset of NetworkPolicy. It is stronger where
they overlap (identity beats IP) and absent where they do not (egress to
anything outside the mesh, and traffic to non-meshed pods, nodes and the
control plane).

Practical split:

- **NetworkPolicy** — a default-deny egress baseline per namespace, CIDR rules,
  blocking the node/metadata/control-plane endpoints, plus anything involving
  non-meshed workloads. Also your fallback if someone removes the
  `istio.io/dataplane-mode` label, which silently voids every Istio policy in
  the namespace at once.
- **AuthorizationPolicy** — service-to-service rules inside the mesh, where you
  actually mean "this identity", not "this IP".

## With mTLS in PERMISSIVE mode

`principals` only matches when the peer presented a certificate. In PERMISSIVE
mode a plaintext caller has no identity, so it matches no `from.source` rule and
an ALLOW policy refuses it. That is safe, but it means the policy is silently
doing double duty as an mTLS enforcement — and a caller that *should* be in the
mesh but is not yet gets denied in a way that looks like a policy bug. Move to
`STRICT` before relying on identity rules, or at least know which one you are
testing.

## Files

| File | |
|---|---|
| `00-namespace.yaml` | namespace `l4demo`, ambient label |
| `10-workloads.yaml` | `server` (nginx) + `allowed`/`denied` curl clients, three ServiceAccounts |
| `20-authorizationpolicy-l4.yaml` | the L4 policy — this is the demo |
| `30-authorizationpolicy-l7.yaml` | the contrast: L7 conditions + the waypoint they need |
| `run.sh` | deploy, probe, apply, probe; `clean` to remove |

## If both callers fail before you apply anything

The mesh is broken, not the policy. Check ztunnel:

```sh
kubectl -n istio-system logs ds/ztunnel --tail=50 | grep -i 'identity error'
```

`certificate fetch failed ... no valid existing certificate` means ztunnel
cannot reach istiod's CA or is holding a stale trust root. This happened in this
lab after a plug-in CA swap where istiod was restarted and ztunnel was not:

```sh
kubectl -n istio-system rollout restart ds/ztunnel
```

After any CA change, restart **istiod, ztunnel and every gateway**. An idle mesh
looks perfectly healthy while being completely broken — nothing reports an error
until a workload actually tries to connect.
