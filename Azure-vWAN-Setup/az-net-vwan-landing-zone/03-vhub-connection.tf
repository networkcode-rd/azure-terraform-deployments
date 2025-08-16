
# For East Asia - for VNet Connection aka VNet peering.

resource "azurerm_virtual_hub_connection" "vhub_ci_b_to_remote" {
  name                      = "vhub_ea_to_remote_b"
  virtual_hub_id            = azurerm_virtual_hub.vhub_b_ci.id
  remote_virtual_network_id = var.remote_vnet_from_CIVhub
}


# For Central India - for VNet Connection aka VNet peering.

resource "azurerm_virtual_hub_connection" "vhub_ea_a_to_remote" {
  name                      = "vhub_ea_to_remote_a"
  virtual_hub_id            = azurerm_virtual_hub.vhub_a_ea.id
  remote_virtual_network_id = var.remote_vnet_from_EaVhub
}
