resource "azurerm_public_ip" "appgw_pub_ip" {
  name                = "${local.resource_name_prefix}-pip"
  resource_group_name = data.azurerm_resource_group.appgw_tf_rg.name
  location            = data.azurerm_resource_group.appgw_tf_rg.location
  allocation_method   = "Static"
}