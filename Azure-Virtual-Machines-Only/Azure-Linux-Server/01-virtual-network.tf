resource "azurerm_virtual_network" "az_vnet_linux_tf" {
  name                = "${local.name_prefix}-vnet-tf"
  location            = azurerm_resource_group.az_tf_rg.location
  resource_group_name = azurerm_resource_group.az_tf_rg.name
  address_space       = [var.vnet_address_space]
  tags                = local.apply_tags
}


resource "azurerm_subnet" "subnet_1" {
  name                 = "linux_server_sec_A"
  resource_group_name  = azurerm_resource_group.az_tf_rg.name
  virtual_network_name = azurerm_virtual_network.az_vnet_linux_tf.name
  address_prefixes     = [var.sub1_address_space]
  service_endpoints    = ["Microsoft.KeyVault"]
}