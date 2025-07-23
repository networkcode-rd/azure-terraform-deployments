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

# Variable for Azure VPN Gateway RG Location and Name
variable "var_vpn_rg_location" {
  description = " Variable for RG location assigned to VPN Gateway"
  type = string
}

# Variable for Azure VPN Gateway RG Location and Name
variable "var_vpn_rg_name" {
  description = " Variable for RG name assigned to VPN Gateway"
  type = string
}
# Mapping of Azure VPN Gw IP Configuration To A Gateway subnet variable
variable "var_vng_subnet" {
  description = "Variable for Gateway subnet mapped to IPconfig of VPN"
  type = string
}

variable "onprem_shared_key" {
  type      = string
  sensitive = true
  default = "dasdwqdae#"
}