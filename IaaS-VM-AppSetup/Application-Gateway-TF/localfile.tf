# Defining naming convention for Business Unit
locals {
  division             = var.department_name
  environment          = var.env-1
  resource_name_prefix = "${var.environment_name}-${var.department_name}"
  common_tags = {
    division    = local.division
    environment = local.environment
  }
}

