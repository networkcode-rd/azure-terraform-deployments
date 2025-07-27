output "out_rg_id" {
  value = azurerm_resource_group.rg_reference.id
}

output "out_vnet_id" {
  value = azurerm_virtual_network.server_vnet_win.id
}

output "out_subnet_id" {
  value      = azurerm_subnet.server_subnet.id
  depends_on = [azurerm_virtual_network.server_vnet_win]
}

output "out_srv_sub_nsg_id" {
  value = azurerm_network_security_group.nsg_server_subnet.id
}

output "out_vm_resource_id" {
  value = azurerm_subnet_network_security_group_association.nsg_association_sub
}

output "out_vm_alt_nic_id" {
  value = azurerm_network_interface.nic_creation_win_alt_srv_block[*].id
}

output "out_vm_alt_id" {
  value = azurerm_windows_virtual_machine.vm_server_alt_win_block[*].id
}