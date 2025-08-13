resource "azurerm_resource_group" "stg_setup_rg" {
  name     = "${local.name_prefix}-stg-rg"
  location = var.region_1
  tags = local.common_tags
}