resource "azurerm_virtual_network" "VNet" {
    name = "${local.resource_name_prefix}-${var.vnet-name}"
    address_space = var.vnet-address-space
    location = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name
    tags = local.common_tags
}