resource "azurerm_firewall" "az_fw" {
  name                = "az-ci-firewall"
  location            = var.ph_location_rg
  resource_group_name = var.ph_name_rg
  sku_name            = "AZFW_Hub"
  sku_tier            = "Standard"
  virtual_hub {
    virtual_hub_id = azurerm_virtual_hub.vhub_b_ci.id
  }
  firewall_policy_id = azurerm_firewall_policy.azfw_policy.id
}

# # Creating Azure Public IP
# resource "azurerm_public_ip" "azfw_public_ip_config" {
#   allocation_method = "Static"
#   location = var.ph_location_rg
#   resource_group_name = var.ph_name_rg
#   name = "azfw_public_ip"
# }



