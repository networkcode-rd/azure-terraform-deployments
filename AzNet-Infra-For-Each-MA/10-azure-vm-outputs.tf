# Output List - Single Input to for loop
output "app_vm_private_ip_address_list" {
    description = "Value of IP address i.e., Private"
    value = [for vm in azurerm_linux_virtual_machine.app-linux-vm: vm.private_ip_address] 
}


# Output Map  - Single Input to for loop
output "app_vm_private_ip_address_map" {
    description = "Value of IP address i.e., Private"
    value = {for vm in azurerm_linux_virtual_machine.app-linux-vm: vm.id => vm.private_ip_address}
}


# Terraform keys() function: keys takes a map and returns a list containing the keys from that map.

output "app_vm_private_ip_address_keys_function" {
    description = "Value of IP address i.e., Private"
    value = keys ({for vm in azurerm_linux_virtual_machine.app-linux-vm: vm.id => vm.private_ip_address})
}


# Terraform values() function: values takes a map and returns a list containing the values of the elements in that map.
output "app_vm_private_ip_address_values_function" {
    description = "Value of IP address i.e., Private"
    value = values ({for vm in azurerm_linux_virtual_machine.app-linux-vm: vm.id => vm.private_ip_address})
}


# Output List - Two Inputs to for loop (here vm is Iterator like "i")
output "app_vm_network_interface_id_list" {
    description = "Value of IP address i.e., Private"
    value = [for vm, nic in azurerm_network_interface.app-nic: nic.id]
}



# Output Map  - Two Inputs to for loop (here vm is Iterator like "i")
output "app_vm_network_interface_id_map" {
    description = "Value of IP address i.e., Private"
    value = {for vm, nic in azurerm_network_interface.app-nic: vm => nic.id}
}