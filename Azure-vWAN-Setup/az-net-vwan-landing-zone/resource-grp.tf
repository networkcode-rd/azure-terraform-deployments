resource "azurerm_resource_group" "vwan_setup_rg" {
  name     = "${local.name_prefix}-vwan-rg"
  location = var.region_1
  tags = local.common_tags
}