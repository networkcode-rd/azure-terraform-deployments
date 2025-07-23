resource "azurerm_private_endpoint" "pe_paas_stg" {
  name                = "${var.env-1}-${var.regional_abbrv["centralindia"]}-stg-pe"
  location            = var.pe_resource_group_location
  resource_group_name = var.pe_resource_group_name
  subnet_id           = var.pe_subnet_link_connection_var_id

  private_service_connection {
    name                           = "storage-paas-privateserviceconnection"
    private_connection_resource_id = var.pe_storage_link_var_id
    subresource_names              = ["blob"]
    is_manual_connection           = false
  }

  private_dns_zone_group {
    name                 = "private-storage-dns-zone-group"
    private_dns_zone_ids = [azurerm_private_dns_zone.stg_paas_dns.id]
  }
}

resource "azurerm_private_dns_zone" "stg_paas_dns" {
  name                = "privatelink.blob.core.windows.net"
  resource_group_name = var.pe_resource_group_name
}

resource "azurerm_private_dns_zone_virtual_network_link" "dns_vnet_link" {
  name                  = "dns_vnet_link"
  resource_group_name   = var.pe_resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.stg_paas_dns.name
  virtual_network_id    = var.virtual_network_dns_id
}