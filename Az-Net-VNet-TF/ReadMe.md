# Deploy Azure Linux VM with Terraform

Building vanilla Azure Virtual Network in a Resource Group by defining variables.

## 🚀 Outcome

- Creation of Resource Group
- Creation of Azure Virtual Network and Subnet.
- Creation of NSG.
- Creation of Linux VM(Ubuntu)
- Accessing sample application on new Linux VM.
- Deploying Azure Bastion related services(Subnet and NSG)
- Creation of Azure Bastion
- Creation of Azure LB and mapping the existing Linux VM in the Azure LB. Azure LB is of external Standard.
- Create NAT rule on the existing LB to login to your VM on custom port.

Note: Please make sure the version and documentation are referred before trying to use the code block in your environment.

Terraform Version: 1.11.x