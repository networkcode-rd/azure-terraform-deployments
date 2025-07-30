locals {
  department = var.department
  business   = var.business
  location   = var.site
  env        = var.env-1
  name_prfx  = "${var.env-1}-${var.regional_abbrv["centralindia"]}"
  common_tags = {
    env        = local.env
    department = local.department
    method     = "CI/CD"
    platform   = "Terraform"
  }
}


# Using for NSG rules

locals {
  inb_port = {
    "101" : "80"
    "102" : "22"
  }
}