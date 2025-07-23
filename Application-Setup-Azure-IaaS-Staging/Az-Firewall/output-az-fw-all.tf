output "output_azfw_id" {
  value = azurerm_firewall.az_fw_prem.id
}

output "output_azfwpolicy_id" {
  value = azurerm_firewall_policy.azfwpolicy.id
}

output "output_azfwpolicyrules_id" {
  value = azurerm_firewall_policy_rule_collection_group.fwpolicy_rule_collection_grp.id
}

# Take the Fw private IP address as output
output "az_fw_prvt_ip_output" {
  value = azurerm_firewall.az_fw_prem.ip_configuration[0].private_ip_address
}