resource "azurerm_network_interface" "nic_creation_win_alt_srv_block" {
  count               = var.meta_argu_vm
  name                = "${var.env-1}-alt-nic-${count.index}"
  location            = azurerm_resource_group.rg_reference.location
  resource_group_name = azurerm_resource_group.rg_reference.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.server_alternate_subnet.id
    private_ip_address_allocation = "Dynamic"
  }
  depends_on = [azurerm_subnet.server_alternate_subnet]
}