variable "natgw_rg_name" {
  description = "RG manifestation - fetch from the root module"
  type = string
}

variable "natgw_rg_location" {
  description = "RG manifestation - fetch from the root module"
  type = string
}

variable "natgw_sku" {
  description = "NAT Gateway SKU"
  type = string
  default = "Standard"
}


variable "natgw_pub_IP_allocation" {
  description = "Public IP SKU"
  type = string
  default = "Static"
}