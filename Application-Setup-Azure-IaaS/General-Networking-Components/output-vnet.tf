output "vnet_name_output" {
  value = azurerm_virtual_network.app_vnet.id
}

output "vnet__subnet_app_name_output" {
  value = azurerm_subnet.app-subnet.id
}

output "vnet__subnet_web_name_output" {
  value = azurerm_subnet.web-subnet.id
}

output "vnet_subnet_pe_name_output" {
  value = azurerm_subnet.pe_subnet.id
}

output "hub_vnet_output" {
  value = azurerm_virtual_network.hub_vnet.id
}

output "hub_gw_sub_output" {
  value = azurerm_subnet.Gateway_subnet.id
}

output "hub_az_fw_sub_output" {
  value = azurerm_subnet.az_firewalll_subnet.id
}

output "isolate_vnet_output" {
  value = azurerm_virtual_network.isolate_vnet.id
}

output "isolate_subnet1_output" {
  value = azurerm_subnet.isolate-subnet-1.id
}