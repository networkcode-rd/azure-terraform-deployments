#local block for custom data:

locals {
  appvm_custom_data = <<CUSTOM_DATA
#!/bin/sh
#sudo yum update -y
sudo yum install -y httpd
sudo systemctl enable httpd
sudo systemctl start httpd  
sudo systemctl stop firewalld
sudo systemctl disable firewalld
sudo chmod -R 777 /var/www/html 
sudo echo "NetworkCode - VM Hostname: $(hostname)" > /var/www/html/index.html
sudo mkdir /var/www/html/app1
sudo echo "NetworkCode - VM Hostname: $(hostname)" > /var/www/html/app1/hostname.html
sudo echo "NetworkCode - App Status Page" > /var/www/html/app1/status.html
sudo echo '<!DOCTYPE html> <html> <body style="background-color:rgb(250, 210, 210);"> <h1>This is NetworkCode </h1> <p>Terraform Demo</p> <p>Application Version: V1</p> </body></html>' | sudo tee /var/www/html/app1/index.html
sudo curl -H "Metadata:true" --noproxy "*" "http://169.254.169.254/metadata/instance?api-version=2020-09-01" -o /var/www/html/app1/metadata.html
CUSTOM_DATA
}


# Resource: Azure VM using Linux OS
resource "azurerm_linux_virtual_machine" "app-linux-vm" {
  name                  = "${local.resource_name_prefix}-app-linux-vm"
  computer_name         = "app-linux-vm"
  location              = azurerm_resource_group.rg.location
  resource_group_name   = azurerm_resource_group.rg.name
  size                  = "standard_d2s_v3"
  admin_username        = "adhocadmin"
  network_interface_ids = [azurerm_network_interface.app-nic.id]
  admin_ssh_key {
    username = "adhocadmin"
    public_key = file("${path.module}/ssh-keys/terraform-azure.pub")
  }

  os_disk {
    name              = "${local.resource_name_prefix}-app-linux-vm-osdisk"
    caching = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    
    offer = "UbuntuServer"
    publisher = "Canonical"
    sku = "22.04-LTS"
    version = "latest"
  }

  #custom_data = filebase64("${path.module}/Script/app.sh")
  custom_data = base64encode(local.appvm_custom_data)
}
