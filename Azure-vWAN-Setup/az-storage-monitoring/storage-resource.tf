resource "azurerm_storage_account" "stg_creation" {
  name                     = "${random_string.random.result}iacstg"
  resource_group_name      = azurerm_resource_group.stg_setup_rg.name
  location                 = azurerm_resource_group.stg_setup_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags = local.common_tags
}