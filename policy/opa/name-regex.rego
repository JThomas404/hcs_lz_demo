package policy

kebab_name_regex = "^[a-z0-9]+(-[a-z0-9]+)*$"
key_alias_regex = "^alias/[a-z0-9]+(-[a-z0-9]+)*$"

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
  name := object.get(r.values, "name", "")
  is_string(name)
  name != ""
  not regex.match(kebab_name_regex, name)
  msg = sprintf("Resource %s has invalid name '%s'. Expected kebab-case.", [r.address, name])
}

deny[msg] {
  root := input.planned_values.root_module
  r := module_resources(root)[_]
  bucket := object.get(r.values, "bucket", "")
  is_string(bucket)
  bucket != ""
  not regex.match(kebab_name_regex, bucket)
  msg = sprintf("Resource %s has invalid bucket '%s'. Expected kebab-case.", [r.address, bucket])
}

deny[msg] {
  root := input.planned_values.root_module
  r := module_resources(root)[_]
  key_alias := object.get(r.values, "key_alias", "")
  is_string(key_alias)
  key_alias != ""
  not regex.match(key_alias_regex, key_alias)
  msg = sprintf("Resource %s has invalid key_alias '%s'. Expected alias/<kebab-case>.", [r.address, key_alias])
}
