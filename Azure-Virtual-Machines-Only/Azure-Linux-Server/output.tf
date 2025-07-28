output "output_rg_id" {
  value = azurerm_resource_group.az_tf_rg.id
}

output "output_vnet_id" {
  value = azurerm_virtual_network.az_vnet_linux_tf.id
}

output "output_subnet_1_id" {
  value = azurerm_subnet.subnet_1.id
}

output "output_nsg_id" {
  value = azurerm_network_security_group.sub1_nsg.id
}

output "output_azurevm_linux_standalone_id" {
  value = azurerm_linux_virtual_machine.test_vm_linux.id
}

output "output_azurevm_linux_private_ip_address" {
  value = azurerm_linux_virtual_machine.test_vm_linux.private_ip_address
}