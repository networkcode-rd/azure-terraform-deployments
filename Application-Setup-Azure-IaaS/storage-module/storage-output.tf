output "storage_account_name_output" {
  value = azurerm_storage_account.storage_info.id
}

output "storage_account_container_output" {
  value = azurerm_storage_container.container_1.id
}

output "storage_blob_creation" {
  value = azurerm_storage_blob.httpd_files_container_blob
}