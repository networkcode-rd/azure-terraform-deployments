## These outputs to be used for Azure Standard Public Load Balancer. It's commented as this module is not focused on Azure Public LB rather it will be focused on AppGw later
# output "output_azure_lb" {
#   value = azurerm_lb.az_lb_ext.id
# }

# output "output_backend_address_pool_lin_id" {
#   value = azurerm_lb_backend_address_pool.lin_eng_bep.id
# }

# output "output_public_ip_frontend" {
#   value = azurerm_public_ip.az_lb_pubIP.ip_address
# }

# output "output_backend_address_pool_win_id" {
#   value = azurerm_lb_backend_address_pool.win_eng_bep.id
# }

output "out_az_rg_id" {
  value = azurerm_resource_group.hub_tf_rg.id
}

output "out_az_rg_name" {
  value = azurerm_resource_group.hub_tf_rg.name
}

output "out_az_rg_location" {
  value = azurerm_resource_group.hub_tf_rg.location
}

# Declaring outputs for Azure Load balancer

output "out_int_lnx_lb_id" {
  value = azurerm_lb.az_int_dev_lb.id
}

output "out_int_bep_lnx_id" {
  value = azurerm_lb_backend_address_pool.bep_name.id
}

output "out_int_bep_lnx_rule_id" {
  value = azurerm_lb_rule.lb_rule_http.id
}

output "out_fe_ip_lnx_lb" {
  value = azurerm_lb.az_int_dev_lb.frontend_ip_configuration[0].private_ip_address
}

# Declaring outputs for Azure Load balancer

output "out_win_lb_id" {
  value = azurerm_lb.az_int_win_dev_lb.id
}

output "out_win_lb_fep_ip_id" {
  value = azurerm_lb.az_int_win_dev_lb.frontend_ip_configuration[0].private_ip_address
}

output "out_win_bep_info_id" {
  value = azurerm_lb_backend_address_pool.win_bep_name.id
}

output "out_win_rule_01_id" {
  value = azurerm_lb_rule.lb_win_multi_rule.id
}