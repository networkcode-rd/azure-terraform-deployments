# resource "azurerm_lb" "az_lb_ext" {
#   name                = "az_pubIP_azlbext"
#   location            = azurerm_resource_group.hub_tf_rg.location
#   resource_group_name = azurerm_resource_group.hub_tf_rg.name

#   frontend_ip_configuration {
#     name                 = "PublicIPAddress"
#     public_ip_address_id = azurerm_public_ip.az_lb_pubIP.id
#   }
# }

# resource "azurerm_lb_backend_address_pool" "lin_eng_bep" {
#   loadbalancer_id = azurerm_lb.az_lb_ext.id
#   name            = "linux_pool"
# }

# resource "azurerm_lb_backend_address_pool_address" "linux_vm" {
#   name                    = "linux-vm"
#   backend_address_pool_id = azurerm_lb_backend_address_pool.lin_eng_bep.id
#   virtual_network_id      = var.vnet_information_linux
#   ip_address              = var.bep_ipadresses
# }


# # resource "azurerm_lb_backend_address_pool" "win_eng_bep" {
# #   loadbalancer_id = azurerm_lb.az_lb_ext.id
# #   name            = "win_pool"
# # }

# # resource "azurerm_lb_backend_address_pool_address" "windows_vm" {
# #   name                    = "windows-vm"
# #   backend_address_pool_id = azurerm_lb_backend_address_pool.win_eng_bep.id
# #   virtual_network_id      = var.vnet_id_windows
# #   ip_address              = var.ip_address_windows
# # }

# resource "azurerm_lb_probe" "health_probe" {
#   name            = "hep-app-tcp"
#   protocol        = "Tcp"
#   port            = 80
#   loadbalancer_id = azurerm_lb.az_lb_ext.id
# }

# # Creating Azure Load Balancer Rule

# resource "azurerm_lb_rule" "inbound-rule-lin" {
#   name                           = "inbound-rule-01-lin"
#   protocol                       = "Tcp"
#   frontend_port                  = 8081
#   backend_port                   = 80
#   frontend_ip_configuration_name = azurerm_lb.az_lb_ext.frontend_ip_configuration[0].name
#   backend_address_pool_ids       = [azurerm_lb_backend_address_pool.lin_eng_bep.id]
#   probe_id                       = azurerm_lb_probe.health_probe.id
#   loadbalancer_id                = azurerm_lb.az_lb_ext.id
# }


# # resource "azurerm_lb_rule" "inbound-rule-win" {
# #   name                           = "inbound-rule-01-win"
# #   protocol                       = "Tcp"
# #   frontend_port                  = 8080
# #   backend_port                   = 80
# #   frontend_ip_configuration_name = azurerm_lb.az_lb_ext.frontend_ip_configuration[0].name
# #   backend_address_pool_ids       = [azurerm_lb_backend_address_pool.win_eng_bep.id]
# #   probe_id                       = azurerm_lb_probe.health_probe.id
# #   loadbalancer_id                = azurerm_lb.az_lb_ext.id
# # }