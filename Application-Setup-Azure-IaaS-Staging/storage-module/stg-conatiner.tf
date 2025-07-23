resource "azurerm_storage_container" "container_1" {
  name                  = var.container_name_1
  storage_account_id    = azurerm_storage_account.storage_info.id
  container_access_type = "private"
}

resource "azurerm_storage_blob" "httpd_files_container_blob" {
  name = "app-files"
  storage_account_name = azurerm_storage_account.storage_info.name
  storage_container_name = azurerm_storage_container.container_1.name
  type = "Block"
  source = var.blob_source_path
}