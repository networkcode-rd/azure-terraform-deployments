variable "department_name" {
  description = "Descibing the department name/ declared in .tfvars"
  type        = string
}

variable "environment_name" {
  description = "Descibing the environment name/ declared in .tfvars"
  type        = string
}

variable "location_attribute" {
  description = "Descibing the location attribute in naming convention"
  type        = map(string)
  default = {
    "site1" = "CIN"
    "site2" = "SEA"
    "site3" = "EA"
    "site4" = "WE"
    "site5" = "EUS2"
  }
}

variable "region_only_1" {
  description = "describing region // declared in .tfvars"
  type        = string
}

variable "region_only_2" {
  description = "describing region // declared in .tfvars"
  type        = string
}

variable "region_only_3" {
  description = "describing region // declared in .tfvars"
  type        = string
}

variable "region_only_4" {
  description = "describing region // declared in .tfvars"
  type        = string
}

variable "region_only_5" {
  description = "describing region // declared in .tfvars"
  type        = string
}



variable "vnet_information_linux" {
  description = "passing the VNet value of Linux VM"
  type = string
  default = "/subscriptions/bec0324e-4ff3-4e18-8d7b-2741bb57234f/resourceGroups/eng-staging-CIN-tf-rg/providers/Microsoft.Network/virtualNetworks/eng-staging-CIN-vnet-tf"
}

variable "bep_ipadresses" {
  description = "describing final value from modules"
  type = string
  default = "10.30.0.4"
}


# variable "vnet_id_windows" {
#   description = "passing the VNet ID"
#   type = string
#   default = "/subscriptions/bec0324e-4ff3-4e18-8d7b-2741bb57234f/resourceGroups/devnet-cenin-tf-rg/providers/Microsoft.Network/virtualNetworks/devnet-vnet-tf"
# }

# variable "ip_address_windows" {
#   description = "passing the VM IP"
#   type = string
#   default = "10.1.0.4"
# }