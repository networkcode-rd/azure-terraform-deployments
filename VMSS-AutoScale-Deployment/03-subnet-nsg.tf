# Using dynamic block in Azure NSG

resource "azurerm_network_security_group" "nsg-default-subnet" {
  name                = "${azurerm_subnet.subnet_default.name}-nsg"
  location            = azurerm_resource_group.vmss-rg.location
  resource_group_name = azurerm_resource_group.vmss-rg.name

  dynamic "security_rule" {
    for_each = var.nsg_network_ports
    content {
      name                       = "incoming_rule-${security_rule.key}"
      description                = "incoming_rule-${security_rule.key}"
      priority                   = 100 + security_rule.key
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


resource "azurerm_subnet_network_security_group_association" "subnet_nsg_default_association" {
  network_security_group_id = azurerm_network_security_group.nsg-default-subnet.id
  subnet_id                 = azurerm_subnet.subnet_default.id
}