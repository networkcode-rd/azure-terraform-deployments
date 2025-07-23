resource "random_string" "strg_random" {
  length = 8
  lower = true
  upper = false
  special = false
  numeric = false
}

resource "azurerm_storage_account" "storage_info" {
  name = "${random_string.strg_random.id}tfrdstg"
  resource_group_name = var.resource_group_name
  location = var.location
  account_replication_type = var.storage_account_replication_type
  account_tier = var.account_tier
  public_network_access_enabled = false
}