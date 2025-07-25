resource "azurerm_network_interface" "isolated_nic_vm" {
  name                = "isolated_nic_vm"
  location            = var.var_vm_resource_group_location
  resource_group_name = var.var_vm_resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.var_isolated_subnet
    private_ip_address_allocation = "Dynamic"
  }
}