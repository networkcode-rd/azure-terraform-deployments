# Azure Hub-Spoke Architecture with Firewall and NAT Gateway

This Terraform-based infrastructure deploys a secure and scalable Azure network topology using the **Hub-Spoke architecture**. The design supports controlled internet access, SSH isolation, and centralized routing through Azure Firewall.

## 📐 Architecture Overview

Image:
![alt text](image.png)


### 🔷 Components
- **Hub Virtual Network**
  - Azure Firewall
  - VPN Gateway
  - Subnet Peering to Spokes & Isolated Test VNet

- **Spoke Virtual Network**
  - App VMSS (Ubuntu)
  - Internal Load Balancer
  - Custom Route Table forwarding traffic to Azure Firewall

- **Isolated Test Virtual Network**
  - Ubuntu Test VMs
  - NAT Gateway for secure outbound-only internet access
  - VNet Peering with Hub
  - **SSH Access to Test VMs only through Hub**

- **Shared Resources**
  - Storage Account for blobs and VM diagnostics/logging

## 🧭 Traffic Flow

### 🌐 Internet Outbound (From Test VMs)
- Test VMs route internet-bound traffic via NAT Gateway
- Isolated from inbound access

### 🔒 SSH Management
- SSH access to **Test VMs** is restricted
- Only possible via Hub network (firewall-controlled)

### 🌍 Spoke Traffic Routing
- Spoke VMs (VMSS) route internet-bound traffic through **Azure Firewall** using a default route (`0.0.0.0/0`) set via custom route table.

### ↔ Private Traffic
- VNet Peering allows private communication between:
  - Hub ↔ Spoke
  - Hub ↔ Isolated Test VNet

## 🔐 Security Principles

- **Zero Trust SSH:** No direct public IPs on Test or App VMs
- **Centralized Internet Control:** All internet traffic egresses via NAT Gateway (Isolated VNet) or Azure Firewall (Spoke)
- **Network Segmentation:** Clear separation of testing, application, and control planes

## ⚙️ Naming Convention

All resources follow the naming format:  
<Environment>-<RegionCode>-<ResourceType>


---

## 📌 Notes

- Ensure route tables and peering are explicitly defined for correct traffic flow.
- Sensitive variables like `vm-password` must be passed securely (via environment variables or prompting).
- Diagnostics and logging can be enhanced via the storage account or Azure Monitor integration.

---

