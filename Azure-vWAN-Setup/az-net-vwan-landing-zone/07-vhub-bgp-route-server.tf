# resource "azurerm_virtual_hub_bgp_connection" "bgp_nva_connection" {
#   name           = "eaNva-vhub-bgpconnection"
#   virtual_hub_id = azurerm_virtual_hub.vhub_a_ea.id
#   peer_asn       = 65524
#   peer_ip        = "172.19.0.4"
#   depends_on = [azurerm_virtual_hub_connection.vhub_ea_a_to_remote]
# }