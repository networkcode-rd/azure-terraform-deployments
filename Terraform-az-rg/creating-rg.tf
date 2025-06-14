terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.32.0"
    }
  }
}

provider "azurerm" {
    features {} # Configuration options
    subscription_id = "bec0324e-4ff3-4e18-8d7b-2741bb57234f"
    tenant_id       = "5bb19d03-7f41-4ea0-bce6-d62f8e15f1e6"
}

resource "azurerm_resource_group" "new-tf-rg-2" {
  name     = "new-tf-rg-2"
  location = "Central India"
}