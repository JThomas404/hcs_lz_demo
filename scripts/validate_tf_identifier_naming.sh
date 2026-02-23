# #!/usr/bin/env bash
# set -euo pipefail

# scan_root="${1:-.}"
# id_regex='^[a-z][a-z0-9_]*$'
# reserved_regex='^(this|main|default)$'
# failures=0

# check_identifier() {
#   local kind="$1"
#   local name="$2"
#   local file="$3"
#   local line="$4"

#   if [[ ! "$name" =~ $id_regex ]]; then
#     echo "[naming-guardrail] ${file}:${line} ${kind} '${name}' must use snake_case (^[a-z][a-z0-9_]*$)."
#     failures=1
#   fi

#   if [[ "$name" =~ $reserved_regex ]]; then
#     echo "[naming-guardrail] ${file}:${line} ${kind} '${name}' is too generic. Use a descriptive role (for example: landing_zone, data_encryption, evidence, primary)."
#     failures=1
#   fi
# }

# while IFS= read -r file; do
#   while IFS='|' read -r line kind name; do
#     [[ -z "$line" ]] && continue
#     check_identifier "$kind" "$name" "$file" "$line"
#   done < <(
#     awk '
#       match($0, /^[[:space:]]*(resource|data)[[:space:]]+"[^"]+"[[:space:]]+"[^"]+"/, m) {
#         s = substr($0, RSTART, RLENGTH)
#         if (match(s, /(resource|data)[[:space:]]+"[^"]+"[[:space:]]+"([^"]+)"/, n)) {
#           print NR "|" n[1] "|" n[2]
#         }
#       }
#       match($0, /^[[:space:]]*(module|variable|output)[[:space:]]+"[^"]+"/, m) {
#         s = substr($0, RSTART, RLENGTH)
#         if (match(s, /(module|variable|output)[[:space:]]+"([^"]+)"/, n)) {
#           print NR "|" n[1] "|" n[2]
#         }
#       }
#     ' "$file"
#   )
# done < <(find "$scan_root" -type f -name '*.tf' ! -path '*/.terraform/*' | sort)

# if [[ "$failures" -ne 0 ]]; then
#   echo "[naming-guardrail] Terraform identifier naming validation failed."
#   exit 1
# fi

# echo "[naming-guardrail] Terraform identifier naming validation passed."