# Creating App NSG and associating to App Subnet

resource "azurerm_network_security_group" "app_nsg" {
  name                = "${var.env-1}-app-nsg"
  location            = var.region-1
  resource_group_name = var.vnet_resource_group_name

  dynamic "security_rule" {
    for_each = var.app_subnet_nsg_in_ports
    content {
      name                       = "in-rule-${security_rule.key}"
      description                = "in-rule-${security_rule.key}"
      priority                   = sum([102, security_rule.key])
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = security_rule.value
      source_address_prefix      = "*"
      destination_address_prefix = "*"

    }
  }
}

resource "azurerm_subnet_network_security_group_association" "app_nsg_subnet_association" {
  subnet_id                 = azurerm_subnet.app-subnet.id
  network_security_group_id = azurerm_network_security_group.app_nsg.id
}


# Creating App NSG and associating to Isolate Subnet

resource "azurerm_network_security_group" "isolate01_nsg" {
  name                = "${var.env-1}-isolate01-nsg"
  location            = var.region-1
  resource_group_name = var.vnet_resource_group_name

  dynamic "security_rule" {
    for_each = var.app_subnet_nsg_in_ports
    content {
      name                       = "in-rule-${security_rule.key}"
      description                = "in-rule-${security_rule.key}"
      priority                   = sum([100, security_rule.key])
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = security_rule.value
      source_address_prefix      = "*"
      destination_address_prefix = "*"

    }
  }
}

resource "azurerm_subnet_network_security_group_association" "isolate_nsg_subnet_association" {
  subnet_id                 = azurerm_subnet.isolate-subnet-1.id
  network_security_group_id = azurerm_network_security_group.isolate01_nsg.id
}