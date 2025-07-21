output "natgw_output" {
  description = "ID of the NAT Gateway"
  value = azurerm_nat_gateway.nat_gw_creation.id
}

output "nat_gw_public_IP" {
  description = "Public IP created for NAT-Gw"
  value = azurerm_public_ip.nat_gw_pub_IP.id
}