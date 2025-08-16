resource "azurerm_virtual_network" "prod2_vnet" {
  name                = "${var.env_attribute["production"]}-${var.location_attribute["site2"]}-app-vnet"
  location            = var.region_2
  resource_group_name = var.vnet_rg_placeholder_name
  address_space       = var.vnet_address_app_prd
  tags                = local.common_tags
}

resource "azurerm_subnet" "prd2_app_subnet_1" {
  name                 = "prd-app-subnet"
  resource_group_name  = var.vnet_rg_placeholder_name
  virtual_network_name = azurerm_virtual_network.prod2_vnet.name
  address_prefixes     = var.sbnet_address_1_app_prd
}

resource "azurerm_subnet" "prd2_appgw_subnet_2" {
  name                 = "prd-appgw-subnet"
  resource_group_name  = var.vnet_rg_placeholder_name
  virtual_network_name = azurerm_virtual_network.prod2_vnet.name
  address_prefixes     = var.sbnet_address_appgw_2_prd
}

