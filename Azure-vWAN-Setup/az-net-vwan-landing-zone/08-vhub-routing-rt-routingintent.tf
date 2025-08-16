# resource "azurerm_virtual_hub_route_table" "example" {
#   name           = "example-vhubroutetable"
#   virtual_hub_id = azurerm_virtual_hub.example.id
#   labels         = ["label1"]

#   route {
#     name              = "example-route"
#     destinations_type = "CIDR"
#     destinations      = ["10.0.0.0/16"]
#     next_hop_type     = "ResourceId"
#     next_hop          = azurerm_virtual_hub_connection.example.id
#   }
# }


resource "azurerm_virtual_hub_routing_intent" "routing_intent_policy" {
  name           = "ci-routingintent"
  virtual_hub_id = azurerm_virtual_hub.vhub_b_ci.id

  routing_policy {
    name         = "PrivateTrafficPolicy"
    destinations = ["PrivateTraffic"]
    next_hop     = azurerm_firewall.az_fw.id
  }
}