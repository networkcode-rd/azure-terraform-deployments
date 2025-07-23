# Input variable definitions

# variable "storage_account_name" {
#   description = "The name of the storage account"
#   type        = string
# }

variable "storage_account_replication_type" {
  description = "Storage Account Replication Type"
  type        = string
#   default = "LRS"
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "account_tier" {
  type = string
  default = "Standard"
}

variable "storage_account_kind" {
  description = "Storage Account Kind"
  type        = string
  default = "StandardV2"
}

variable "static_website_index_document" {
  description = "static website index document"
  type        = string
}
variable "static_website_error_404_document" {
  description = "static website error 404 document"
  type        = string
}

variable "container_name_1" {
  description = "Storage container for Static Website"
  type = string
  default = "staticwebcontainer"
}

variable "blob_source_path" {
  type        = string
  description = "Path to the blob source file"
}

