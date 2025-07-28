## We are calling two different modules here and wiring them together for resource creation in its respective Resources

module "get_azure_lb_info" {
  source = "./Az-Load-Balancer"
  value_vm = out
  bep_ipadresses = module.get_azure_linux_vm_info.output_azurevm_linux_private_ip_address
  vnet_information_linux = module.get_azure_linux_vm_info.output_vnet_id
}


module "get_azure_linux_vm_info" {
  source = "./Azure-Linux-Server"
  
}

# module "get_azure_windows_vm_info" {
#   source = "./Azure-Linux-Server"
# }