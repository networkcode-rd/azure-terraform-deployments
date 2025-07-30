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


variable "vnet_address_space" {
  description = "describing final value in .tfvars"
  type        = string
}


variable "sub1_address_space" {
  description = "describing final value in .tfvars"
  type        = string
}

variable "sub2_address_space" {
  description = "describing final value in .tfvars"
  type        = string
}

variable "admin_username" {
  description = "prompt will come on the screen for input"
  sensitive   = false
  type        = string
}

variable "vm_password" {
  description = "prompt will come on the screen for input"
  sensitive   = true
  type        = string
}

variable "source_address_prefix" {
  description = "Define when prompted"
  type        = string
}


variable "var_instance_count" {
  description = "defining the number of instances"
  type        = map(string)
  default = {
    "lin-vm-1" = "101"
    "lin-vm-2" = "102"
  }
}