# resource "azurerm_virtual_hub_ip" "example" {
#   name                         = "example-vhubip"
#   virtual_hub_id               = azurerm_virtual_hub.example.id
#   private_ip_address           = "10.5.1.18"
#   private_ip_allocation_method = "Static"
#   public_ip_address_id         = azurerm_public_ip.example.id
#   subnet_id                    = azurerm_subnet.example.id
# }

# resource "azurerm_virtual_hub_bgp_connection" "example" {
#   name           = "example-vhub-bgpconnection"
#   virtual_hub_id = azurerm_virtual_hub.example.id
#   peer_asn       = 65514
#   peer_ip        = "169.254.21.5"

#   depends_on = [azurerm_virtual_hub_ip.example]
# }