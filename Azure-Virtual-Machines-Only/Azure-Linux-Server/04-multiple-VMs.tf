
# Resource: Azure VM using Linux OS
resource "azurerm_linux_virtual_machine" "multiple_vm_linux" {
    for_each = var.var_instance_count
  name                            = "${local.name_prefix}-${each.key}"
  location                        = azurerm_resource_group.az_tf_rg.location
  resource_group_name             = azurerm_resource_group.az_tf_rg.name
  size                            = "standard_d2s_v3"
  admin_username                  = var.admin_username
  admin_password                  = var.vm_password
  disable_password_authentication = false
  network_interface_ids           = [azurerm_network_interface.multiple_primary_nic[each.key].id]


  os_disk {
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


resource "azurerm_network_interface" "multiple_primary_nic" {
  for_each            = var.var_instance_count
  name                = "${local.name_prefix}-primary-nic-${each.key}"
  location            = azurerm_resource_group.az_tf_rg.location
  resource_group_name = azurerm_resource_group.az_tf_rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet_2.id
    private_ip_address_allocation = "Dynamic"
  }
}