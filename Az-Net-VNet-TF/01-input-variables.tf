# Generic Input Variables
# Business Division
variable "buisness_division" {
  description = "Business Division"
  type        = string
  default = "IT"
}
# Environment Variable
variable "environment" {
  description = "We will use this variable to define the environment for the resources"
  default = "staging"
  type = string
}
# Azure Resource Group Name
variable "resource_group_name"{
  description = "This is a RG hosted in Central India Location"
  default = "rg-az-net-nethub-tf"
  type = string

}
# Azure Resources Location
variable "resource_group_location" {
  description = "This is the location detail"
  default = "Central India"
  type = string
}