# NSG for single deployment Virtual Machines
resource "azurerm_network_security_group" "sub1_nsg" {
  name                = "sub1_nsg"
  location            = azurerm_resource_group.az_tf_rg.location
  resource_group_name = azurerm_resource_group.az_tf_rg.name
  tags                = local.apply_tags
}

resource "azurerm_subnet_network_security_group_association" "association_sub1_nsg" {
  subnet_id                 = azurerm_subnet.subnet_1.id
  network_security_group_id = azurerm_network_security_group.sub1_nsg.id
}

resource "azurerm_network_security_rule" "nsg_rule" {
  name                        = "Incoming_User_access"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = var.source_address_prefix
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.az_tf_rg.name
  network_security_group_name = azurerm_network_security_group.sub1_nsg.name
}


# NSG for multiple deployment Virtual Machines using for_each

resource "azurerm_network_security_group" "sub2_nsg" {
  name                = "sub2_nsg"
  location            = azurerm_resource_group.az_tf_rg.location
  resource_group_name = azurerm_resource_group.az_tf_rg.name
  tags                = local.apply_tags
}

resource "azurerm_subnet_network_security_group_association" "association_sub2_nsg" {
  subnet_id                 = azurerm_subnet.subnet_2.id
  network_security_group_id = azurerm_network_security_group.sub2_nsg.id
}

resource "azurerm_network_security_rule" "multiple_nsg_rule" {
  name                        = "Incoming_User_access"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = var.source_address_prefix
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.az_tf_rg.name
  network_security_group_name = azurerm_network_security_group.sub2_nsg.name
}
