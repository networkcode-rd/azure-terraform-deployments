# Configuration for East Asia

resource "azurerm_vpn_site" "vpn_site_ea_a" {
  name                = "${local.name_prefix}-ea-site1"
  resource_group_name = var.ph_name_rg
  location            = "East Asia"
  virtual_wan_id      = azurerm_virtual_wan.vwan_resource.id
  #   address_cidrs       = ["10.0.0.0/16"]


  link {
    name       = "link1"
    ip_address = "1.1.1.1"
    bgp {
      asn             = 65321
      peering_address = "10.0.2.5"
    }
  }
}

# Configuration for Central India

resource "azurerm_vpn_site" "vpn_site_ci_a" {
  name                = "${local.name_prefix}-ci-site1"
  resource_group_name = var.ph_name_rg
  location            = "Central India"
  virtual_wan_id      = azurerm_virtual_wan.vwan_resource.id
  #   address_cidrs       = ["10.10.0.0/16"]


  link {
    name       = "link1"
    ip_address = "2.2.2.2"
    bgp {
      asn             = 65331
      peering_address = "10.10.2.5"
    }
  }
}