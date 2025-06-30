# 🚀 Azure VM Infrastructure with Terraform using `count`

This Terraform module demonstrates creating multiple Azure Linux virtual machines (VMs) using the `count` meta-argument. Each VM and its supporting resources (NICs, Load Balancer, Public IP) are replicated based on the specified instance count, making it easy to scale horizontally with simple configuration.

> ⚠️ **Disclaimer**  
> The current configuration will **not successfully create VMs** because of errors in the VM password declaration and OS disk configuration. You must fix these issues before applying this module.

---

## 📦 What This Module Creates

- **Multiple Azure Linux VMs**: Provisioned with a fixed number defined by `count`.
- **Network Interfaces (NICs)** assigned to each VM.
- **Azure Load Balancer** with backend pool, health probes, and optional NAT rules.
- All resources use consistent naming conventions for easy management.

---

## 📝 How It Works

The `count` meta-argument is used to define how many identical VMs you want to deploy. Terraform creates resources indexed by `count.index`.

Example variable definition:

\`\`\`hcl
variable "app_vm_instance_count" {
  description = "Number of identical VMs to deploy"
  type        = number
  default     = 2
}
\`\`\`

Then, in your VM resource:

\`\`\`hcl
resource "azurerm_linux_virtual_machine" "app-linux-vm" {
  count                = var.app_vm_instance_count
  name                 = "${local.resource_name_prefix}-app-linux-vm-${count.index + 1}"
  # ...
}
\`\`\`

This will create VMs like:

Hybrid-Worksapce-Dev-app-linux-vm-1
Hybrid-Worksapce-Dev-app-linux-vm-2


---

## ✅ Prerequisites

- Terraform 1.2+
- Azure CLI authenticated with your subscription
- An existing Azure Resource Group

---

## 🚦 Usage

### Clone the module or copy the Terraform files, then create your own `terraform.tfvars`:

\`\`\`hcl
app_vm_instance_count = 2
\`\`\`

### Initialize Terraform:

\`\`\`bash
terraform init
\`\`\`

### Validate the configuration:

\`\`\`bash
terraform validate
\`\`\`

### Plan your changes:

\`\`\`bash
terraform plan
\`\`\`

### Apply the deployment (if VM errors are fixed):

\`\`\`bash
terraform apply
\`\`\`

---

## ⚙️ Outputs

The module can export outputs like:

- List of VM private IPs
- NIC IDs for each VM
- Load Balancer frontend IP

---

## 🛡️ Security Note

- By default, password-based authentication is configured, but it currently contains errors you must resolve.
- You **should** use SSH keys instead of passwords for secure production deployments.

---

## ⚠️ Known Issues

- **VM password variable** has syntax or logic errors preventing deployment.
- **OS disk name** may cause conflicts across multiple VMs if not properly indexed with `count.index`.

**You must fix these before applying the module.**

---

## 📂 Files Included

- `main.tf` – Core resources using `count`. (although you will not find this file in this Github repo, I have hidden it)
- `variables.tf` – Input variable definitions.
- `outputs.tf` – Outputs for integration.
- `terraform.tfvars` – Your instance count configuration. (although you will not find this file in this Github repo, I have hidden it)
- `README.md` – This documentation.

---

## 📝 License

This project is licensed under the MIT License. See the LICENSE file for details.