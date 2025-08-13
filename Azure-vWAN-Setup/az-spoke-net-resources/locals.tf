#  locals {
#    rsrc_typ = var.resource_type
#    env = var.environment
#    location = var.region_1
#    name_prefix = "${var.env_attribute["development"]}-${var.location_attribute["site1"]}"
#  }

# For using it in tags
locals {
  common_tags = {
    "deployment_method" = "terraform"
    "platform"= "ci/cd"
  }
}

# For defining subnet naming
locals {
  subnet-1_name = "${random_integer.random_number.result}-${random_string.randomstring.result}"
  subnet-2_name = "AzureBastionSubnet"
  subnet-3_name = "GatewaySubnet"
  subnet-4_name = "AppGwsubnet"
  subnet-5_name = "PrivateEndpointSubnet"
  subnet-6_name = "AzureFirewallSubnet"
  subnet-7_name= "AzureFirewallManagementSubnet"
}

# For NSG port values on subnet level

locals {
    nsg_ports = {
          "200" : "443"
          "201": "80"
          "202" : "222"
          "203": "33889"
    }
}