locals {
  environment = var.environment_name
  name_prefix = "${var.department_name}-${var.location_attribute["site2"]}"
  team        = var.team_name
  resources_types= var.resources_type
  common_tags = {
    team_name   = local.team
    environment = local.environment
    resources = local.resources_types
  }
}


locals {
  backend_address_pool_name      = "${local.resources_types}-beap"
  frontend_port_name             = "${local.resources_types}-feport"
  frontend_ip_configuration_name = "${local.resources_types}-feip"
  http_setting_name              = "${local.resources_types}-be-htst"
  listener_name                  = "${local.resources_types}-httplstn"
  request_routing_rule_name      = "${local.resources_types}-rqrt"
  redirect_configuration_name    = "${local.resources_types}-rdrcfg"
}