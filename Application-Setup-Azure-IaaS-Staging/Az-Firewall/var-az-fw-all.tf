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
  default     = "Staging"
}


# Az-location
variable "region-1" {
  description = "Resource deployment locaiton"
  type        = string
  default     = "centralindia"
}

# Az Firewall and Policy RG and location

variable "var_azfw_rg_name" {
  description = "Used for AzFw and Fw policy and it's respective RG name"
  type = string
}

variable "var_azfw_rg_location" {
  description = "Used for AzFw and Fw policy and it's respective RG location"
  type = string
}


variable "var_azfw_subnet" {
  description = "For AzFw subnet value"
  type = string
}