# RT with App-subnet
resource "azurerm_route_table" "route_table_app_subnet" {
  name                = "${var.env-1}-app-rt"
  location            = var.region-1
  resource_group_name = var.vnet_resource_group_name
  bgp_route_propagation_enabled = false

  route {
    name           = "dummyroute"
    address_prefix = "1.1.1.1/32"
    next_hop_type  = "None"
  }

    route {
    name           = "DefaultRouteOverride"
    address_prefix = "0.0.0.0/0"
    next_hop_type  = "VirtualAppliance"
    next_hop_in_ip_address = var.var_next_hop_in_ip_address
  }
}


# Associate RT with App-subnet

resource "azurerm_subnet_route_table_association" "app_rt_association" {
  subnet_id      = azurerm_subnet.app-subnet.id
  route_table_id = azurerm_route_table.route_table_app_subnet.id
}


# RT with Isolated-subnet

resource "azurerm_route_table" "route_table_isolated_subnet" {
  name                = "${var.env-1}-app-rt"
  location            = var.region-1
  resource_group_name = var.vnet_resource_group_name
  bgp_route_propagation_enabled = false

    route {
    name           = "DefaultRouteOverride"
    address_prefix = "0.0.0.0/0"
    next_hop_type  = "VirtualAppliance"
    next_hop_in_ip_address = var.var_next_hop_in_ip_address
  }
}

# Associate RT with Isolated-subnet

resource "azurerm_subnet_route_table_association" "isolate_rt_association" {
  subnet_id      = azurerm_subnet.isolate-subnet-1.id
  route_table_id = azurerm_route_table.route_table_isolated_subnet.id
}