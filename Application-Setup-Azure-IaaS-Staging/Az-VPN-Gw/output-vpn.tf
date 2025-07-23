output "vpn_gw_output" {
  value = azurerm_virtual_network_gateway.az_vpn_gw.id
}

output "vpn_gw_pubip_output" {
  value = azurerm_public_ip.az_vpn_pub_ip.id
}

output "vpngw_ipconfig_output" {
  value = azurerm_virtual_network_gateway.az_vpn_gw.ip_configuration[0].private_ip_address_allocation
}

output "lng_output_onprem" {
  value = azurerm_local_network_gateway.lng_on_prem_network_address_space.id
}

output "conn_output_onprem" {
  value = azurerm_virtual_network_gateway_connection.conn_on_prem_network_address_space.id
}

output "conn_output_onprem_sharedkey" {
  value = var.onprem_shared_key
  sensitive = true
}