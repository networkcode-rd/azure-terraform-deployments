variable "location_attribute" {
  description = "Descibing the location attribute in naming convention"
  type        = map(string)
  default = {
    "site1" = "CIN"
    "site2" = "EA"
    "site3" = "SEA"
    "site4" = "WE"
  }
}

variable "env_attribute" {
  description = "Descibing the location attribute in naming convention"
  type        = map(string)
  default = {
    "development" = "dev"
    "production"  = "prd"
    "QA"          = "qa"
    "staging"     = "stg"
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


variable "vnet_rg_placeholder_name" {
  description = "defining Azure VNet RG placeholder"
  type        = string
}

variable "vnet_rg_placeholder_location" {
  description = "defining Azure VNet RG placeholder"
  type        = string
}


variable "sbnet_address_1" {
  description = "describing it in .tfvars"
  type        = list(string)
}


variable "src_add_hm_isp" {
  description = "IP address of your home ISP define it in .tfvars"
  type = string
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