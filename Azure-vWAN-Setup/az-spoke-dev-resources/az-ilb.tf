# Internal Load Balancer

resource "azurerm_lb" "az_ilb_resource" {
  name                = "${local.resource_dev_naming}-${random_string.random_str_dev.result}"
  location            = var.update_in_main_location_rg
  resource_group_name = var.update_in_main_name_rg

  frontend_ip_configuration {
    name                 = "fe-pvt-ip"
    private_ip_address_allocation = "Dynamic"
    subnet_id = var.update_in_main_location_subnet_dev_1
  }
}


# ILB Backend Pool
resource "azurerm_lb_backend_address_pool" "az_dev_ilb_bep_name" {
  loadbalancer_id = azurerm_lb.az_ilb_resource.id
  name            = "bep-${local.resource_dev_naming}-vms"
}

resource "azurerm_lb_backend_address_pool_address" "az_dev_ilb_bep_addr" {
    for_each = azurerm_network_interface.app-nic
  name                                = "bep-${each.key}"
  backend_address_pool_id             = azurerm_lb_backend_address_pool.az_dev_ilb_bep_name.id
  virtual_network_id = var.update_in_main_location_vnet_dev_1
  ip_address = each.value.ip_configuration[0].private_ip_address
}


# ILB Health Probe Config

resource "azurerm_lb_probe" "hep_rule" {
  loadbalancer_id = azurerm_lb.az_ilb_resource.id
  name            = "TCP-probe"
  port            = 80
}

# ILB Load Balancing Rule

resource "azurerm_lb_rule" "ilb_rule_config" {
  loadbalancer_id                = azurerm_lb.az_ilb_resource.id
  name                           = "LBRule"
  protocol                       = "Tcp"
  frontend_port                  = 8080
  backend_port                   = 80
  frontend_ip_configuration_name = azurerm_lb.az_ilb_resource.frontend_ip_configuration[0].name
  backend_address_pool_ids = [azurerm_lb_backend_address_pool.az_dev_ilb_bep_name.id]
}