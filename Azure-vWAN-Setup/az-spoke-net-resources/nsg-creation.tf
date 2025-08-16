# Configutation for dev subnet

resource "azurerm_network_security_group" "dev-sub-nsg" {
  name                = "${local.subnet-1_name}-devsb1-nsg"
  location            = var.vnet_rg_placeholder_location
  resource_group_name = var.vnet_rg_placeholder_name
  tags = local.common_tags
}



# Configutation for prd subnet

resource "azurerm_network_security_group" "prd-sub1-nsg" {
  name                = "${local.subnet-1_name}-prdsb1-nsg"
  location            = var.region_2
  resource_group_name = var.vnet_rg_placeholder_name
  tags = local.common_tags
}


resource "azurerm_network_security_group" "prd-sub2-nsg" {
  name                = "${local.subnet-1_name}-prdsb2-nsg"
  location            = var.region_2
  resource_group_name = var.vnet_rg_placeholder_name
  tags = local.common_tags
}


resource "azurerm_network_security_group" "prd-sub3-nsg" {
  name                = "${local.subnet-1_name}-prdsb3-nsg"
  location            = var.region_2
  resource_group_name = var.vnet_rg_placeholder_name
  tags = local.common_tags
}



# Configutation for app-prd subnet
resource "azurerm_network_security_group" "prd-app-nsg" {
  name                = "${local.subnet-1_name}-prdapp-nsg"
  location            = var.region_2
  resource_group_name = var.vnet_rg_placeholder_name
  tags = local.common_tags
}

resource "azurerm_network_security_group" "prd-appGW-nsg" {
  name                = "${local.subnet-1_name}-appGW-nsg"
  location            = var.region_2
  resource_group_name = var.vnet_rg_placeholder_name
  tags = local.common_tags
}