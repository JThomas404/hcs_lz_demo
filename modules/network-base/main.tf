resource "hcs_vpc" "this" {
  count = var.create ? 1 : 0

  name = var.name
  cidr = var.cidr
  tags = var.tags

  lifecycle {
    precondition {
      condition     = !var.create || (var.name != null && var.cidr != null)
      error_message = "When create=true, both name and cidr must be provided."
    }
  }
}

resource "hcs_vpc_subnet" "private" {
  count      = var.create ? length(var.private_subnets) : 0
  vpc_id     = hcs_vpc.this[0].id
  name       = "${var.name}-private-${count.index + 1}"
  cidr       = var.private_subnets[count.index]
  gateway_ip = null
  tags       = var.tags
}
