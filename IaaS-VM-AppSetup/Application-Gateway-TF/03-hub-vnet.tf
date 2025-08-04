resource "azurerm_virtual_network" "hub_vnet" {
  name                = "${local.resource_name_prefix}-hub-vnet"
  resource_group_name = data.azurerm_resource_group.appgw_tf_rg.name
  location            = data.azurerm_resource_group.appgw_tf_rg.location
  address_space       = ["172.16.0.0/16"]
}


resource "azurerm_subnet" "app_gw_subnet" {
  name                 = "app_gw_subnet"
  address_prefixes     = ["172.16.1.0/24"]
  virtual_network_name = azurerm_virtual_network.hub_vnet.name
  resource_group_name  = data.azurerm_resource_group.appgw_tf_rg.name
}