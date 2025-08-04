# Rules for Linux VM on different LB
resource "azurerm_lb_rule" "lb_rule_http" {
  loadbalancer_id                = azurerm_lb.az_int_dev_lb.id
  name                           = "LBRule"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = azurerm_lb.az_int_dev_lb.frontend_ip_configuration[0].name
  probe_id                       = azurerm_lb_probe.linux_vm_probes.id
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.bep_name.id]
}


# Rules for Windows VM on different LB
resource "azurerm_lb_rule" "lb_win_multi_rule" {
  loadbalancer_id                = azurerm_lb.az_int_win_dev_lb.id
  name                           = "httpRule"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = azurerm_lb.az_int_win_dev_lb.frontend_ip_configuration[0].name
  probe_id                       = azurerm_lb_probe.win_vm_probes.id
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.win_bep_name.id]
}
