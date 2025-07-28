resource "azurerm_resource_group" "az_tf_rg" {
  name     = "${local.name_prefix}-tf-rg"
  location = var.region_only_1
  tags     = local.apply_tags
}