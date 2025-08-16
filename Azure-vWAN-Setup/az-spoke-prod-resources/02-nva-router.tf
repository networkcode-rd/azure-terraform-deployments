# In my setup example I will be using Windows 2022 and will enable RRAS capabilities

# Creating the VM

resource "azurerm_windows_virtual_machine" "nva_router_config" {
  name                = "${local.name_prefix}-rtrvm"
  resource_group_name = var.ph_resource_group_name
  location            = var.ph_resource_group_location
  size                = "Standard_F2"
  admin_username      = "adminuser"
  admin_password      = "Testing@123456"

  network_interface_ids = [
    azurerm_network_interface.nva-nic.id,
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

# Creating NIC for the NVA-VM

resource "azurerm_network_interface" "nva-nic" {
    name                = "${local.name_prefix}-nva-nic"
    location            = var.ph_resource_group_location
    resource_group_name = var.ph_resource_group_name
  ip_forwarding_enabled = true

    ip_configuration {
      name = "nva-ipconfig"
      private_ip_address_allocation = "Dynamic"
      subnet_id = var.ph_subnet_3_id
      primary = true
      public_ip_address_id = azurerm_public_ip.nva_public_IP.id
    }
  depends_on = [azurerm_public_ip.nva_public_IP]
}

# Creating Public IP

resource "azurerm_public_ip" "nva_public_IP" {
  name = "nva_public_IP"
  allocation_method = "Static"
  sku = "Standard"
  location = var.ph_resource_group_location
  resource_group_name = var.ph_resource_group_name
}