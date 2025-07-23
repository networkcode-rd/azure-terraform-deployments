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

# # Az-BU
# variable "business_unit" {
#   description = "Defining Buisness Unit"
#   type = string
#   default = "networkcode-core"
# }

# Az-env-1
variable "env-1" {
  description = "Defining IT department"
  type        = string
  default     = "Staging"
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
  default     = "Prod"
}

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

# variable "vm-password" {
#   description = "Password for VM"
#   sensitive = true
#   type = string
# }

# variable "vm-username" {
#   description = "Username for VM"
#   sensitive = true
#   type = string
# }
