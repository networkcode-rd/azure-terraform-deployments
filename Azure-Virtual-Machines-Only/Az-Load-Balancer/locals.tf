locals {
  department  = var.department_name
  environment = var.environment_name
  region      = var.location_attribute
  name_prefix = "${local.department}-${local.environment}-${var.location_attribute["site1"]}"
  apply_tags = {
    department = local.environment
    location   = var.location_attribute["site1"]
  }
}