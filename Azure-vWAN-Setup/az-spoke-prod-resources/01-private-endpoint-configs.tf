resource "azurerm_private_endpoint" "prod_stg_pe_config" {
  name                = "${local.name_prefix}-pvtendpoint"
  location            = var.ph_resource_group_location
  resource_group_name = var.ph_resource_group_name
  subnet_id           = var.ph_subnet_id

  private_service_connection {
    name                           = "${local.name_prefix}-privateserviceconnection"
    private_connection_resource_id = var.ph_storage_account
    subresource_names              = ["blob"]
    is_manual_connection           = false
  }

  private_dns_zone_group {
    name                 = "${local.name_prefix}-dns-zone-group"
    private_dns_zone_ids = [azurerm_private_dns_zone.storage_pvt_dns_zone.id]
  }
}

resource "azurerm_private_dns_zone" "storage_pvt_dns_zone" {
  name                = "privatelink.blob.core.windows.net"
  resource_group_name = var.ph_resource_group_name
}

resource "azurerm_private_dns_zone_virtual_network_link" "storage_vnet_link_conn_a" {
  name                  = "shared-prod-vnet-link"
  resource_group_name   = var.ph_resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.storage_pvt_dns_zone.name
  virtual_network_id    = var.ph_virtual_network
}