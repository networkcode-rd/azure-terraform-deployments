terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">=4.32.0"
    }
  }
}

# Provider-1 for Central India (Default Provider)
provider "azurerm" {
    features {} # Configuration options
    subscription_id = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
    tenant_id       = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
}

# Provider-2 for South India
provider "azurerm" {
  features {
    virtual_machine {
      delete_os_disk_on_deletion = false # This will ensure when the Virtual Machine is destroyed, Disk is not deleted, default is true and we can alter it at provider level 
    }
  }
  alias = "provider2-southindia"
  #client_id = "XXXX"
  #client_secret = "YYY"
  #environment = "german"
  #subscription_id = "JJJJ"
    subscription_id = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
    tenant_id       = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" 

}


# Create a resource group in EastUS region - Uses Default Provider
resource "azurerm_resource_group" "tf-rg-1" {
  name = "tf-rg-1"
  location = "Central India"
}

#Create a resource group in WestUS region - Uses "provider2-westus" provider
resource "azurerm_resource_group" "tf-rg-2" {
  name = "tf-rg-2"
  location = "South India"
  provider = azurerm.provider2-southindia
}