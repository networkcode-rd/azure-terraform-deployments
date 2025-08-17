module "calling_vnet_resources" {
  source                       = "./az-spoke-net-resources"
  vnet_rg_placeholder_location = azurerm_resource_group.vwan_setup_rg.location
  vnet_rg_placeholder_name     = azurerm_resource_group.vwan_setup_rg.name
  sbnet_address_1              = var.sbnet_address_1
  region_1                     = var.region_1
  region_2                     = var.region_2
  region_3                     = var.region_3
  region_4                     = var.region_4
  vnet_address_qa              = var.vnet_address_qa
  vnet_address_prd             = var.vnet_address_prd
  vnet_address_dev             = var.vnet_address_dev
  vnet_address_stg             = var.vnet_address_stg
  src_add_hm_isp               = var.src_add_hm_isp
  sbnet_address_1_prd          = var.sbnet_address_1_prd
  sbnet_address_2_prd          = var.sbnet_address_2_prd
  sbnet_address_3_prd          = var.sbnet_address_3_prd
  vnet_address_app_prd         = var.vnet_address_app_prd
  sbnet_address_1_app_prd      = var.sbnet_address_1_app_prd
  sbnet_address_appgw_2_prd    = var.sbnet_address_appgw_2_prd
}

module "calling_az_spoke_dev_resources" {
  source                               = "./az-spoke-dev-resources"
  update_in_main_name_rg               = azurerm_resource_group.vwan_setup_rg.name
  update_in_main_location_rg           = azurerm_resource_group.vwan_setup_rg.location
  update_in_main_location_subnet_dev_1 = module.calling_vnet_resources.dev_vnet_subnet_id
  update_in_main_location_vnet_dev_1   = module.calling_vnet_resources.dev_vnet_output_id
  vm_password                          = var.vm_password
  region_1                             = var.region_1
  region_2                             = var.region_2
  region_3                             = var.region_3
  region_4                             = var.region_4
  depends_on                           = [module.calling_vnet_resources]
}

module "calling_vhub_vwan_config" {
  source                  = "./az-net-vwan-landing-zone"
  ph_name_rg              = azurerm_resource_group.vwan_setup_rg.name
  ph_location_rg          = azurerm_resource_group.vwan_setup_rg.location
  remote_vnet_from_EaVhub = module.calling_vnet_resources.dev_vnet_output_id
  remote_vnet_from_CIVhub = module.calling_vnet_resources.out_vnet_prd
  environment_name        = var.environment_name
  department_name         = var.department_name
  resources_type          = var.resources_type
  region_1                = var.region_1
  region_2                = var.region_2
  region_3                = var.region_3
  region_4                = var.region_4
  depends_on              = [module.calling_vnet_resources]
  team_name               = var.team_name
}


module "call_to_prod_env" {
  source                     = "./az-spoke-prod-resources"
  ph_resource_group_location = var.region_2
  ph_resource_group_name     = azurerm_resource_group.vwan_setup_rg.name
  ph_subnet_id               = module.calling_vnet_resources.out_sub_2_prod
  ph_virtual_network         = module.calling_vnet_resources.out_vnet_prd
  ph_storage_account         = data.terraform_remote_state.for_storage.outputs.storage_id
  environment_name           = var.environment_name
  department_name            = var.department_name
  resources_type             = var.resources_type
  region_2                   = var.region_2
  depends_on                 = [module.calling_vnet_resources]
  team_name                  = var.team_name
  ph_subnet_2_id             = module.calling_vnet_resources.out_sub_3_prod
  ph_subnet_3_id             = module.calling_vnet_resources.out_sub_1_prod
}


module "calling_app_prod_config" {
  source = "./az-spoke-app-prod-resources"
  ph_resource_group_name = azurerm_resource_group.vwan_setup_rg.name
  ph_resource_group_location = var.region_2
  ph_app_subnet_id = module.calling_vnet_resources.out_subnet_app_prd_id
  private_dns_zone_name = module.call_to_prod_env.out_private_dns_zone_name
  ph_subnet_appgw_id = module.calling_vnet_resources.out_subnet_appgw_prd_id
  ph_virtual_network = module.calling_vnet_resources.out_app_vnet_id
  environment_name           = var.environment_name
  department_name            = var.department_name
  resources_type             = var.resources_type
  region_2                   = var.region_2
  depends_on                 = [module.calling_vnet_resources]
  team_name                  = var.team_name
}