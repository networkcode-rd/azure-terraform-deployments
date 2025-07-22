output "private_endpoint_id_output" {
  value = azurerm_private_endpoint.pe_paas_stg.id
}

output "private_dns_config_id" {
  value = azurerm_private_dns_zone.stg_paas_dns.id
}

output "private_service_connection_resource_id" {
  value = azurerm_private_endpoint.pe_paas_stg.private_service_connection[0].private_connection_resource_id
}
