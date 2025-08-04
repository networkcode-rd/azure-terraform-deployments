# Creating LB for Linux resources
resource "azurerm_lb" "az_int_dev_lb" {
  name                = "${local.name_prefix}-az-dev-lnx-int-lb"
  location            = azurerm_resource_group.hub_tf_rg.location
  resource_group_name = azurerm_resource_group.hub_tf_rg.name

  frontend_ip_configuration {
    name                          = "lb_linux_private_ip_address"
    subnet_id                     = data.terraform_remote_state.linux_vms.outputs.output_subnet_1_id
    private_ip_address_allocation = "Dynamic"
  }
}

# Creating LB for Windows resources

resource "azurerm_lb" "az_int_win_dev_lb" {
  name                = "${local.name_prefix}-az-dev-win-int-lb"
  location            = azurerm_resource_group.hub_tf_rg.location
  resource_group_name = azurerm_resource_group.hub_tf_rg.name

  frontend_ip_configuration {
    name = "win_lb_private_fep_ip"
    subnet_id = data.terraform_remote_state.windows_vms.outputs.out_subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}