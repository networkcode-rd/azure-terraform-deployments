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

variable "region_5" {
  description = "describing region // declared in .tfvars"
  type        = string
}


variable "team_name" {
  description = "describing team in .tfvars"
  type        = string
}

variable "resources_type" {
  description = "describing type of resources in .tfvars"
  type        = string
}

variable "vnet_address_dev" {
  description = "defining in .tfvars"
  type        = list(string)
}

variable "vnet_address_qa" {
  description = "defining in .tfvars"
  type        = list(string)
}

variable "vnet_address_prd" {
  description = "defining in .tfvars"
  type        = list(string)
}

variable "vnet_address_stg" {
  description = "defining in .tfvars"
  type        = list(string)
}


# variable "vnet_rg_placeholder_name" {
#   description = "defining Azure VNet RG placeholder"
#   type        = string
# }

# variable "vnet_rg_placeholder_location" {
#   description = "defining Azure VNet RG placeholder"
#   type        = string
# }


variable "sbnet_address_1" {
  description = "describing it in .tfvars"
  type        = list(string)
}


variable "src_add_hm_isp" {
  description = "IP address of your home ISP define it in .tfvars"
  type        = string
}

variable "sbnet_address_1_prd" {
  description = "describing it in .tfvars"
  type        = list(string)
}

variable "sbnet_address_2_prd" {
  description = "describing it in .tfvars"
  type        = list(string)
}

variable "sbnet_address_3_prd" {
  description = "describing it in .tfvars"
  type        = list(string)
}

variable "vm_password" {
  description = "put it when prompted"
  type        = string
  sensitive   = true
}

# Alternate Prod VNetconfiguration ===============================
variable "vnet_address_app_prd" {
  description = "describing type of resources in .tfvars"
  type = list(string)
}

variable "sbnet_address_1_app_prd" {
  description = "describing type of resources in .tfvars"
  type = list(string)  
}

variable "sbnet_address_appgw_2_prd" {
  description = "describing type of resources in .tfvars"
  type = list(string)  
}


# App Prod configuration ===============================


# variable "ph_app_subnet_id" {
#   description = "describing type of resources in .tfvars"
#   type = string
# }


# variable "ph_virtual_network" {
#   description = "describing type of resources in .tfvars"
#   type = string  
# }

# variable "vm_passwrd" {
#   description = "defining password in child module"
#   type = string
#   sensitive = true
#   default = "Testing@123456"
# }


# variable "ph_subnet_appgw_id" {
#   description = "describing type of resources in .tfvars"
#   type = string
# }