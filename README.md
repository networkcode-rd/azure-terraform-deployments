# azure-terraform-deployments
IaC: Deploy using Terraform in Azure


# Project with Azure Resources

# Note:
Use a .tf file with either name as main.tf or dependency.tf or example.tf in your root directory of every Terraform project where you can declare the provider:-

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">4.0.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">3.0.0"
    }
  }
}



provider "azurerm" {
  features {}
}

