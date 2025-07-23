# resource "azurerm_storage_account_static_website" "static_website" {
#   storage_account_id = azurerm_storage_account.storage_info.id
#   error_404_document = var.static_website_error_404_document
#   index_document     = var.static_website_index_document
# }