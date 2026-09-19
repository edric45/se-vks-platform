#!/bin/sh
# Regenerate the addon schema reference from a live Supervisor.
#
#   ./dump-schemas.sh                 # newest version of every package
#   ./dump-schemas.sh istio 1.28.2    # one specific package version
#
# Writes json/<package>-<version>.json and md/<package>-<version>.md
set -u
SUP="${SUP:-wld-sup}"
NS="${NS:-vmware-system-vks-public}"
cd "$(dirname "$0")"
mkdir -p json md

render() {  # $1=package metadata name  $2=full version
  pkg="$1"; ver="$2"
  short=$(echo "$pkg" | sed 's/\.kubernetes\.vmware\.com$//; s/\.tanzu\.vmware\.com$//')
  vshort=$(echo "$ver" | sed 's/+.*//')
  out="${short}-${vshort}"
  kubectl --context="$SUP" -n "$NS" get package "${pkg}.${ver}" \
    -o jsonpath='{.spec.valuesSchema.openAPIv3}' 2>/dev/null > "json/${out}.json" || return 0
  [ -s "json/${out}.json" ] || { rm -f "json/${out}.json"; return 0; }
  {
    printf '# %s %s\n\n' "$short" "$ver"
    printf '| Property | Type | Default | Description |\n|---|---|---|---|\n'
    jq -r '
      def walk($prefix):
        (.properties // {}) | to_entries[] |
        ($prefix + (if $prefix == "" then "" else "." end) + .key) as $path |
        (
          if (.value.type == "object" and (.value.properties // {} | length) > 0)
          then (.value | walk($path))
          else "| `\($path)` | \(.value.type // "?") | \(if .value.default == null then "" else "`\(.value.default|tostring)`" end) | \((.value.description // "") | gsub("\n";" ") | gsub("\\|";"\\\\|")) |"
          end
        );
      walk("")
    ' "json/${out}.json" 2>/dev/null
  } > "md/${out}.md"
  printf '  %s\n' "${out}"
  return 0
}

if [ $# -eq 2 ]; then
  pkg=$(kubectl --context="$SUP" -n "$NS" get packages --no-headers | awk -v s="$1" '$2 ~ s {print $2; exit}')
  ver=$(kubectl --context="$SUP" -n "$NS" get packages --no-headers | awk -v s="$1" -v v="$2" '$2 ~ s && $3 ~ v {print $3; exit}')
  [ -n "${pkg:-}" ] && [ -n "${ver:-}" ] && render "$pkg" "$ver" || echo "not found: $1 $2"
  exit 0
fi

kubectl --context="$SUP" -n "$NS" get packages --no-headers \
  | awk '{print $2"\t"$3}' | sort -V | awk -F'\t' '{a[$1]=$2} END {for (p in a) print p"\t"a[p]}' \
  | while IFS="$(printf '\t')" read -r pkg ver; do render "$pkg" "$ver"; done
