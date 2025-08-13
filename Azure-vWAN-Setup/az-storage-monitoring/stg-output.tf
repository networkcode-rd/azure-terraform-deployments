output "storage_id" {
  value = azurerm_storage_account.stg_creation.id
}

output "storage_rg_name" {
  value = azurerm_resource_group.stg_setup_rg.name
}

output "storage_rg_id" {
  value = azurerm_resource_group.stg_setup_rg.id
}

output "storage_rg_location" {
  value = azurerm_resource_group.stg_setup_rg.location
}