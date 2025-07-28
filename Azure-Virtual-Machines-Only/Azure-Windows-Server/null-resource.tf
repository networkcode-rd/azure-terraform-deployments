# # Fix so that the extension gets deployed

# resource "null_resource" "wait_for_vm_boot" {
#   count = var.meta_argu_vm

#   provisioner "local-exec" {
#     command = "sleep 120"
#   }

#   depends_on = [azurerm_windows_virtual_machine.vm_server_alt_win_block]
# }
