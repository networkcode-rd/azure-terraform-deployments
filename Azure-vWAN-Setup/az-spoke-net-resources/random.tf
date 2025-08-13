resource "random_integer" "random_number" {
  min  = 2
  max  = 4
}

resource "random_string" "randomstring" {
  lower = true
  min_lower = 2 
  special = false
  length = 3
}