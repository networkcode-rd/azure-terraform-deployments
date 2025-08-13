# Defining output values of VNet, Subnet, NSG of Dev

output "dev_vnet_output_id" {
  value = module.calling_vnet_resources.dev_vnet_output_id
}

output "dev_vnet_ouput_name" {
  value = module.calling_vnet_resources.dev_vnet_ouput_name
}

output "dev_vnet_subnet_id" {
  value = module.calling_vnet_resources.dev_vnet_subnet_id
}

output "dev_vnet_nsg_id" {
  value = module.calling_vnet_resources.dev_vnet_nsg_id
}


# Defining output values of VNet, Subnet, NSG of Prod
output "nsg_output_sub1" {
  value = module.calling_vnet_resources.nsg_output_sub1
}


output "nsg_output_sub2" {
  value = module.calling_vnet_resources.nsg_output_sub2
}

output "nsg_output_sub3" {
  value = module.calling_vnet_resources.nsg_output_sub3
}

output "out_vnet_prd" {
  value = module.calling_vnet_resources.out_vnet_prd
}


output "out_sub_1_prod" {
  value = module.calling_vnet_resources.out_sub_1_prod
}

output "out_sub_2_prod" {
  value = module.calling_vnet_resources.out_sub_2_prod
}

output "out_sub_3_prod" {
  value = module.calling_vnet_resources.out_sub_3_prod
}