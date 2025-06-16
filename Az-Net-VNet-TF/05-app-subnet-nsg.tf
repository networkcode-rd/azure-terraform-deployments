# Creating app-tier-subnet with NSGcheck "
resource "azurerm_subnet" "app-tier-subnet" {
    name = "${azurerm_virtual_network.VNet.name}-${var.app-subnet-name}"
    resource_group_name = azurerm_resource_group.rg.name
    virtual_network_name = azurerm_virtual_network.VNet.name
    address_prefixes = var.default_subnet_address
}

#NSG
resource "azurerm_network_security_group" "app-nsg" {
    name = "${azurerm_subnet.app-tier-subnet.name}-nsg"
    location = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_subnet_network_security_group_association" "app-nsg-association" {
    depends_on = [ azurerm_network_security_rule.app-nsg-rule-allow-http ]
    subnet_id = azurerm_subnet.app-tier-subnet.id
    network_security_group_id = azurerm_network_security_group.app-nsg.id
}

# # Creating NSG rules:-
# resource "azurerm_network_security_rule" "app-nsg-rule-allow-http" {
#     name                        = "Allow-HTTP"
#     priority                    = 100
#     direction                   = "Inbound"
#     access                      = "Allow"
#     protocol                    = "Tcp"
#     source_port_range           = "*"
#     destination_port_range      = "80"
#     source_address_prefix       = "49.37.132.65"
#     destination_address_prefix  = "*"
#     network_security_group_name = azurerm_network_security_group.app-nsg.name
#     resource_group_name         = azurerm_resource_group.rg.name
# }

#[80,3389,443,22,8080]
locals {
  web_inbound_ports_map = {
    "100" : "80"
    "200" : "3389"
    "300" : "443"
    "400" : "22"
    "500" : "8080"
  }
}

resource "azurerm_network_security_rule" "app-nsg-rule-allow-http" {
    for_each = local.web_inbound_ports_map
  name                        = "app-nsg-rule-allow-${each.value}"
  priority                    = each.key
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = each.value
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.app-nsg.name
}