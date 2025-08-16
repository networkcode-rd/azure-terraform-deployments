# For East Asia

resource "azurerm_vpn_gateway_connection" "vpn_connection_a_ea" {
  name               = "connection-ea"
  vpn_gateway_id     = azurerm_vpn_gateway.vpn_gw_resource_ea.id
  remote_vpn_site_id = azurerm_vpn_site.vpn_site_ea_a.id

  vpn_link {
    name             = "ealink1"
    vpn_site_link_id = azurerm_vpn_site.vpn_site_ea_a.link[0].id
    shared_key = "Testing1234%"    
  }

  # vpn_link {
  #   name             = "link2"
  #   vpn_site_link_id = azurerm_vpn_site.vpn_site_ea_a.link[1].id
  # }
}

# For Central India

resource "azurerm_vpn_gateway_connection" "vpn_connection_b_ci" {
  name               = "connection-ci"
  vpn_gateway_id     = azurerm_vpn_gateway.vpn_gw_resource_ci.id
  remote_vpn_site_id = azurerm_vpn_site.vpn_site_ci_a.id

  vpn_link {
    name             = "cilink1"
    vpn_site_link_id = azurerm_vpn_site.vpn_site_ci_a.link[0].id
    shared_key = "Testing1234%"
  }

  # vpn_link {
  #   name             = "link2"
  #   vpn_site_link_id = azurerm_vpn_site.vpn_site_ci_a.link[0].id
  # }
}