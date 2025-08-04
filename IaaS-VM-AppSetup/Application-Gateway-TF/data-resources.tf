data "terraform_remote_state" "calling_hub_lb_resources" {
  backend = "azurerm"
  config = {
    resource_group_name  = "Az-rd-104"
    storage_account_name = "azstoragelearningrd"
    container_name       = "azuretffile"
    key                  = "azurelbstatefile"
  }
}


data "terraform_remote_state" "calling_hub_lnx_resources" {
  backend = "azurerm"
  config = {
    resource_group_name  = "Az-rd-104"
    storage_account_name = "azstoragelearningrd"
    container_name       = "azuretffile"
    key                  = "azurelinuxstatefile"
  }
}

data "terraform_remote_state" "calling_hub_win_resources" {
  backend = "azurerm"
  config = {
    resource_group_name  = "Az-rd-104"
    storage_account_name = "azstoragelearningrd"
    container_name       = "azuretffile"
    key                  = "azurevmwindowsstatefile"
  }
}