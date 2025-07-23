resource "azurerm_virtual_network" "app_vnet" {
  name                = "${var.env-1}-${var.regional_abbrv["centralindia"]}-vnet"
  location            = var.region-1
  resource_group_name = var.vnet_resource_group_name
  address_space       = ["172.16.0.0/16"]
}


resource "azurerm_subnet" "app-subnet" {
  name                 = "app-subnet"
  resource_group_name  = var.vnet_resource_group_name
  virtual_network_name = azurerm_virtual_network.app_vnet.name
  address_prefixes     = ["172.16.0.0/24"]

#   delegation {
#     name = "delegation"

#     service_delegation {
#       name    = "Microsoft.ContainerInstance/containerGroups"
#       actions = ["Microsoft.Network/virtualNetworks/subnets/join/action", "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action"]
#     }
#   }
}

resource "azurerm_subnet" "web-subnet" {
  name                 = "web-subnet"
  resource_group_name  = var.vnet_resource_group_name
  virtual_network_name = azurerm_virtual_network.app_vnet.name
  address_prefixes     = ["172.16.1.0/24"]

}


resource "azurerm_subnet" "pe_subnet" {
  name                 = "pe_subnet"
  resource_group_name  = var.vnet_resource_group_name
  virtual_network_name = azurerm_virtual_network.app_vnet.name
  address_prefixes     = ["172.16.2.0/24"]
}