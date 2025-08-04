resource "azurerm_resource_group" "rg_reference" {
  name     = "${local.name_prfx}-tf-rg"
  location = var.site
  tags     = local.common_tags
}