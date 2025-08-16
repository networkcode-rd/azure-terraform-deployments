# variable "department_name" {
#   description = "Descibing the department name/ declared in .tfvars"
#   type        = string
# }

# variable "environment_name" {
#   description = "Descibing the environment name/ declared in .tfvars"
#   type        = string
# }

variable "location_attribute" {
  description = "Descibing the location attribute in naming convention"
  type        = map(string)
  default = {
    "site1" = "CIN"
    "site2" = "EA"
    "site3" = "SEA"
    "site4" = "WE"
    "site5" = "EUS2"
  }
}

variable "region_1" {
  description = "describing region // declared in .tfvars"
  type        = string
}

variable "region_2" {
  description = "describing region // declared in .tfvars"
  type        = string
}

variable "region_3" {
  description = "describing region // declared in .tfvars"
  type        = string
}

variable "region_4" {
  description = "describing region // declared in .tfvars"
  type        = string
}

# variable "region_5" {
#   description = "describing region // declared in .tfvars"
#   type        = string
# }


# variable "team_name" {
#   description = "describing team in .tfvars"
#   type        = string
# }

# variable "resources_type" {
#   description = "describing type of resources in .tfvars"
#   type = string
# }


# App VM count
variable "app_vm_instance_count" {
  description = "We are creating number of VMs using for_each statement"
  type = map(string)
  default = {
    "vm1" = "001"
    "vm2" = "002"
  }
}

variable "vm_password" {
  description = "defining it in .tfvars"
  type = string
}

variable "update_in_main_name_rg" {
  description = "Update the RG value in .tfvar file under root"
  type = string
}

variable "update_in_main_location_rg" {
  description = "Update the RG value in .tfvar file under root"
  type = string
}

variable "update_in_main_location_subnet_dev_1" {
  description = "Update the RG value in .tfvar file under root"
  type = string
}

variable "update_in_main_location_vnet_dev_1" {
  description = "Update the RG value in .tfvar file under root"
  type = string
}