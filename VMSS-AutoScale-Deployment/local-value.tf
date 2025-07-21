# Defining naming convention for Business Unit
locals {
  division             = var.business_unit
  environment          = var.env-1
  resource_name_prefix = "${var.business_unit}-${var.env-1}"
  common_tags = {
    division    = local.division
    environment = local.environment
  }
}

# Defining port numbers to be allowed on NSG

locals {
  inbound_access_ports = {
    "100" : "22"
    "101" : "443"
    "102" : "80"
  }
}