# For East Asia

resource "azurerm_virtual_hub" "vhub_a_ea" {
  name                = "${local.name_prefix}-ea-vhub"
  resource_group_name = var.ph_name_rg
  location            = "East Asia"
  virtual_wan_id      = azurerm_virtual_wan.vwan_resource.id
  address_prefix      = "192.168.1.0/24"
}

# For Central India

resource "azurerm_virtual_hub" "vhub_b_ci" {
  name                = "${local.name_prefix}-ci-vhub"
  resource_group_name = var.ph_name_rg
  location            = "Central India"
  virtual_wan_id      = azurerm_virtual_wan.vwan_resource.id
  address_prefix      = "192.168.2.0/24"
}