output "out_appgw_info_id" {
  value = azurerm_application_gateway.appgw_demo.id
}

output "out_appgw_frontendIP_info" {
  value = azurerm_application_gateway.appgw_demo.frontend_ip_configuration
}

output "out_appgw_publicIP_info" {
  value = azurerm_public_ip.appgw_pub_ip.id
}