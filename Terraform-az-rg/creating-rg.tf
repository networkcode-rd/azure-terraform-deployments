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
    subscription_id = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
    tenant_id       = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
}

resource "azurerm_resource_group" "new-tf-rg-2" {
  name     = "new-tf-rg-2"
  location = "Central India"
}