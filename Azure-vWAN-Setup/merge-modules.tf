module "calling_vnet_resources" {
  source = "./az-spoke-net-resources"
  vnet_rg_placeholder_location = azurerm_resource_group.vwan_setup_rg.location
  vnet_rg_placeholder_name = azurerm_resource_group.vwan_setup_rg.name
  sbnet_address_1   = var.sbnet_address_1
  region_1          = var.region_1
  region_2          = var.region_2
  region_3          = var.region_3
  region_4          = var.region_4
  vnet_address_qa   = var.vnet_address_qa
  vnet_address_prd  = var.vnet_address_prd
  vnet_address_dev  = var.vnet_address_dev
  vnet_address_stg  = var.vnet_address_stg
  src_add_hm_isp    = var.src_add_hm_isp
  sbnet_address_1_prd = var.sbnet_address_1_prd
  sbnet_address_2_prd = var.sbnet_address_2_prd
  sbnet_address_3_prd = var.sbnet_address_3_prd
}

module "calling_az_spoke_dev_resources" {
  source = "./az-spoke-dev-resources"
  update_in_main_name_rg = azurerm_resource_group.vwan_setup_rg.name
  update_in_main_location_rg = azurerm_resource_group.vwan_setup_rg.location
  update_in_main_location_subnet_prd_1 = module.calling_vnet_resources.dev_vnet_subnet_id
  update_in_main_location_vnet_prd_1 = module.calling_vnet_resources.dev_vnet_output_id
  vm_password = var.vm_password
  region_1 = var.region_1
  region_2 = var.region_2
  region_3 = var.region_3
  region_4 = var.region_4
  depends_on = [module.calling_vnet_resources]
}