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

# Az-BU
variable "business_unit" {
  description = "Defining Buisness Unit"
  type        = string
  default     = "networkcode-core"
}

# Az-env-1
variable "env-1" {
  description = "Defining IT department"
  type        = string
  default     = "IT"
}

# Az-env-2
variable "env-2" {
  description = "Defining Developer department"
  type        = string
  default     = "Dev"
}

# Az-env-3
variable "env-3" {
  description = "Defining Sales department"
  type        = string
  default     = "sales"
}

# Az-rg-name
variable "resource-grp-custom-name" {
  description = "RG value input as starting alias"
  type        = string
  default     = "rg-cs-tf"
}

# Az-location
variable "resource-location-def-ci" {
  description = "Resource deployment locaiton"
  type        = string
  default     = "Central India"
}

# Az-vm-passwd
variable "vm-passwrd" {
  description = "Password for Azure VM"
  sensitive   = true
}

# VNet Name

variable "vnet-name" {
  description = "VNet Naming"
  type        = string
  default     = "vnet-tf"
}


variable "vnet-address-space" {
  description = "vnet-address-space"
  type        = list(string)
  default     = ["172.30.0.0/16"]
}

variable "subnet_default" {
  description = "we will keep all the VMSS scale sets here"
  type        = list(string)
  default     = ["172.30.0.0/24"]
}

variable "nsg_network_ports" {
  description = "incoming ports to access VMSS"
  type        = list(string)
  default     = [22, 443, 80]
}