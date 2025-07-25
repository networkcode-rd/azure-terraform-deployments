output "output_vm_id" {
  value = azurerm_linux_virtual_machine.isolate_vm_ubu.id
}

output "output_nic_private_ip_address" {
  value = azurerm_network_interface.isolated_nic_vm.private_ip_address
}