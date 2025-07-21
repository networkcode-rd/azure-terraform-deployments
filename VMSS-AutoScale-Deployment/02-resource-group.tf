resource "azurerm_resource_group" "vmss-rg" {
  name     = "${local.division}-${var.resource-grp-custom-name}-${random_string.random-value.id}"
  location = var.resource-location-def-ci
  tags     = local.common_tags
}