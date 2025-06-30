# resource "azurerm_public_ip" "app_linux_vm_public_ip" {
#   name                = "${local.resource_name_prefix}-app-linux-vm-public-ip"
#   location            = azurerm_resource_group.rg.location
#   resource_group_name = azurerm_resource_group.rg.name
#   allocation_method   = "Static"
#   sku                 = "Standard"
#   domain_name_label = "webapp-${random_string.randomgenerator.id}"
# }