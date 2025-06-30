# 🚀 Azure VM Infrastructure with Terraform using `for_each`

This Terraform module provisions multiple Azure Linux virtual machines (VMs) along with supporting network resources (NICs, Load Balancer, Public IP) using the `for_each` meta-argument. Each VM and its related resources are created dynamically based on a map variable, allowing flexible scaling and easy VM indexing.

---

## 📦 What This Module Creates

- **Multiple Azure Linux VMs** with unique names and OS disks.
- **Network Interfaces (NICs)** assigned to each VM.
- **Azure Load Balancer** with health probe and backend pool.
- **Inbound NAT rules** per VM for SSH access.
- **Optional Load Balancer rules** for application traffic.
- All resources are tagged and named consistently.

---

## 📝 How It Works

The `for_each` meta-argument is used to iterate over the variable `var.app_vm_instance_count`, which is a map where each key represents a VM identifier (e.g., `vm1`, `vm2`).

Example variable definition:

\`\`\`hcl
variable "app_vm_instance_count" {
  description = "VMs to deploy with unique keys"
  type = map(string)
  default = {
    "vm1" = "001"
    "vm2" = "002"
  }
}
\`\`\`

This creates VMs named like:
Hybrid-Worksapce-Dev-app-linux-vm-vm1
Hybrid-Worksapce-Dev-app-linux-vm-vm2


With unique OS disks like:
Hybrid-Worksapce-Dev-app-linux-vm-vm1-osdisk
Hybrid-Worksapce-Dev-app-linux-vm-vm2-osdisk



Each VM gets a dedicated NIC associated with the backend pool and a NAT rule for SSH mapped to a dynamic frontend port.

---

## ✅ Prerequisites

- Terraform 1.2+
- Azure CLI authenticated with your subscription
- An existing Azure Resource Group

---

## 🚦 Usage

### Clone the module or copy the Terraform files, then create your own `terraform.tfvars`:

\`\`\`hcl
app_vm_instance_count = {
  "vm1" = "001"
  "vm2" = "002"
}
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

### Apply the deployment:

\`\`\`bash
terraform apply
\`\`\`

---

## ⚙️ Outputs

The module exports helpful outputs, including:

- List of NIC IDs
- Private IP addresses of the VMs
- Load Balancer frontend IP

---

## 🛡️ Security Note

- You **must** provide either a strong admin password or configure `admin_ssh_key` for secure SSH access.
- By default, VMs use a password, but it’s strongly recommended to use SSH keys in production.

---

## 📂 Files Included

- `main.tf` – Core infrastructure resources.
- `variables.tf` – Input variable definitions.
- `outputs.tf` – Exposed outputs for integrations.
- `terraform.tfvars` – Your instance-specific VM map.
- `README.md` – This documentation.

---

## 📝 License

This project is licensed under the MIT License. See the LICENSE file for details.
