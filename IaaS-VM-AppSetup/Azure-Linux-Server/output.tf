output "output_rg_id" {
  value = azurerm_resource_group.az_tf_rg.id
}

output "output_rg_name" {
  value = azurerm_resource_group.az_tf_rg.name
}

output "output_vnet_id" {
  value = azurerm_virtual_network.az_vnet_linux_tf.id
}

output "output_vnet_name_lnx" {
  value = azurerm_virtual_network.az_vnet_linux_tf.name
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

# List for fetching Private IP address
output "output_value_list_vm_private_ip_address_list" {
  description = "Linux VMs Private IP address ~ List"
  value = [for vm in azurerm_linux_virtual_machine.multiple_vm_linux: vm.private_ip_address]
}

# Map for fetching Private IP address

output "output_value_list_vm_private_ip_address_map" {
  description = "Linux VMs Private IP address ~ Map"
  value = {for vm in azurerm_linux_virtual_machine.multiple_vm_linux: vm.name => vm.private_ip_address}
}


# Keys for fetching Private IP address

output "output_value_list_vm_private_ip_address_keys" {
  description = "Linux VMs Private IP address ~ keys"
  value = keys ({for vm in azurerm_linux_virtual_machine.multiple_vm_linux: vm.name => vm.private_ip_address})
}

# Values for fetching Private IP address

output "output_value_list_vm_private_ip_address_values" {
  description = "Linux VMs Private IP address ~ values"
  value = values ({for vm in azurerm_linux_virtual_machine.multiple_vm_linux: vm.name => vm.private_ip_address})
}

# Iterator with list

output "out_linux_vm_multiple_ite_list_ids" {
  description = "Network Interface IDs"
  value = [for vm, nic in azurerm_linux_virtual_machine.multiple_vm_linux: nic.id]
}


# Iterator with Map

output "out_linux_vm_multiple_ite_map_ids" {
  description = "Network Interface IDs"
  value = {for vm, nic in azurerm_linux_virtual_machine.multiple_vm_linux: vm => nic.id}
}