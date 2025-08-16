# Creating the VM

resource "azurerm_windows_virtual_machine" "azvm_management_config" {
  name                = "${local.name_prefix}-mgmt-vm"
  resource_group_name = var.ph_resource_group_name
  location            = var.ph_resource_group_location
  size                = "Standard_F2"
  admin_username      = "adminuser"
  admin_password      = "Testing@123456"

  network_interface_ids = [
    azurerm_network_interface.mgmt-nic.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}

# Creating NIC for the VM

resource "azurerm_network_interface" "mgmt-nic" {
    name                = "${local.name_prefix}-mgmt-nic"
    location            = var.ph_resource_group_location
    resource_group_name = var.ph_resource_group_name

    ip_configuration {
      name = "app-ip-config"
      private_ip_address_allocation = "Dynamic"
      subnet_id = var.ph_subnet_2_id
      primary = true
    }
}