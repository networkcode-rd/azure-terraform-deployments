resource "azurerm_virtual_network" "server_vnet_win" {
  name                = "${var.env-1}-vnet-tf"
  location            = azurerm_resource_group.rg_reference.location
  resource_group_name = azurerm_resource_group.rg_reference.name
  address_space       = [var.address_space]
  #   tags = {
  #     environment = "Production"
  #   }
}

resource "azurerm_subnet" "server_subnet" {
  name                 = "${var.env-1}-server_subnet"
  virtual_network_name = azurerm_virtual_network.server_vnet_win.name
  resource_group_name  = azurerm_resource_group.rg_reference.name
  address_prefixes     = [var.server_subnet_var]
}


resource "azurerm_subnet" "server_alternate_subnet" {
  name                 = "${var.env-1}-server-alt-subnet"
  virtual_network_name = azurerm_virtual_network.server_vnet_win.name
  resource_group_name  = azurerm_resource_group.rg_reference.name
  address_prefixes     = [var.server_alt_subnet_var]
}