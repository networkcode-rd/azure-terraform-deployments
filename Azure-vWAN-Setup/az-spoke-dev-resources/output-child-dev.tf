# Network Interface ID
output "output_azurerm_network_interface" {
  description = "Value of all the NIC IDs created by this module."
  value = [for nic in values(azurerm_network_interface.app-nic) : nic.id]
}

output "out_az_ilb_id" {
  value = azurerm_lb.az_ilb_resource.id
}

output "out_fep_ip_id" {
  value = azurerm_lb.az_ilb_resource.frontend_ip_configuration
}

output "out_backend_pool_id" {
  value = azurerm_lb_backend_address_pool.az_dev_ilb_bep_name.id
}