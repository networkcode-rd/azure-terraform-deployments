resource "azurerm_firewall_policy_rule_collection_group" "fwpolicy_rule_collection_grp" {
  name               = "fwpolicy_rule_collection_grp"
  firewall_policy_id = azurerm_firewall_policy.azfwpolicy.id
  priority           = 200
  application_rule_collection {
    name     = "app_rule_collection1"
    priority = 500
    action   = "Allow"
    rule {
      name = "app_rule_collection1_rule1"
      protocols {
        type = "Http"
        port = 80
      }
      protocols {
        type = "Https"
        port = 443
      }
      source_addresses  = ["172.16.0.0/16", "172.19.0.0/16", "172.30.0.0/24"]
      destination_fqdns = ["*.microsoft.com"]
    }
  }

  network_rule_collection {
    name     = "Vnet-to-Vnet"
    priority = 150
    action   = "Allow"
    rule {
      name                  = "Vnet-to-vnet"
      protocols             = ["TCP"]
      source_addresses      = ["172.16.0.0/16", "172.19.0.0/16"]
      destination_addresses = ["172.16.0.0/16", "172.19.0.0/16"]
      destination_ports     = ["80", "3389", "443", "22"]
    }
  }

  network_rule_collection {
    name = "Gateway_Subnet"
    priority = 152
    action   = "Allow"
    rule {
      name                  = "Hub_Traffic_related"
      protocols             = ["TCP"]
      source_addresses      = [ "172.30.0.0/24"]
      destination_addresses = ["*"]
      destination_ports     = ["*"]
    }
  }

# #   nat_rule_collection {
# #     name     = "nat_rule_collection1"
# #     priority = 300
# #     action   = "Dnat"
# #     rule {
# #       name                = "nat_rule_collection1_rule1"
# #       protocols           = ["TCP", "UDP"]
# #       source_addresses    = ["10.0.0.1", "10.0.0.2"]
# #       destination_address = "192.168.1.1"
# #       destination_ports   = ["80"]
# #       translated_address  = "192.168.0.1"
# #       translated_port     = "8080"
# #     }
#   }
# }
}