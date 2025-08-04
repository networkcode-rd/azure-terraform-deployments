resource "random_string" "gen_random" {
  length = 3
  special = false
  upper = false
  lower = true
}