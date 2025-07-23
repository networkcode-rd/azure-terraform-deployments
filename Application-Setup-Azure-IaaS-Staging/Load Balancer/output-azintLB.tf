output "az_int_lb_id_output" {
  value = azurerm_lb.az_int_lb.id
}

output "az_int_lb_id_fep_output" {
  value = azurerm_lb.az_int_lb.frontend_ip_configuration
}

output "az_int_lb_backendpool_id" {
  value = azurerm_lb_backend_address_pool.bep_pool.id
}

