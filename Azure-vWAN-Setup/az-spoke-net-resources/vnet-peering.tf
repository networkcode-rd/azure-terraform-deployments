resource "azurerm_virtual_network_peering" "shared_prd_to_app_prod" {
  name                      = "shared_prd_to_app_prod"
  resource_group_name       = var.vnet_rg_placeholder_name
  virtual_network_name      = azurerm_virtual_network.prod_vnet.name
  remote_virtual_network_id = azurerm_virtual_network.prod2_vnet.id
}

resource "azurerm_virtual_network_peering" "app_prod_to_shared_app" {
  name                      = "app_prod_to_shared_app"
  resource_group_name       = var.vnet_rg_placeholder_name
  virtual_network_name      = azurerm_virtual_network.prod2_vnet.name
  remote_virtual_network_id = azurerm_virtual_network.prod_vnet.id
}