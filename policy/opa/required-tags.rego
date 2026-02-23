package policy

# Required tags list
required_tags = ["owner", "owner_name", "ab_number", "environment", "project", "db_type", "data_classification", "created_by", "lifecycle"]
required_project = "HCS_DBaas_Migration"
required_db_type = "postgresql"

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

deny[msg] {
  root := input.planned_values.root_module
  r := module_resources(root)[_]
  tags := object.get(r.values, "tags", {})
  object.get(tags, "project", "") != ""
  object.get(tags, "project", "") != required_project
  msg = sprintf("Resource %s has invalid project tag: expected %s", [r.address, required_project])
}

deny[msg] {
  root := input.planned_values.root_module
  r := module_resources(root)[_]
  tags := object.get(r.values, "tags", {})
  object.get(tags, "db_type", "") != ""
  lower(object.get(tags, "db_type", "")) != required_db_type
  msg = sprintf("Resource %s has invalid db_type tag: expected %s", [r.address, required_db_type])
}

