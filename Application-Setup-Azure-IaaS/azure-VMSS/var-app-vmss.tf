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

variable "vmss_resource_group_name" {
  description = "defining the RG in the root module"
  type        = string
}

variable "vmss_resource_group_location" {
  description = "defining the RG location in the root module"
  type = string
}

variable "vm-password" {
  description = "Password for VM"
  sensitive = true
  type = string
}

variable "vm-username" {
  description = "Username for VM"
  sensitive = true
  type = string
}


variable "mapping_vmss_to_lb" {
  description = "Mapping VMSS to Az internal LB"
  type = string
}

variable "vmss_ip_config_frm_subnet" {
  description = "configuring IP for VMSS - private addresses"
  type = string
}