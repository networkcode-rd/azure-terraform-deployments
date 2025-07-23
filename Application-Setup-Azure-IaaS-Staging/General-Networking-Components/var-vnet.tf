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

variable "vnet_resource_group_name" {
  description = "defining the RG in the root module"
  type        = string
}

variable "vnet_resource_group_location" {
  description = "defining the RG location in the root module"
}

variable "app_subnet_nsg_in_ports" {
  description = "App VMSS NSG Inbound Ports"
  type        = list(string)
  default     = [22, 80, 443]
}


# For next hop IP address in UDR

variable "var_next_hop_in_ip_address" {
  description = "Pointing to Azure Firewall once created"
  type = string
}