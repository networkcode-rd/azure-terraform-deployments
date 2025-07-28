resource "azurerm_public_ip" "az_lb_pubIP" {
  name                = "az-lb-pubIP"
  location            = azurerm_resource_group.hub_tf_rg.location
  resource_group_name = azurerm_resource_group.hub_tf_rg.name
  allocation_method   = "Static"
  sku = "Standard"
}