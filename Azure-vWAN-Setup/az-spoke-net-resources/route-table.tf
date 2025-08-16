# For Prod App Subnet Routing to Azure Firewall

resource "azurerm_route_table" "route_table_app" {
  name                = "app-prod-routetable"
  location            = "East Asia"
  resource_group_name = var.vnet_rg_placeholder_name

  route {
    name                   = "dev_returnroute"
    address_prefix         = "172.16.0.0/24"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = "10.10.1.1"
  }
}

resource "azurerm_subnet_route_table_association" "udr_association_app_sub_prod" {
  subnet_id      = azurerm_subnet.prd2_app_subnet_1.id
  route_table_id = azurerm_route_table.route_table_app.id
  depends_on = [ azurerm_virtual_network.prod2_vnet ]
}
