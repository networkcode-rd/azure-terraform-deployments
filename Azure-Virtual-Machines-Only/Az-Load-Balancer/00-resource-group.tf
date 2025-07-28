resource "azurerm_resource_group" "hub_tf_rg" {
  name = "${local.name_prefix}-tf-rg"
  location = var.region_only_1
}
