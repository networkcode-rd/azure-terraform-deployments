resource "random_string" "random-value" {
 length = 5
 upper = false
 special = false
}

resource "random_string" "fqdn" {
  length = 6
  special = false
  upper = false
  numeric = false
}