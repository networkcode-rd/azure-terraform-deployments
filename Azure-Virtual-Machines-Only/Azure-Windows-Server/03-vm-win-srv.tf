resource "azurerm_windows_virtual_machine" "vm_server_win_block" {
  name                = "${var.env-1}-win-srv"
  resource_group_name = azurerm_resource_group.rg_reference.name
  location            = azurerm_resource_group.rg_reference.location
  size                = "Standard_F2"
  admin_username      = "adminuser"
  admin_password      = "P@$$w0rd1234!"
  network_interface_ids = [
    azurerm_network_interface.nic_creation_win_srv_block.id,
  ]

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


resource "azurerm_network_interface" "nic_creation_win_srv_block" {
  name                = "${var.env-1}-nic"
  location            = azurerm_resource_group.rg_reference.location
  resource_group_name = azurerm_resource_group.rg_reference.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.server_subnet.id
    private_ip_address_allocation = "Dynamic"
  }
  depends_on = [azurerm_subnet.server_subnet]
}

resource "azurerm_virtual_machine_extension" "vm_config" {
  name                 = "InstallIISAndTelnet"
  virtual_machine_id   = azurerm_windows_virtual_machine.vm_server_win_block.id
  publisher            = "Microsoft.Compute"
  type                 = "CustomScriptExtension"
  type_handler_version = "1.10"

  settings = jsonencode({
    "commandToExecute" = "powershell -ExecutionPolicy Unrestricted -Command \"Install-WindowsFeature -Name Web-Server; Install-WindowsFeature -Name Telnet-Client\""
  })
}
