output "out_azvmss_ID" {
  value = azurerm_linux_virtual_machine_scale_set.linux_web_vmss_vwan_env.id
}

output "out_appgw_publicIP" {
  value = azurerm_public_ip.appgw_pubip_config.id
}

output "out_appgw_id" {
  value = azurerm_application_gateway.appgw.id
}

