locals {
  owners = var.buisness_division
  environment = var.environment
  resource_name_prefix = "${var.buisness_division}-${var.environment}"
  common_tags = {
    owners = local.owners
    environment = local.environment
  }
}

locals {
  nic_map = { for idx, nic in azurerm_network_interface.app-nic : idx => nic }
}
