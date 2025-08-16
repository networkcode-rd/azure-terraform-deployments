data "terraform_remote_state" "for_storage" {
  backend = "azurerm"
  config = {
    storage_account_name = "azstoragelearningrd"
    container_name       = "azuretffile"
    key                  = "stg.tfstate"
    resource_group_name  = "Az-rd-104"
  }
}