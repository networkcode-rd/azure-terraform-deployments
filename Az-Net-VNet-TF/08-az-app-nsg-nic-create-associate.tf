resource "azurerm_network_security_group" "app-nic-nsg" {
  name = "app-nic-nsg"
  location = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name      
}


resource "azurerm_network_interface_security_group_association" "app-nic-nsg-association" {
  depends_on = [ azurerm_network_security_rule.app-nsg-nic-rule-allow-http ]
  network_interface_id = azurerm_network_interface.app-nic.id
  network_security_group_id = azurerm_network_security_group.app-nic-nsg.id
}



resource "azurerm_network_security_rule" "app-nsg-nic-rule-allow-http" {
    for_each = local.web_inbound_ports_map
  name                        = "app-nsg-nic-rule-allow-${each.value}"
  priority                    = each.key
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = each.value
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.app-nic-nsg.name
}