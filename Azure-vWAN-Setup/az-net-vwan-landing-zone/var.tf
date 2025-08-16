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


variable "team_name" {
  description = "describing team in .tfvars"
  type        = string
}

variable "resources_type" {
  description = "describing type of resources in .tfvars"
  type        = string
}

variable "ph_name_rg" {
  description = "place holder for using RG name"
  type        = string
}

variable "ph_location_rg" {
  description = "place holder for using RG location"
  type        = string
}

variable "remote_vnet_from_EaVhub" {
  description = "place holder for creating the VNet connection using remote VNet"
  type        = string
}

variable "remote_vnet_from_CIVhub" {
  description = "place holder for creating the VNet connection using remote VNet"
  type        = string
}