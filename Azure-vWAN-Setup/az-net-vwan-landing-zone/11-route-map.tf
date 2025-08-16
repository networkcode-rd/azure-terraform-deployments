# resource "azurerm_route_map" "example" {
#   name           = "example-rm"
#   virtual_hub_id = azurerm_virtual_hub.example.id

#   rule {
#     name                 = "rule1"
#     next_step_if_matched = "Continue"

#     action {
#       type = "Add"

#       parameter {
#         as_path = ["22334"]
#       }
#     }

#     match_criterion {
#       match_condition = "Contains"
#       route_prefix    = ["10.0.0.0/8"]
#     }
#   }
# }