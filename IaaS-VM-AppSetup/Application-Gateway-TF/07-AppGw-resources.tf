resource "azurerm_application_gateway" "appgw_demo" {
  name                = "${local.resource_name_prefix}-appgw"
  resource_group_name = data.azurerm_resource_group.appgw_tf_rg.name
  location            = data.azurerm_resource_group.appgw_tf_rg.location

  sku {
    name = "Standard_v2"
    tier = "Standard_v2"
    # capacity = 2
  }

  autoscale_configuration {
    min_capacity = 2
    max_capacity = 5
  }

  gateway_ip_configuration {
    name      = "appgw-ip-configuration"
    subnet_id = azurerm_subnet.app_gw_subnet.id
  }

  frontend_port {
    name = var.frontend_port
    port = 80
  }

  frontend_ip_configuration {
    name                          = var.frontend_ip_configuration_name
    private_ip_address_allocation = "Static"
    private_ip_address            = var.private_app_gw_ip
    subnet_id = azurerm_subnet.app_gw_subnet.id
  }
  frontend_ip_configuration {
    name                 = var.frontend_ip_configuration_name_Pub
    public_ip_address_id = azurerm_public_ip.appgw_pub_ip.id

  }

  backend_address_pool {
    name = var.backend_address_pool_name_lnx
    ip_addresses = [
      data.terraform_remote_state.calling_hub_lb_resources.outputs.out_fe_ip_lnx_lb
    ]
  }

  backend_address_pool {
    name = var.backend_address_pool_name_win
    ip_addresses = [
      data.terraform_remote_state.calling_hub_lb_resources.outputs.out_win_lb_fep_ip_id
    ]
  }

  backend_http_settings {
    name                  = var.http_setting_name_lnx
    cookie_based_affinity = "Disabled"
    # path                  = "/linux/"
    port            = 80
    protocol        = "Http"
    request_timeout = 60
  }

  backend_http_settings {
    name                  = var.http_setting_name_win
    cookie_based_affinity = "Disabled"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 60
  }

  http_listener {
    name                           = var.listener_name_session_a
    frontend_ip_configuration_name = var.frontend_ip_configuration_name
    frontend_port_name             = var.frontend_port
    protocol                       = "Http"
  }

  request_routing_rule {
    name                       = var.request_routing_rule_name
    priority                   = 9
    rule_type                  = "PathBasedRouting"
    http_listener_name         = var.listener_name_session_a
    backend_address_pool_name  = var.backend_address_pool_name_lnx
    backend_http_settings_name = var.http_setting_name_lnx
    url_path_map_name          = "linx-to-winds-pathmap"
  }
  url_path_map {
    name                               = "linx-to-winds-pathmap"
    default_backend_address_pool_name  = var.backend_address_pool_name_lnx
    default_backend_http_settings_name = var.http_setting_name_lnx

    path_rule {
      name                       = "windows-rule"
      paths                      = ["/windows*", "/windows/*"]
      backend_address_pool_name  = var.backend_address_pool_name_win
      backend_http_settings_name = var.http_setting_name_win
    }

  }
}