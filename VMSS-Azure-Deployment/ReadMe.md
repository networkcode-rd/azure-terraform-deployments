# Terraform Project: Azure VMSS with Load Balancer

This Terraform configuration sets up a complete **Azure Virtual Machine Scale Set (VMSS)** environment with an **External Load Balancer (ELB)**. It includes networking components, security rules, public IP, and probes to expose traffic to backend VMs.

---

## 📁 Project Structure
# Terraform Azure VMSS Setup with Load Balancer

This Terraform configuration creates the following:

- Azure Resource Group
- Virtual Network and Subnet
- Network Security Group with dynamic security rules
- Public IP for Load Balancer
- Azure Load Balancer (Standard SKU)
  - Frontend IP
  - Backend pool
  - Health probe
  - LB rule
- Azure Virtual Machine Scale Set (VMSS)
  - Custom Linux VMs
  - Attached to backend pool

## Usage

1. Clone this repository.
2. Update `terraform.tfvars` with your values.
3. Initialize and apply:

```bash
terraform init
terraform apply
