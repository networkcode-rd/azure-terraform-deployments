resource "azurerm_public_ip" "appgw_pubip_config" {
  name                = "${local.name_prefix}-appgwpip"
  resource_group_name = var.ph_resource_group_name
  location            = var.ph_resource_group_location
  allocation_method   = "Static"
  sku = "Standard"
  ddos_protection_mode = "Disabled"
  timeouts {
    create = "2h"
    update = "2h"
  }
}


resource "azurerm_application_gateway" "appgw" {
  name                = "${local.name_prefix}-appgateway"
  resource_group_name = var.ph_resource_group_name
  location            = var.ph_resource_group_location
  tags = local.common_tags

  sku {
    name     = "Standard_v2"
    tier     = "Standard_v2"
    capacity = 2
  }

  gateway_ip_configuration {
    name      = "appgw-ip-configuration"
    subnet_id = var.ph_subnet_appgw_id
  }

  frontend_port {
    name = local.frontend_port_name
    port = 80
  }

frontend_ip_configuration {
  name                 = "public-frontend"
  public_ip_address_id = azurerm_public_ip.appgw_pubip_config.id
}

frontend_ip_configuration {
  name                          = "private-frontend"
  private_ip_address_allocation = "Static"
  private_ip_address = "172.20.1.254"
  subnet_id                     = var.ph_subnet_appgw_id
}

  backend_address_pool {
    name = local.backend_address_pool_name
  }


  backend_http_settings {
    name                  = local.http_setting_name
    cookie_based_affinity = "Disabled"
    path                  = "/path1/"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 60
  }

  http_listener {
    name                           = local.listener_name
    frontend_ip_configuration_name = "private-frontend"
    frontend_port_name             = local.frontend_port_name
    protocol                       = "Http"
  }

  request_routing_rule {
    name                       = local.request_routing_rule_name
    priority                   = 9
    rule_type                  = "Basic"
    http_listener_name         = local.listener_name
    backend_address_pool_name  = local.backend_address_pool_name
    backend_http_settings_name = local.http_setting_name
  }
}

