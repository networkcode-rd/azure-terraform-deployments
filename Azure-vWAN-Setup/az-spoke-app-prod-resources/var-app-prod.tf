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
    "site2" = "EA"
    "site3" = "SEA"
    "site4" = "WE"
    "site5" = "EUS2"
  }
}

# variable "region_1" {
#   description = "describing region // declared in .tfvars"
#   type        = string
# }

variable "region_2" {
  description = "describing region East Asia related // declared in .tfvars"
  type        = string
}


variable "team_name" {
  description = "describing team in .tfvars"
  type        = string
}

variable "resources_type" {
  description = "describing type of resources in .tfvars"
  type = string
}

variable "ph_resource_group_location" {
  description = "describing type of resources in .tfvars"
  type = string
}

variable "ph_resource_group_name" {
  description = "describing type of resources in .tfvars"
  type = string
}

variable "ph_app_subnet_id" {
  description = "describing type of resources in .tfvars"
  type = string
}


variable "ph_virtual_network" {
  description = "describing type of resources in .tfvars"
  type = string  
}

variable "vm_passwrd" {
  description = "defining password in child module"
  type = string
  sensitive = true
  default = "Testing@123456"
}


variable "ph_subnet_appgw_id" {
  description = "describing type of resources in .tfvars"
  type = string
}


variable "private_dns_zone_name" {
  description = "describing type of resources in .tfvars"
  type = string
}