resource "azurerm_network_interface" "app-nic" {
    for_each = var.app_vm_instance_count
    name                = "app-nic-${each.key}"
    location            = var.update_in_main_location_rg
    resource_group_name = var.update_in_main_name_rg

    ip_configuration {
      name = "app-ip-config"
      private_ip_address_allocation = "Dynamic"
      subnet_id = var.update_in_main_location_subnet_prd_1
      primary = true
    }
}