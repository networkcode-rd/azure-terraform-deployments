resource "azurerm_public_ip" "vmssPubIP" {
  name                = "VMSS-PubIP-${random_string.random-value.id}"
  resource_group_name = azurerm_resource_group.vmss-rg.name
  location            = azurerm_resource_group.vmss-rg.location
  allocation_method   = "Static"
}