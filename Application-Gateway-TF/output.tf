output "storage_name" {
  value = module.get_storage.storage_account_name_output
}

output "storage_container" {
  value = module.get_storage.storage_account_container_output
}


output "storage_con_blob" {
  value = module.get_storage.storage_blob_creation
}

output "natgw_name" {
  value = module.get_nat_gw.natgw_output
}

output "natgw_pub_IP" {
  value = module.get_nat_gw.nat_gw_public_IP
}