resource "azurerm_virtual_network" "isolate_vnet" {
  name                = "${var.env-1}-${var.regional_abbrv["centralindia"]}-isolate-vnet"
  location            = var.region-1
  resource_group_name = var.vnet_resource_group_name
  address_space       = ["172.19.0.0/16"]
}


resource "azurerm_subnet" "isolate-subnet-1" {
  name                 = "isolate-subnet-1"
  resource_group_name  = var.vnet_resource_group_name
  virtual_network_name = azurerm_virtual_network.isolate_vnet.name
  address_prefixes     = ["172.19.0.0/24"]
}
