resource "azurerm_virtual_wan" "vwan_resource" {
  name                = "${local.name_prefix}-vwan"
  resource_group_name = var.ph_name_rg
  location            = var.ph_location_rg
  tags                = local.common_tags
}