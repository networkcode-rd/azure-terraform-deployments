# Az-regional-abbv
variable "regional_abbrv" {
  type = map(string)
  default = {
    "centralindia"  = "cenin"
    "southeastasia" = "sea"
    "northeurope"   = "neu"
    "eastus2"       = "eus2"
  }
}

# Az-env-1
variable "env-1" {
  description = "Defining IT department"
  type        = string
  default     = "stg"
}

# # Az-env-2
# variable "env-2" {
#   description = "Defining Developer department"
#   type = string
#   default = "Dev"
# }

# # Az-env-3
# variable "env-3" {
#   description = "Defining Sales department"
#   type = string
#   default = "prd"
# }

# # Az-rg-name
# variable "resource-grp-custom-name" {
#   description = "RG value input as starting alias"
#   type = string
#   default = "rg-cs-tf"
# }

# Az-location
variable "region-1" {
  description = "Resource deployment locaiton"
  type        = string
  default     = "centralindia"
}

# Az-location
variable "region-2" {
  description = "Resource deployment locaiton"
  type        = string
  default     = "southeastasia"
}

# Az-location
variable "region-3" {
  description = "Resource deployment locaiton"
  type        = string
  default     = "northeurope"
}

# Az-location
variable "region-4" {
  description = "Resource deployment locaiton"
  type        = string
  default     = "eastus2"
}

variable "pe_resource_group_name" {
  description = "defining the RG in the root module"
  type        = string
}

variable "pe_resource_group_location" {
  description = "defining the RG location in the root module"
  type = string
}


variable "pe_subnet_link_connection_var_id" {
  description = "linking the Private Endpoint to VNet subnet ID"
  type = string
}

variable "pe_storage_link_var_id" {
  description = "linking storage to PE ID"
  type = string
}

variable "virtual_network_dns_id" {
  description = "linking DNS and VNet ID"
  type = string
}