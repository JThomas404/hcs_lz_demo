package policy

module_resources(mod)[r] {
  r := mod.resources[_]
}

module_resources(mod)[r] {
  child := mod.child_modules[_]
  r := module_resources(child)[_]
}

# Deny security-group egress rules that open traffic to the public internet.
deny[msg] {
  root := input.planned_values.root_module
  r := module_resources(root)[_]
  contains(lower(r.type), "security_group_rule")
  direction := lower(object.get(r.values, "direction", ""))
  direction == "egress"
  cidr := object.get(r.values, "cidr", "")
  cidr == "0.0.0.0/0"
  msg = sprintf("Public egress denied for resource %s", [r.address])
}

# Defensive fallback for simplified input payloads.
deny[msg] {
  lower(object.get(input, "resource_type", "")) == "security_group_rule"
  lower(object.get(input, "direction", "")) == "egress"
  object.get(input, "cidr", "") == "0.0.0.0/0"
  msg = "Public egress denied"
}