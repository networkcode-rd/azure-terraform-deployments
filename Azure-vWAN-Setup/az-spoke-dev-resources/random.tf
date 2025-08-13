resource "random_string" "random_str_dev" {
  length = 4
  lower = true
  upper = false
  special = false
}