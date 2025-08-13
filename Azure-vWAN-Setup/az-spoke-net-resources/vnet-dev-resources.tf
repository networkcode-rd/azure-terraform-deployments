resource "azurerm_virtual_network" "dev_vnet" {
  name                = "${var.env_attribute["development"]}-${var.location_attribute["site1"]}-vnet"
  location            = var.vnet_rg_placeholder_location
  resource_group_name = var.vnet_rg_placeholder_name
  address_space       = var.vnet_address_dev
  tags                = local.common_tags
}

resource "azurerm_subnet" "dev_subnet_1" {
  name                 = "${local.subnet-1_name}-dev-subnet"
  resource_group_name  = var.vnet_rg_placeholder_name
  virtual_network_name = azurerm_virtual_network.dev_vnet.name
  address_prefixes     = var.sbnet_address_1
}