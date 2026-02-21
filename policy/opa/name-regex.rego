package policy

name_regex = "^[a-z0-9]([a-z0-9-]{0,61}[a-z0-9])?$"

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
  name := r.values.name
  name != ""
  not regex.match(name_regex, name)
  msg = sprintf("Resource %s has invalid name: %s", [r.address, name])
}
