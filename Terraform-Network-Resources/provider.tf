terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">=4.33.0"
    }
  }
}

provider "azurerm" {
    features {}
  subscription_id = "bec0324e-4ff3-4e18-8d7b-2741bb57234f"
  tenant_id       = "5bb19d03-7f41-4ea0-bce6-d62f8e15f1e6"
}