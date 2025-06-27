resource "azurerm_network_interface" "app-nic" {
    name                = "${local.resource_name_prefix}-app-nic-${count.index}"
    location            = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name
    count = var.app_linuxvm_instance_count

    ip_configuration {
      name = "app-ip-config"
      private_ip_address_allocation = "Dynamic"
      subnet_id = azurerm_subnet.app-tier-subnet.id
      #public_ip_address_id = azurerm_public_ip.app_linux_vm_public_ip.id
      primary = true
    }
}
