# For Linux VNet to HUB peering

resource "azurerm_virtual_network_peering" "hub_to_linux" {
  name                      = "hub_to_linux_peering"
  resource_group_name       = data.azurerm_resource_group.appgw_tf_rg.name
  virtual_network_name      = azurerm_virtual_network.hub_vnet.name
  remote_virtual_network_id = data.terraform_remote_state.calling_hub_lnx_resources.outputs.output_vnet_id
}


resource "azurerm_virtual_network_peering" "linux_to_hub" {
  name                      = "linux_to_hub_peering"
  resource_group_name       = data.terraform_remote_state.calling_hub_lnx_resources.outputs.output_rg_name
  virtual_network_name      = data.terraform_remote_state.calling_hub_lnx_resources.outputs.output_vnet_name_lnx
  remote_virtual_network_id = azurerm_virtual_network.hub_vnet.id
}


# For Windows VNet to HUB peering

resource "azurerm_virtual_network_peering" "hub_to_win" {
  name                      = "hub_to_win_peering"
  resource_group_name       = data.azurerm_resource_group.appgw_tf_rg.name
  virtual_network_name      = azurerm_virtual_network.hub_vnet.name
  remote_virtual_network_id = data.terraform_remote_state.calling_hub_win_resources.outputs.out_vnet_id
}


resource "azurerm_virtual_network_peering" "win_to_hub" {
  name                      = "win_to_hub_peering"
  resource_group_name       = data.terraform_remote_state.calling_hub_win_resources.outputs.out_rg_name
  virtual_network_name      = data.terraform_remote_state.calling_hub_win_resources.outputs.out_vnet_name_win
  remote_virtual_network_id = azurerm_virtual_network.hub_vnet.id
}
