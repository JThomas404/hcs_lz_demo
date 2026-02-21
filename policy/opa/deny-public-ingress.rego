package policy

module_resources(mod)[r] {
  r := mod.resources[_]
}

module_resources(mod)[r] {
  child := mod.child_modules[_]
  r := module_resources(child)[_]
}

# Deny security-group ingress rules that allow public ingress on common DB ports.
deny[msg] {
  root := input.planned_values.root_module
  r := module_resources(root)[_]
  contains(lower(r.type), "security_group_rule")
  direction := lower(object.get(r.values, "direction", ""))
  direction == "ingress"
  cidr := object.get(r.values, "cidr", "")
  cidr == "0.0.0.0/0"
  port := sprintf("%v", [object.get(r.values, "port", "")])
  port == "3306" or port == "5432" or port == "1521"
  msg = sprintf("Public ingress detected on port %s in %s", [port, r.address])
}

# Defensive fallback for simplified input payloads.
deny[msg] {
  lower(object.get(input, "resource_type", "")) == "security_group_rule"
  lower(object.get(input, "direction", "")) == "ingress"
  object.get(input, "cidr", "") == "0.0.0.0/0"
  p := sprintf("%v", [object.get(input, "port", "")])
  p == "3306" or p == "5432" or p == "1521"
  msg = sprintf("Public ingress detected on port %s", [p])
}
