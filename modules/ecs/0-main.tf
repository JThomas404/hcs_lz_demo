resource "hcs_compute_instance" "this" {
  name              = "${var.name_prefix}-ecs"
  image_name        = var.image_name
  flavor_id         = var.flavor
  key_pair          = var.keypair_name
  availability_zone = var.availability_zone
  tags              = var.tags

  network {
    uuid = var.subnet_id
  }

  # This argument MUST be a list of IDs
  security_group_ids = [var.security_group_id]
}
