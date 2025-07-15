# Terraform Project: Azure VMSS with Load Balancer

This Terraform configuration sets up a complete **Azure Virtual Machine Scale Set (VMSS)** environment with an **External Load Balancer (ELB)**. It includes networking components, security rules, public IP, and probes to expose traffic to backend VMs.

---

## 📁 Project Structure

├── main.tf # Root Terraform configuration (calls modules)
├── variables.tf # Input variables
├── outputs.tf # Output values
├── terraform.tfvars # Variable values
├── 01-resource-group.tf # Resource Group
├── 02-network.tf # Virtual Network & Subnets
├── 03-subnet-nsg.tf # NSG & Subnet NSG association
├── 04-public-ip.tf # Public IP for Load Balancer
├── 05-vmss.tf # Virtual Machine Scale Set configuration
├── 06-vmss-nic.tf # Network interface setup for VMSS
├── 07-load-balancer.tf # Load Balancer, backend pool, probe, and LB rule
├── locals.tf # Local values and tags