# Creating Azure Load Balancer resource

resource "azurerm_lb" "az_int_lb" {
  name                = "${var.env-1}-${var.regional_abbrv["centralindia"]}-int-lb"
  location            = var.lb_resource_group_location
  resource_group_name = var.lb_resource_group_name
  sku                 = "Standard"

  frontend_ip_configuration {
    name                 = "${var.env-1}-fe-int-ip"
    private_ip_address_allocation = "Dynamic"
    subnet_id = var.az_lb_frontend_ip
  }
}

# Creating Azure Load Balancer - backend pool

resource "azurerm_lb_backend_address_pool" "bep_pool" {
  loadbalancer_id = azurerm_lb.az_int_lb.id
  name            = "${var.BackEndAddressPool}-app-${var.env-1}"
}

# Creating Azure Load Balancer - health probe

resource "azurerm_lb_probe" "hep_probe" {
  loadbalancer_id = azurerm_lb.az_int_lb.id
  name            = "${var.health_probe_variable}-TCP"
  port            = 22
  protocol = "Tcp"

}


# Creating Azure Load Balancer - load balancing rule

resource "azurerm_lb_rule" "example" {
  loadbalancer_id                = azurerm_lb.az_int_lb.id
  name                           = "LBRule"
  protocol                       = "Tcp"
  frontend_port                  = 8080
  backend_port                   = 80
  frontend_ip_configuration_name = "${var.env-1}-fe-int-ip"
  probe_id = azurerm_lb_probe.hep_probe.id
}