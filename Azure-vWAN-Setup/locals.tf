locals {
  environment     = var.environment_name
  name_prefix     = "${var.department_name}-${var.location_attribute["site1"]}"
  team            = var.team_name
  resources_types = var.resources_type
  common_tags = {
    team_name   = local.team
    environment = local.environment
    resources   = local.resources_types
  }
}