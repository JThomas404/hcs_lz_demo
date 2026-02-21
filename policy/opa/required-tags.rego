package policy

# Required tags list
required_tags = ["owner", "cost_center", "environment", "project", "data_classification", "created_by", "lifecycle"]

module_resources(mod)[r] {
  r := mod.resources[_]
}

module_resources(mod)[r] {
  child := mod.child_modules[_]
  r := module_resources(child)[_]
}

deny[msg] {
  root := input.planned_values.root_module
  r := module_resources(root)[_]
  tags := object.get(r.values, "tags", {})
  missing := [tag | tag := required_tags[_]; object.get(tags, tag, "") == ""]
  count(missing) > 0
  msg = sprintf("Resource %s missing tags: %v", [r.address, missing])
}

