resource "azurerm_private_dns_zone_virtual_network_link" "storage_vnet_link_conn_b" {
  name                  = "app-vnet-link"
  resource_group_name   = var.ph_resource_group_name
  private_dns_zone_name = var.private_dns_zone_name
  virtual_network_id    = var.ph_virtual_network
}