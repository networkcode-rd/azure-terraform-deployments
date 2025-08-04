# Working for Azure Linux VM, calling the VMs from an output file and its respective VNet and subnet
data "terraform_remote_state" "linux_vms" {
  backend = "azurerm"
  config = {
    storage_account_name = "azstoragelearningrd"
    container_name       = "azuretffile"
    key                  = "azurelinuxstatefile"
    resource_group_name  = "Az-rd-104"
  }
}

# Working for Azure Windows  VM, calling the VMs from an output file and its respective VNet and subnet
data "terraform_remote_state" "windows_vms" {
  backend = "azurerm"
  config = {
    storage_account_name = "azstoragelearningrd"
    container_name       = "azuretffile"
    key                  = "azurevmwindowsstatefile"
    resource_group_name  = "Az-rd-104"
  }
}
