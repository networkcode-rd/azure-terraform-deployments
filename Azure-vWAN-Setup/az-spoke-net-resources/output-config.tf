# Defining output values of VNet, Subnet, NSG of Dev

output "dev_vnet_output_id" {
  value = azurerm_virtual_network.dev_vnet.id
}

output "dev_vnet_ouput_name" {
  value = azurerm_virtual_network.dev_vnet.name
}

output "dev_vnet_subnet_id" {
  value = azurerm_subnet.dev_subnet_1.id
}

output "dev_vnet_nsg_id" {
  value = azurerm_network_security_group.dev-sub-nsg.id
}


# Defining output values of VNet, Subnet, NSG of Prod
output "nsg_output_sub1" {
  value = azurerm_network_security_group.prd-sub1-nsg.id
}


output "nsg_output_sub2" {
  value = azurerm_network_security_group.prd-sub2-nsg.id
}

output "nsg_output_sub3" {
  value = azurerm_network_security_group.prd-sub3-nsg.id
}

output "out_vnet_prd" {
  value = azurerm_virtual_network.prod_vnet.id
}

output "out_sub_1_prod" {
  value = azurerm_subnet.prd_subnet_1.id
}

output "out_sub_2_prod" {
  value = azurerm_subnet.prd_subnet_2.id
}

output "out_sub_3_prod" {
  value = azurerm_subnet.prd_subnet_3.id
}

# Defining output values of VNet, Subnet, NSG of QA