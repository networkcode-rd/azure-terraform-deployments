#Declaring Virtual Network via Variable
variable "vnet-name" {
    description = "Virtual Network Name"
    type = string
    default = "vnet-default"
 
}

#Virtual Network Address Space
variable "vnet-address-space" {
    description = "Address space for virtual network"
    type = list(string)
    default = [ "172.22.0.0/16"]
}

# Virtual Network Default Subnet Name
variable "vnet-default-subnet-name" {
    description = "Default Subnet for Virtual Network"
    type = string
    default = "default-subnet"
}

# Default Subnet Address Space
variable "default_subnet_address" {
  description = "Virtual Network default Subnet Address Spaces"
  type = list(string)
  default = ["172.22.0.0/24"]
}

# App Subnet Name
variable "app-subnet-name" {
  description = "Virtual Network App Subnet Name"
  type = string
  default = "app-subnet"
}
# App Subnet Address Space
variable "app-subnet-address" {
  description = "Virtual Network App Subnet Address Spaces"
  type = list(string)
  default = ["172.22.1.0/24"]
}


# # Bastion / Management Subnet Name
# variable "bastion-subnet-name" {
#   description = "Virtual Network Bastion Subnet Name"
#   type = string
#   default = "AzureBastionSubnet"
# }
# # Bastion / Management Subnet Address Space
# variable "bastion_subnet_address" {
#   description = "Virtual Network Bastion Subnet Address Spaces"
#   type = list(string)
#   default = ["172.19.2.0/24"]
# }