# Resource: Azure VM using Linux OS
resource "azurerm_linux_virtual_machine" "test_vm_linux" {
  name                            = "${local.name_prefix}-test-vm"
  location                        = azurerm_resource_group.az_tf_rg.location
  resource_group_name             = azurerm_resource_group.az_tf_rg.name
  size                            = "standard_d2s_v3"
  admin_username                  = var.admin_username
  admin_password                  = var.vm_password
  disable_password_authentication = false
  network_interface_ids           = [azurerm_network_interface.primary_nic.id]


  os_disk {
    name                 = "test-linux-vm-osdisk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {

    offer     = "ubuntu-24_04-lts"
    publisher = "Canonical"
    sku       = "server"
    version   = "latest"
    #exact_version = "24.04.202502210"
  }

  tags = local.apply_tags

  #custom_data = filebase64("${path.module}/Script/app.sh")
  custom_data = base64encode(local.appvm_custom_data)
}


resource "azurerm_network_interface" "primary_nic" {
  name                = "primary_nic"
  location            = azurerm_resource_group.az_tf_rg.location
  resource_group_name = azurerm_resource_group.az_tf_rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet_1.id
    private_ip_address_allocation = "Dynamic"
  }
}