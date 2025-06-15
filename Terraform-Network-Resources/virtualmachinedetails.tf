resource "azurerm_public_ip" "tf-pub-ip-1" {
  name                = "tf-pub-ip-1"
  location            = azurerm_resource_group.tf-rg-networkhub.location
  resource_group_name = azurerm_resource_group.tf-rg-networkhub.name
  allocation_method   = "Static"

  tags = {
    environment = "testing"
  }
}

resource "azurerm_network_interface" "example" {
  name                = "example-nic"
  location            = azurerm_resource_group.tf-rg-networkhub.location
  resource_group_name = azurerm_resource_group.tf-rg-networkhub.name
    tags = {
        environment = "Terraform"
    }

  ip_configuration {
    name                          = "single-nic-ip-config"
    subnet_id                     = azurerm_subnet.default-tf-sub.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_virtual_machine" "tf-vm-win-01" {
  name                  = "tf-vm-win-01"
  location              = azurerm_resource_group.tf-rg-networkhub.location
  resource_group_name   = azurerm_resource_group.tf-rg-networkhub.name
  network_interface_ids = [azurerm_network_interface.example.id]
  vm_size               = "Standard_DS1_v2"

  storage_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }

  storage_os_disk {
    name              = "tf-os-disk-win-01"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = "tf-vm-win-01"
    admin_username = "adhocadmin"
    admin_password = "P@ssw0rd1234!"
  }

  os_profile_windows_config {
    provision_vm_agent = true
  }
}