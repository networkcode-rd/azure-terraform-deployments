# azure-terraform-deployments

## IaC: Deploy Using Terraform in Azure

This project contains examples of provisioning Azure infrastructure using Terraform. It demonstrates how to define and deploy various Azure resources like virtual machines, network interfaces, virtual networks, and more.

---

## 📁 Project Structure

This particular folder focuses on:

- Creating **Windows Server 2022 virtual machines**
- One standard VM deployment
- One deployment using Terraform's **meta-argument `count`**
- Automating IIS and Telnet installation using VM extensions

The infrastructure layout is shown below:

![Azure VM Architecture](./devnet-cenin-tf-rg.png)

---

## 🔧 Notes for Usage

Make sure to include a Terraform file (e.g., `main.tf`, `dependency.tf`, or `example.tf`) in the **root directory** of every Terraform project. This file should declare the required providers and initialize the provider block.

### Example `main.tf` (provider declaration)

```hcl
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
