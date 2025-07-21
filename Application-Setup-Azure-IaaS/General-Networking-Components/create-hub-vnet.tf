resource "azurerm_virtual_network" "hub_vnet" {
  name                = "${var.env-1}-${var.regional_abbrv["centralindia"]}--hub-vnet"
  location            = var.region-1
  resource_group_name = var.vnet_resource_group_name
  address_space       = ["172.30.0.0/16"]
}

resource "azurerm_subnet" "Gateway_subnet" {
  name                 = "GatewaySubnet"
  resource_group_name  = var.vnet_resource_group_name
  virtual_network_name = azurerm_virtual_network.hub_vnet.name
  address_prefixes     = ["172.30.0.0/24"]
}

resource "azurerm_subnet" "az_firewalll_subnet" {
  name                 = "AzureFirewallSubnet"
  resource_group_name  = var.vnet_resource_group_name
  virtual_network_name = azurerm_virtual_network.hub_vnet.name
  address_prefixes     = ["172.30.1.0/24"]

}