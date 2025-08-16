output "out_vwan_id" {
  value = azurerm_virtual_wan.vwan_resource.id
}

output "out_vhub_b_ci_id" {
  value = azurerm_virtual_hub.vhub_b_ci.id
}

output "out_vhub_a_ea_id" {
  value = azurerm_virtual_hub.vhub_a_ea.id
}

output "out_vhub_vpn_ci_id" {
  value = azurerm_vpn_gateway.vpn_gw_resource_ci.id
}

output "out_vhub_vpn_ea_id" {
  value = azurerm_vpn_gateway.vpn_gw_resource_ea.id
}

output "out_ci_vpngw_vhub_id" {
  value = azurerm_vpn_gateway.vpn_gw_resource_ci.id
}

output "out_ea_vpngw_vhub_id" {
  value = azurerm_vpn_gateway.vpn_gw_resource_ea.id
}

output "out_ci_vpnsite_id" {
  value = azurerm_vpn_site.vpn_site_ci_a.id
}

output "out_ea_vpnsite_id" {
  value = azurerm_vpn_site.vpn_site_ea_a.id
}

output "out_azfw_vhub" {
  value = azurerm_firewall.az_fw.id
}

output "out_azfw_policy_vhub" {
  value = azurerm_firewall_policy.azfw_policy.id
}

# output "out_azfw_pubIP" {
#   value = azurerm_firewall.az_fw.
# }