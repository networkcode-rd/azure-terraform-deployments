resource "azurerm_public_ip" "azPubIP" {
  name                = "azPubIP"
  location            = var.var_azfw_rg_location
  resource_group_name = var.var_azfw_rg_name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_firewall" "az_fw_prem" {
  name                = "${var.env-1}-${var.regional_abbrv["centralindia"]}-azfwprem"
  location            = var.var_azfw_rg_location
  resource_group_name = var.var_azfw_rg_name
  sku_name            = "AZFW_VNet"
  sku_tier            = "Standard"

  ip_configuration {
    name                 = "azfwipfconfig"
    subnet_id            = var.var_azfw_subnet
    public_ip_address_id = azurerm_public_ip.azPubIP.id
  }

  firewall_policy_id = azurerm_firewall_policy.azfwpolicy.id # associated Azure Firewall Policy with Azure Firewall
}