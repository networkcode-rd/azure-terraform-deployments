# Generic Input Variables
# Business Division
variable "buisness_division" {
  description = "Business Division"
  type        = string
  default = "Hybrid-Worksapce"
}
# Environment Variable
variable "environment" {
  description = "We will use this variable to define the environment for the resources"
  default = "Dev"
  type = string
}
# Azure Resource Group Name
variable "resource_group_name"{
  description = "This is a RG hosted in Central India Location"
  default = "rg-tf"
  type = string

}
# Azure Resources Location
variable "resource_group_location" {
  description = "This is the location detail"
  default = "Central India"
  type = string
}

# App Linux VM Instance Count
variable "app_linuxvm_instance_count" {
  description = "App Linux VM Instance Count"
  type = number 
  default = 1
}

# App LB Inbout NAT Port for All VMs
variable "lb_inbound_nat_ports" {
  description = "App LB Inbound NAT Ports List"
  type = list(string)
  default = ["222", "322", "422", "522", "622"]
}

variable "vm_password" {
  description = "Admin password for the VM"
  sensitive   = true
}
