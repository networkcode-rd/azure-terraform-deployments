# Creating Public IP with SKU Standard and Static allocation method
resource "azurerm_public_ip" "lb-pip" {
  name                = "${local.resource_name_prefix}-pip-slb"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Static"
  sku                 = "Standard"
  tags                = local.common_tags
}

# creating Azure Load Balancer
resource "azurerm_lb" "azure-std-lb-ext" {
  name                = "${local.resource_name_prefix}-std-lb-ext"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku                 = "Standard"
  frontend_ip_configuration {
    name                 = "lb-ext-fe-ip-config"
    public_ip_address_id = azurerm_public_ip.lb-pip.id
  }
}

#creating Azure Load Backend pool
resource "azurerm_lb_backend_address_pool" "bep-app" {
  name            = "bep-application"
  loadbalancer_id = azurerm_lb.azure-std-lb-ext.id
}


# Creating Azure Load Balancer Health Probe
resource "azurerm_lb_probe" "hep-app" {
  name            = "hep-app-tcp"
  protocol        = "Tcp"
  port            = 80
  loadbalancer_id = azurerm_lb.azure-std-lb-ext.id
  depends_on      = [azurerm_lb_backend_address_pool.bep-app]
}

# Creating Azure Load Balancer Rule

resource "azurerm_lb_rule" "inbound-rule-app" {
  name                           = "inbound-rule-app"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = azurerm_lb.azure-std-lb-ext.frontend_ip_configuration[0].name
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.bep-app.id]
  probe_id                       = azurerm_lb_probe.hep-app.id
  loadbalancer_id                = azurerm_lb.azure-std-lb-ext.id
}

# Mapping NIC of VM in the Backend Pool
resource "azurerm_network_interface_backend_address_pool_association" "nic-app-map-lb" {
  network_interface_id    = azurerm_network_interface.app-nic.id
  ip_configuration_name   = azurerm_network_interface.app-nic.ip_configuration[0].name
  backend_address_pool_id = azurerm_lb_backend_address_pool.bep-app.id
}

# creating NAT rule:

resource "azurerm_lb_nat_rule" "nat-rule-ssh" {
  name                           = "nat-rule-ssh"
  frontend_ip_configuration_name = azurerm_lb.azure-std-lb-ext.frontend_ip_configuration[0].name
  loadbalancer_id                = azurerm_lb.azure-std-lb-ext.id
  backend_port                   = 22
  frontend_port                  = 222
  protocol                       = "Tcp"
  resource_group_name = azurerm_resource_group.rg.name

}

# Associate NAT Rule with VM NIC
resource "azurerm_network_interface_nat_rule_association" "NAT-rule-link-nic" {
  network_interface_id = azurerm_network_interface.app-nic.id
  ip_configuration_name = azurerm_network_interface.app-nic.ip_configuration[0].name
  nat_rule_id = azurerm_lb_nat_rule.nat-rule-ssh.id
}