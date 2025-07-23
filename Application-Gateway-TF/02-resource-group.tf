resource "azurerm_resource_group" "tf-rg" {
  name = "${var.env-1}-${var.regional_abbrv["centralindia"]}-tf-rg"
  location = "${var.region-1}"
  tags = { 
    environment = var.env-1
    locationcode = var.regional_abbrv["centralindia"]
   }
}

# Creating Storage Account along with container and blob from child module

module "get_storage" {
  source = "./storage-module"  # relative path to child module

  storage_account_replication_type = "LRS"
  resource_group_name              = azurerm_resource_group.tf-rg.name
  location                         = azurerm_resource_group.tf-rg.location
  account_tier = "Standard"
  static_website_error_404_document = "404.html"
  static_website_index_document = "index.html"
  blob_source_path = "${path.module}/app-scripts/app1.conf"
}


# Creating NAT Gateway from Child module

module "get_nat_gw" {
  source = "./NAT-Gw"

  natgw_rg_location = azurerm_resource_group.tf-rg.location
  natgw_rg_name = azurerm_resource_group.tf-rg.name
  natgw_pub_IP_allocation = "Static"
  natgw_sku = "Standard"
}


# Creating VNet + Subnet + NSG

module "get_vnet_env-1" {
  source = "./General-Networking-Components"

  vnet_resource_group_location = azurerm_resource_group.tf-rg.location
  vnet_resource_group_name = azurerm_resource_group.tf-rg.name
}

# Calling Internal LB and mapping to subnet

module "get_internal_lb" {
  source = "./Load Balancer"

  az_lb_frontend_ip = module.get_vnet_env-1.vnet__subnet_app_name_output
  lb_resource_group_location = azurerm_resource_group.tf-rg.location
  lb_resource_group_name = azurerm_resource_group.tf-rg.name
}

# Calling VMSS

module "get_vmss" {
  source = "./azure-VMSS"
  vmss_resource_group_location = azurerm_resource_group.tf-rg.location
  vmss_resource_group_name = azurerm_resource_group.tf-rg.name
  vmss_ip_config_frm_subnet = module.get_vnet_env-1.vnet__subnet_app_name_output
  mapping_vmss_to_lb = module.get_internal_lb.az_int_lb_backendpool_id
  vm-password = "Password12345"
  vm-username = "testing"
  depends_on = [ module.get_internal_lb ]
}

# Calling Private Endpoint configuration

module "get_pe_paas_services" {
  source = "./private-endpoint-PaaS"
  pe_resource_group_location = azurerm_resource_group.tf-rg.location
  pe_resource_group_name = azurerm_resource_group.tf-rg.name
  pe_storage_link_var_id = module.get_storage.storage_account_name_output
  pe_subnet_link_connection_var_id = module.get_vnet_env-1.vnet_subnet_pe_name_output
  virtual_network_dns_id = module.get_vnet_env-1.vnet_name_output
}