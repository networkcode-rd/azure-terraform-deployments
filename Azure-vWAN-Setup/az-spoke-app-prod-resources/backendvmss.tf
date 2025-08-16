#local block for custom data:

locals {
 vmss_custom_data = <<CUSTOM_DATA
#!/bin/bash
# Update and install Apache (Ubuntu)
sudo apt-get update -y
sudo apt-get install -y apache2

# Enable and start Apache service
sudo systemctl enable apache2
sudo systemctl start apache2

# Set permissions and create directories
sudo chmod -R 777 /var/www/html
sudo mkdir -p /var/www/html/app1

# Create content
echo "NetworkCode - VM Hostname: $(hostname)" | sudo tee /var/www/html/index.html
echo "NetworkCode - VM Hostname: $(hostname)" | sudo tee /var/www/html/app1/hostname.html
echo "NetworkCode - App Status Page" | sudo tee /var/www/html/app1/status.html
echo '<!DOCTYPE html><html><body style="background-color:rgb(250, 210, 210);"><h1>This is NetworkCode</h1><p>Terraform Demo</p><p>Application Version: V1</p></body></html>' | sudo tee /var/www/html/app1/index.html

# Fetch Azure VM metadata
sudo curl -H "Metadata:true" --noproxy "*" "http://169.254.169.254/metadata/instance?api-version=2020-09-01" -o /var/www/html/app1/metadata.html
CUSTOM_DATA
}


resource "azurerm_linux_virtual_machine_scale_set" "linux_web_vmss_vwan_env" {
  name = "${local.name_prefix}-vmss-web"
  resource_group_name = var.ph_resource_group_name
  location = var.ph_resource_group_location
  sku = "Standard_D2s_v3"
  admin_username        = "adhocadmin"
  admin_password = var.vm_passwrd
  disable_password_authentication = false
  instances = 2

 os_disk {
    caching = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  
    source_image_reference {
    offer = "ubuntu-24_04-lts"
    publisher = "Canonical"
    sku = "server"
    version = "latest"
  }

  upgrade_mode = "Automatic"

  network_interface {
    name = "web-vmss-nic"
    primary = true

    ip_configuration {
      primary = true
      subnet_id = var.ph_app_subnet_id
      name = "internal"
      application_gateway_backend_address_pool_ids = [
  for pool in azurerm_application_gateway.appgw.backend_address_pool : pool.id if pool.name == local.backend_address_pool_name
]
    }
  }

      #custom_data = filebase64("${path.module}/Script/app.sh")
  custom_data = base64encode(local.vmss_custom_data)
}
