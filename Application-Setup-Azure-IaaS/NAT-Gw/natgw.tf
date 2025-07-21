resource "azurerm_nat_gateway" "nat_gw_creation" {
  name                    = "nat-gateway"
  location                = var.natgw_rg_location
  resource_group_name     = var.natgw_rg_name
  sku_name                = var.natgw_sku
}

resource "azurerm_public_ip" "nat_gw_pub_IP" {
  name                = "acceptanceTestPublicIp1"
  resource_group_name = var.natgw_rg_name
  location            = var.natgw_rg_location
  allocation_method   = var.natgw_pub_IP_allocation
  sku = var.natgw_sku
}

resource "azurerm_nat_gateway_public_ip_association" "natgw_assoc_pub_IP" {
  nat_gateway_id = azurerm_nat_gateway.nat_gw_creation.id
  public_ip_address_id = azurerm_public_ip.nat_gw_pub_IP.id
}