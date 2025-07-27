# azure-terraform-deployments

## IaC: Deploying Azure Infrastructure Using Terraform

This repository contains multiple Infrastructure as Code (IaC) modules for provisioning Azure resources using Terraform. Each folder within the repository focuses on a specific Azure service or deployment pattern.

---

## 📁 Project Structure

The projects in this repository cover various Azure IaaS scenarios, including:

- Creating **Virtual Machines** (Windows Server 2022 and Ubuntu)
  - Standard single VM deployments
  - Scaled VM deployments using Terraform's **meta-argument `count`**
- Provisioning **Networking components** such as:
  - Virtual Networks (VNet)
  - Subnets
  - Network Security Groups (NSG)
  - Public IPs and NICs
- Deploying **Azure services** such as:
  - Application Gateway (AppGw)
  - Azure Firewall (AzFw)
  - VPN Gateway
- Managing **Resource Groups** and other foundational resources
- Automating post-deployment configuration via **VM Extensions**
  - Example: Installing IIS and Telnet on Windows VMs

Each folder is self-contained with relevant Terraform files and documentation to guide usage.

---

## 🔧 How to Use

Ensure that every project folder contains at least one of the following Terraform files in its root:

- `main.tf`
- `example.tf`
- `dependency.tf`

These files must define the required providers and initialization configuration.

### Example Provider Configuration

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
