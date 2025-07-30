locals {
  department  = var.department_name
  environment = var.environment_name
  region      = var.location_attribute
  name_prefix = "${local.department}-${local.environment}-${var.location_attribute["site1"]}"
  apply_tags = {
    department = local.environment
    location   = var.location_attribute["site1"]
  }
}


#local block for custom data:

locals {
  appvm_custom_data = <<CUSTOM_DATA
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