# # Creating app-tier-subnet with NSGcheck "
# resource "azurerm_subnet" "bastion-subnet" {
#   name                 = "AzureBastionSubnet"
#   resource_group_name  = azurerm_resource_group.rg.name
#   virtual_network_name = azurerm_virtual_network.VNet.name
#   address_prefixes     = var.bastion_subnet_address
# }

# #NSG
# resource "azurerm_network_security_group" "bastion-nsg" {
#   name                = "${azurerm_subnet.bastion-subnet.name}-nsg"
#   location            = azurerm_resource_group.rg.location
#   resource_group_name = azurerm_resource_group.rg.name
# }

# resource "azurerm_subnet_network_security_group_association" "bastion-nsg-association" {
#   depends_on = [azurerm_network_security_rule.bastion_INT_inbound_443,
#     azurerm_network_security_rule.bastion_GM_inbound_443,
#     azurerm_network_security_rule.bastion_ALB_inbound_443,
#     azurerm_network_security_rule.bastion_VNet_Inbound_VNet,
#     azurerm_network_security_rule.bastion_VNet_Outbound,
#     azurerm_network_security_rule.bastion_Outbound_AzCloud,
#     azurerm_network_security_rule.bastion_Outbound_INT,
#     azurerm_network_security_rule.bastion_VNet_Oubound_VNet
#   ]
#   subnet_id                 = azurerm_subnet.bastion-subnet.id
#   network_security_group_id = azurerm_network_security_group.bastion-nsg.id
# }


# resource "azurerm_network_security_rule" "bastion_INT_inbound_443" {
#   name                        = "AllowInbound443INT"
#   priority                    = 100
#   direction                   = "Inbound"
#   access                      = "Allow"
#   protocol                    = "Tcp"
#   source_port_range           = "*"
#   destination_port_range      = "443"
#   source_address_prefix       = "Internet"
#   destination_address_prefix  = "*"
#   resource_group_name         = azurerm_resource_group.rg.name
#   network_security_group_name = azurerm_network_security_group.bastion-nsg.name
# }

# resource "azurerm_network_security_rule" "bastion_GM_inbound_443" {
#   name                        = "AllowInbound443GM"
#   priority                    = 110
#   direction                   = "Inbound"
#   access                      = "Allow"
#   protocol                    = "Tcp"
#   source_port_range           = "*"
#   destination_port_range      = "443"
#   source_address_prefix       = "GatewayManager"
#   destination_address_prefix  = "*"
#   resource_group_name         = azurerm_resource_group.rg.name
#   network_security_group_name = azurerm_network_security_group.bastion-nsg.name
# }

# resource "azurerm_network_security_rule" "bastion_ALB_inbound_443" {
#   name                        = "AllowInbound443ALB"
#   priority                    = 111
#   direction                   = "Inbound"
#   access                      = "Allow"
#   protocol                    = "Tcp"
#   source_port_range           = "*"
#   destination_port_range      = "443"
#   source_address_prefix       = "AzureLoadBalancer"
#   destination_address_prefix  = "*"
#   resource_group_name         = azurerm_resource_group.rg.name
#   network_security_group_name = azurerm_network_security_group.bastion-nsg.name
# }

# resource "azurerm_network_security_rule" "bastion_VNet_Inbound_VNet" {
#   name                        = "AllowInboundRange"
#   priority                    = 120
#   direction                   = "Inbound"
#   access                      = "Allow"
#   protocol                    = "Tcp"
#   source_port_range           = "*"
#   destination_port_ranges     = ["8080", "5701"]
#   source_address_prefix       = "VirtualNetwork"
#   destination_address_prefix  = "VirtualNetwork"
#   resource_group_name         = azurerm_resource_group.rg.name
#   network_security_group_name = azurerm_network_security_group.bastion-nsg.name
# }


# resource "azurerm_network_security_rule" "bastion_VNet_Outbound" {
#   name                        = "AllowOutboundRangeVNet"
#   priority                    = 101
#   direction                   = "Outbound"
#   access                      = "Allow"
#   protocol                    = "Tcp"
#   source_port_range           = "*"
#   destination_port_ranges     = ["22", "3389"]
#   source_address_prefix       = "*"
#   destination_address_prefix  = "VirtualNetwork"
#   resource_group_name         = azurerm_resource_group.rg.name
#   network_security_group_name = azurerm_network_security_group.bastion-nsg.name
# }


# resource "azurerm_network_security_rule" "bastion_Outbound_AzCloud" {
#   name                        = "AllowOutboundRangeAzCloud"
#   priority                    = 102
#   direction                   = "Outbound"
#   access                      = "Allow"
#   protocol                    = "Tcp"
#   source_port_range           = "*"
#   destination_port_ranges     = ["443"]
#   source_address_prefix       = "*"
#   destination_address_prefix  = "AzureCloud"
#   resource_group_name         = azurerm_resource_group.rg.name
#   network_security_group_name = azurerm_network_security_group.bastion-nsg.name
# }


# resource "azurerm_network_security_rule" "bastion_Outbound_INT" {
#   name                        = "AllowOutboundRangeINT"
#   priority                    = 103
#   direction                   = "Outbound"
#   access                      = "Allow"
#   protocol                    = "Tcp"
#   source_port_range           = "*"
#   destination_port_ranges     = ["80"]
#   source_address_prefix       = "*"
#   destination_address_prefix  = "Internet"
#   resource_group_name         = azurerm_resource_group.rg.name
#   network_security_group_name = azurerm_network_security_group.bastion-nsg.name
# }


# resource "azurerm_network_security_rule" "bastion_VNet_Oubound_VNet" {
#   name                        = "AllowOutboundRange"
#   priority                    = 104
#   direction                   = "Outbound"
#   access                      = "Allow"
#   protocol                    = "*"
#   source_port_range           = "*"
#   destination_port_ranges     = ["8080", "5701"]
#   source_address_prefix       = "VirtualNetwork"
#   destination_address_prefix  = "VirtualNetwork"
#   resource_group_name         = azurerm_resource_group.rg.name
#   network_security_group_name = azurerm_network_security_group.bastion-nsg.name
# }
