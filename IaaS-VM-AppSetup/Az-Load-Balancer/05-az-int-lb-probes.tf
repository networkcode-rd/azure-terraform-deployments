# Probes for Linux VMs
resource "azurerm_lb_probe" "linux_vm_probes" {
  loadbalancer_id = azurerm_lb.az_int_dev_lb.id
  name            = "ssh-running-probe"
  port            = 22
}


# Probes for Windows VMs
resource "azurerm_lb_probe" "win_vm_probes" {
  loadbalancer_id = azurerm_lb.az_int_win_dev_lb.id
  name            = "rdp-running-probe"
  port            = 3389
}