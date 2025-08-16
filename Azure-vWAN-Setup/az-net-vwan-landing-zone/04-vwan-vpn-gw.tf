
# For East Asia

resource "azurerm_vpn_gateway" "vpn_gw_resource_ea" {
  name                = "${local.name_prefix}-ea-vpng"
  location            = azurerm_virtual_hub.vhub_a_ea.location
  resource_group_name = var.ph_name_rg
  virtual_hub_id      = azurerm_virtual_hub.vhub_a_ea.id
  timeouts {
    create = "2h"
    update= "2h"
  }
}

# For Central India

resource "azurerm_vpn_gateway" "vpn_gw_resource_ci" {
  name                = "${local.name_prefix}-ci-vpng"
  location            = azurerm_virtual_hub.vhub_b_ci.location
  resource_group_name = var.ph_name_rg
  virtual_hub_id      = azurerm_virtual_hub.vhub_b_ci.id
  timeouts {
    create = "2h"
    update= "2h"
  }  
}
