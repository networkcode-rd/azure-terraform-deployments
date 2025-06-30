# # Creating NSG

# resource "azurerm_network_security_group" "app-nic-nsg" {
#   #count = length(azurerm_network_interface.app-nic)
#   name = "app-nic-nsg"
#   location = azurerm_resource_group.rg.location
#   resource_group_name = azurerm_resource_group.rg.name      
# }

# # NSG rules

# resource "azurerm_network_security_rule" "app-nsg-nic-rule-allow-http" {
#     for_each = local.web_inbound_ports_map
#   name                        = "app-nsg-nic-rule-allow-${each.value}"
#   priority                    = each.key
#   direction                   = "Inbound"
#   access                      = "Allow"
#   protocol                    = "Tcp"
#   source_port_range           = "*"
#   destination_port_range      = each.value
#   source_address_prefix       = "*"
#   destination_address_prefix  = "*"
#   resource_group_name         = azurerm_resource_group.rg.name
#   network_security_group_name = azurerm_network_security_group.app-nic-nsg.name
# }

# # Associate NSG to a VM NIC
# resource "azurerm_network_interface_security_group_association" "app-nic-nsg-association" {
#   count = length(azurerm_network_interface.app-nic)
#   depends_on = [ azurerm_network_security_rule.app-nsg-nic-rule-allow-http ]
#   network_interface_id = azurerm_network_interface.app-nic[count.index].id
#   network_security_group_id = azurerm_network_security_group.app-nic-nsg.id
# }