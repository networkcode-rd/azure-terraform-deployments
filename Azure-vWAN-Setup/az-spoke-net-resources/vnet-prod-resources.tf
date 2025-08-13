resource "azurerm_virtual_network" "prod_vnet" {
  name                = "${var.env_attribute["production"]}-${var.location_attribute["site2"]}-vnet"
  location            = var.region_2
  resource_group_name = var.vnet_rg_placeholder_name
  address_space       = var.vnet_address_prd
  tags                = local.common_tags
}

resource "azurerm_subnet" "prd_subnet_1" {
  name                 = "${local.subnet-1_name}-prd-def-subnet"
  resource_group_name  = var.vnet_rg_placeholder_name
  virtual_network_name = azurerm_virtual_network.prod_vnet.name
  address_prefixes     = var.sbnet_address_1_prd
}

resource "azurerm_subnet" "prd_subnet_2" {
  name                 = "${local.subnet-1_name}-prd-pe-subnet"
  resource_group_name  = var.vnet_rg_placeholder_name
  virtual_network_name = azurerm_virtual_network.prod_vnet.name
  address_prefixes     = var.sbnet_address_2_prd
}

resource "azurerm_subnet" "prd_subnet_3" {
  name                 = "${local.subnet-1_name}-prd-def2-subnet"
  resource_group_name  = var.vnet_rg_placeholder_name
  virtual_network_name = azurerm_virtual_network.prod_vnet.name
  address_prefixes     = var.sbnet_address_3_prd
}