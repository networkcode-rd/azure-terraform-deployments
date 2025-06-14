# Resource-1: Azure Resource Group
resource "azurerm_resource_group" "tf-myrg-1" {
  name = "tf-myrg-1"
  location = "East US"
}

# Resource-2: Random String 
resource "random_string" "myrandom" {
  length = 10
  upper = false 
  special = false
}

# Resource-3: Azure Storage Account 
resource "azurerm_storage_account" "rdstoragetf" {
  name                     = "rdstoragetf${random_string.myrandom.id}"
  resource_group_name      = azurerm_resource_group.tf-myrg-1.name
  location                 = azurerm_resource_group.tf-myrg-1.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  #account_encryption_source = "Microsoft.Storage"

  tags = {
    environment = "staging"
  }
}