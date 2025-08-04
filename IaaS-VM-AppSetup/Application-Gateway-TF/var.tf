variable "department_name" {
  description = "Descibing the department name/ declared in .tfvars"
  type        = string
}

variable "environment_name" {
  description = "Descibing the environment name/ declared in .tfvars"
  type        = string
}

variable "location_attribute" {
  description = "Descibing the location attribute in naming convention"
  type        = map(string)
  default = {
    "site1" = "CIN"
    "site2" = "SEA"
    "site3" = "EA"
    "site4" = "WE"
    "site5" = "EUS2"
  }
}

variable "region_only_1" {
  description = "describing region // declared in .tfvars"
  type        = string
}

variable "region_only_2" {
  description = "describing region // declared in .tfvars"
  type        = string
}

variable "region_only_3" {
  description = "describing region // declared in .tfvars"
  type        = string
}

variable "region_only_4" {
  description = "describing region // declared in .tfvars"
  type        = string
}

variable "region_only_5" {
  description = "describing region // declared in .tfvars"
  type        = string
}



# Defnining Variables for Appgw resources

variable "frontend_port" {
  description = "defining port value"
  type        = string
}

variable "frontend_ip_configuration_name" {
  description = "defining ip Prvt config name in tfvars"
  type        = string
}

variable "private_app_gw_ip" {
  description = "describing the value of static IP in tfvars"
  type        = string
}

variable "frontend_ip_configuration_name_Pub" {
  description = "name for Public IP defined in tfvars"
}

variable "backend_address_pool_name_lnx" {
  description = "defining backend pool of linux in tfvars"
  type        = string
}

variable "http_setting_name_lnx" {
  description = "defining http setting name in tfvars for linux"
  type        = string
}

variable "listener_name_session_a" {
  description = "defining listener name in tfvars"
  type        = string
}


variable "backend_address_pool_name_win" {
  description = "defining backend pool of windows in tfvars"
  type        = string
}

variable "http_setting_name_win" {
  description = "defining http setting name in tfvars for windows"
  type        = string
}

variable "request_routing_rule_name" {
  description = "defining routing rule name in tfvars"
  type        = string
}