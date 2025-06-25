# Virtual Network Name output file
output "vnet-id" {
  description = "The Name of the Virtual Network"
  value       = azurerm_virtual_network.VNet.name
}

# Virtual Network ID output file
output "vnet_id" {
  description = "The ID of the Virtual Network"
  value       = azurerm_virtual_network.VNet.id
}


#subnet Name output name 
output "subnet_name" {
  description = "The Name of the Subnet"
  value       = azurerm_subnet.app-tier-subnet.name
}

#subnet ID output name
output "subnet_id" {
  description = "The ID of the Subnet"
  value       = azurerm_subnet.app-tier-subnet.id
}

#output frontend PubIP
output "lb-pub-IP" {
  description = "Value of the Public IP of Azure LB or Frontend IP"
  value = azurerm_public_ip.lb-pip
}

# Load Balancer ID
output "azure-lb_id" {
  description = "Value of Az LB ID"
  value = azurerm_lb.azure-std-lb-ext.id
}

