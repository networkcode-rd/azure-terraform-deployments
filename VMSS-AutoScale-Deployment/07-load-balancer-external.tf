resource "azurerm_lb" "elb-vmss" {
  name = "${local.resource_name_prefix}-elb-vmss"
  location = azurerm_resource_group.vmss-rg.location
  resource_group_name = azurerm_resource_group.vmss-rg.name

  frontend_ip_configuration {
    name = "vmssPubIP"
    public_ip_address_id = azurerm_public_ip.vmssPubIP.id
  }
}

resource "azurerm_lb_backend_address_pool" "bep-vmss" {
  name = "vmss-backend"
  loadbalancer_id = azurerm_lb.elb-vmss.id
}

resource "azurerm_lb_probe" "vmss_tcp_probe" {
  loadbalancer_id = azurerm_lb.elb-vmss.id
  name = "vmss_tcp_probe"
  port = 22
  protocol = "Tcp"
}

resource "azurerm_lb_rule" "vmss_incoming_rule-01" {
  name = "vmss_incoming_rule"
  backend_port = 80
  frontend_port = 8080
  frontend_ip_configuration_name = azurerm_lb.elb-vmss.frontend_ip_configuration[0].name
  probe_id = azurerm_lb_probe.vmss_tcp_probe.id
  loadbalancer_id = azurerm_lb.elb-vmss.id
  backend_address_pool_ids = [azurerm_lb_backend_address_pool.bep-vmss.id]
  load_distribution = "Default"
  protocol = "Tcp"
}