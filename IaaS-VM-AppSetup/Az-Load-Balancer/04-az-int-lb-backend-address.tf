# Marking for Azure Linux VMs as Backend pool

resource "azurerm_lb_backend_address_pool" "bep_name" {
  loadbalancer_id = azurerm_lb.az_int_dev_lb.id
  name            = "bep_name"
}

resource "azurerm_lb_backend_address_pool_address" "bep_linux" {
  for_each                = data.terraform_remote_state.linux_vms.outputs.output_value_list_vm_private_ip_address_map
  name                    = "bep-${each.key}"
  backend_address_pool_id = azurerm_lb_backend_address_pool.bep_name.id
  ip_address              = each.value
  virtual_network_id      = data.terraform_remote_state.linux_vms.outputs.output_vnet_id
}

## Marking for Azure Windows VMs as Backend pool

resource "azurerm_lb_backend_address_pool" "win_bep_name" {
  loadbalancer_id = azurerm_lb.az_int_win_dev_lb.id
  name            = "bep_win"
}
resource "azurerm_lb_backend_address_pool_address" "from_windows" {
  count = length(data.terraform_remote_state.windows_vms.outputs.out_private_ip_address_block)
  name                    = "bep-win-${count.index}"
  backend_address_pool_id = azurerm_lb_backend_address_pool.win_bep_name.id
  ip_address              = data.terraform_remote_state.windows_vms.outputs.out_private_ip_address_block[count.index]
  virtual_network_id      = data.terraform_remote_state.windows_vms.outputs.out_vnet_id
}