# Configutation for DEV subnet

resource "azurerm_network_security_rule" "dev-subnet-nsg" {
    for_each = local.nsg_ports
  name                        = "${each.value}-port-in"
  priority                    = each.key
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = each.value
  source_address_prefix       = var.src_add_hm_isp
  destination_address_prefix  = "*"
  resource_group_name         = var.vnet_rg_placeholder_name
  network_security_group_name = azurerm_network_security_group.dev-sub-nsg.name
}


# Configutation for PROD and its different subnet

resource "azurerm_network_security_rule" "prd-subnet1-nsg" {
    for_each = local.nsg_ports
  name                        = "${each.value}-port-in"
  priority                    = each.key
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = each.value
  source_address_prefix       = var.src_add_hm_isp
  destination_address_prefix  = "*"
  resource_group_name         = var.vnet_rg_placeholder_name
  network_security_group_name = azurerm_network_security_group.prd-sub1-nsg.name
}


resource "azurerm_network_security_rule" "prd-subnet2-nsg" {
    for_each = local.nsg_ports
  name                        = "${each.value}-port-in"
  priority                    = each.key
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = each.value
  source_address_prefix       = var.src_add_hm_isp
  destination_address_prefix  = "*"
  resource_group_name         = var.vnet_rg_placeholder_name
  network_security_group_name = azurerm_network_security_group.prd-sub2-nsg.name
}


resource "azurerm_network_security_rule" "prd-subnet3-nsg" {
    for_each = local.nsg_ports
  name                        = "${each.value}-port-in"
  priority                    = each.key
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = each.value
  source_address_prefix       = var.src_add_hm_isp
  destination_address_prefix  = "*"
  resource_group_name         = var.vnet_rg_placeholder_name
  network_security_group_name = azurerm_network_security_group.prd-sub3-nsg.name
}