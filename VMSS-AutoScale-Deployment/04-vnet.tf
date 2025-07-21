resource "azurerm_virtual_network" "vnet_ci" {
  name                = "${local.resource_name_prefix}-${var.vnet-name}"
  resource_group_name = azurerm_resource_group.vmss-rg.name
  location            = azurerm_resource_group.vmss-rg.location
  address_space       = var.vnet-address-space
}

resource "azurerm_subnet" "subnet_default" {
  name                 = "default-sub"
  resource_group_name  = azurerm_resource_group.vmss-rg.name
  virtual_network_name = azurerm_virtual_network.vnet_ci.name
  address_prefixes     = var.subnet_default
}
