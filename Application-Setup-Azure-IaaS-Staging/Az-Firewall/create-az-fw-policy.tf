resource "azurerm_firewall_policy" "azfwpolicy" {
  name                = "${var.env-1}-${var.regional_abbrv["centralindia"]}-azfwpolicy"
  resource_group_name = var.var_azfw_rg_name
  location            = var.var_azfw_rg_location
}