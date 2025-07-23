# Creating Peering between App Vnet with Hub VNet

resource "azurerm_virtual_network_peering" "peer_hub_to_app" {
  name                      = "peer_hub_to_app"
  resource_group_name       = var.vnet_resource_group_name
  virtual_network_name      = azurerm_virtual_network.hub_vnet.name
  remote_virtual_network_id = azurerm_virtual_network.app_vnet.id
}

resource "azurerm_virtual_network_peering" "peer_app_to_hub" {
  name                      = "peer_app_to_hub"
  resource_group_name       = var.vnet_resource_group_name
  virtual_network_name      = azurerm_virtual_network.app_vnet.name
  remote_virtual_network_id = azurerm_virtual_network.hub_vnet.id
}


# Creating Peering between Isolate Vnet with Hub VNet

resource "azurerm_virtual_network_peering" "peer_hub_to_isolate" {
  name                      = "peer_hub_to_isolate"
  resource_group_name       = var.vnet_resource_group_name
  virtual_network_name      = azurerm_virtual_network.hub_vnet.name
  remote_virtual_network_id = azurerm_virtual_network.isolate_vnet.id
}

resource "azurerm_virtual_network_peering" "peer_isolate_to_hub" {
  name                      = "peer_isolate_to_hub"
  resource_group_name       = var.vnet_resource_group_name
  virtual_network_name      = azurerm_virtual_network.isolate_vnet.name
  remote_virtual_network_id = azurerm_virtual_network.hub_vnet.id
}