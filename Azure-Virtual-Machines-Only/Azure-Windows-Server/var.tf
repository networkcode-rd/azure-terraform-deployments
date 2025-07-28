variable "department" {
  default = "staging"
  type    = string
}

variable "env-1" {
  default = "devnet"
  type    = string
}

variable "env-2" {
  default = "networking"
  type    = string
}

variable "business" {
  default = "networkcode"
  type    = string
}


variable "site" {
  default = "CentralIndia"
  type    = string
}


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

variable "address_space" {
  description = "Passing VNet value through .tfvars"
  type        = string
}
variable "server_subnet_var" {
  description = "Passing subnet value through .tfvars"
  type        = string
}


variable "server_alt_subnet_var" {
  description = "Passing Alternate subnet value through .tfvars"
  type        = string
}

variable "meta_argu_vm" {
  description = "Number of VMs"
  default     = 1
  type        = number
}

variable "var_win_username" {
  description = "Put the username"
  type = string
  sensitive = false
}

variable "var_win_pswd" {
  description = "Put the password"
  type = string
  sensitive = true
}

variable "var_source_ip_address" {
  description = "Put the source IP address to put it in NSG"
  type = string
  sensitive = false
}