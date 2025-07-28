output "output_azure_lb" {
  value = azurerm_lb.az_lb_ext.id
}

output "output_backend_address_pool_lin_id" {
  value = azurerm_lb_backend_address_pool.lin_eng_bep.id
}

output "output_public_ip_frontend" {
  value = azurerm_public_ip.az_lb_pubIP.ip_address
}

# output "output_backend_address_pool_win_id" {
#   value = azurerm_lb_backend_address_pool.win_eng_bep.id
# }