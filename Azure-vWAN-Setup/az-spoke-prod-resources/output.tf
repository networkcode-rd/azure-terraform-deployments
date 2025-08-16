output "out_prvt_endpoint_ID" {
  value = azurerm_private_endpoint.prod_stg_pe_config.id
}

output "out_prvt_endpoint_DNS_ID" {
  value = azurerm_private_dns_zone.storage_pvt_dns_zone.id
}

output "out_pe_DNS_Vnet_link_id" {
  value = azurerm_private_dns_zone_virtual_network_link.storage_vnet_link_conn_a.id
}

output "out_mgmt_vm_id" {
  value = azurerm_windows_virtual_machine.azvm_management_config.id
}

output "out_nva_vm_id" {
  value = azurerm_windows_virtual_machine.nva_router_config.id
}

output "out_private_dns_zone_name" {
  value = azurerm_private_dns_zone.storage_pvt_dns_zone.name
}