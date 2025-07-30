resource "azurerm_windows_virtual_machine" "vm_server_alt_win_block" {
  count                      = var.meta_argu_vm
  name                       = "win-srv-${count.index}"
  resource_group_name        = azurerm_resource_group.rg_reference.name
  location                   = azurerm_resource_group.rg_reference.location
  size                       = "Standard_F2"
  admin_username             = "asdsreaasd"
  admin_password             = "adasdasdsa"
  network_interface_ids      = [element(azurerm_network_interface.nic_creation_win_alt_srv_block[*].id, count.index)]
  provision_vm_agent         = true
  allow_extension_operations = true


  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-Datacenter"
    version   = "latest"
  }
}


resource "azurerm_virtual_machine_extension" "vm_config_alt" {
  count                = var.meta_argu_vm
  name                 = "InstallIISAndTelnet-${count.index}"
  virtual_machine_id   = element(azurerm_windows_virtual_machine.vm_server_win_block[*].id, count.index)
  publisher            = "Microsoft.Compute"
  type                 = "CustomScriptExtension"
  type_handler_version = "1.10"

  settings = jsonencode({
    "commandToExecute" = "powershell -ExecutionPolicy Unrestricted -Command \"Install-WindowsFeature -Name Web-Server; Install-WindowsFeature -Name Telnet-Client\""
  })

  depends_on = [null_resource.wait_for_vm_boot]
}
