business_division          = "IT"
environment_variable       = "staging"
azure_resource_group_name  = "rg-az-net-nethub-tf"
azure_resources_location   = "Central India"

vnet_name                  = "vnet-default"
vnet_address_space         = ["172.19.0.0/16"]
vnet_default_subnet_name   = "default-subnet"
vnet_default_subnet_address = ["172.19.0.0/24"]
app_subnet_name            = "app-subnet"
app_subnet_address         = ["172.19.1.0/24"]
bastion_subnet_name        = "AzureBastionSubnet"
bastion_subnet_address     = ["172.19.2.0/24"]
