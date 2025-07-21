resource "azurerm_route_table" "route_table_app_subnet" {
  name                = "${var.env-1}-app-rt"
  location            = var.region-1
  resource_group_name = var.vnet_resource_group_name

  route {
    name           = "dummyroute"
    address_prefix = "1.1.1.1/32"
    next_hop_type  = "None"
  }
}


# Associate RT with subnet

resource "azurerm_subnet_route_table_association" "app_rt_association" {
  subnet_id      = azurerm_subnet.app-subnet.id
  route_table_id = azurerm_route_table.route_table_app_subnet.id
}