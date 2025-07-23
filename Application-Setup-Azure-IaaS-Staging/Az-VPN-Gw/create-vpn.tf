resource "azurerm_public_ip" "az_vpn_pub_ip" {
  name                = "${var.env-1}-${var.regional_abbrv["centralindia"]}-vpn-pubIP"
  location            = var.var_vpn_rg_location
  resource_group_name = var.var_vpn_rg_name

  allocation_method = "Static"
  sku = "Standard"
}

resource "azurerm_virtual_network_gateway" "az_vpn_gw" {
  name                = "${var.env-1}-${var.regional_abbrv["centralindia"]}-vpngw"
  location            = var.var_vpn_rg_location
  resource_group_name = var.var_vpn_rg_name

  type     = "Vpn"
  vpn_type = "RouteBased"

  active_active = false
  enable_bgp    = false
  sku           = "VpnGw2"

  ip_configuration {
    name                          = "vnetGatewayConfig"
    public_ip_address_id          = azurerm_public_ip.az_vpn_pub_ip.id
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = var.var_vng_subnet
  }

#   vpn_client_configuration {
#     address_space = ["10.2.0.0/24"]

#     root_certificate {
#       name = "DigiCert-Federated-ID-Root-CA"

#       public_cert_data = <<EOF
# MIIDuzCCAqOgAwIBAgIQCHTZWCM+IlfFIRXIvyKSrjANBgkqhkiG9w0BAQsFADBn
# MQswCQYDVQQGEwJVUzEVMBMGA1UEChMMRGlnaUNlcnQgSW5jMRkwFwYDVQQLExB3
# d3cuZGlnaWNlcnQuY29tMSYwJAYDVQQDEx1EaWdpQ2VydCBGZWRlcmF0ZWQgSUQg
# Um9vdCBDQTAeFw0xMzAxMTUxMjAwMDBaFw0zMzAxMTUxMjAwMDBaMGcxCzAJBgNV
# BAYTAlVTMRUwEwYDVQQKEwxEaWdpQ2VydCBJbmMxGTAXBgNVBAsTEHd3dy5kaWdp
# Y2VydC5jb20xJjAkBgNVBAMTHURpZ2lDZXJ0IEZlZGVyYXRlZCBJRCBSb290IENB
# MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAvAEB4pcCqnNNOWE6Ur5j
# QPUH+1y1F9KdHTRSza6k5iDlXq1kGS1qAkuKtw9JsiNRrjltmFnzMZRBbX8Tlfl8
# zAhBmb6dDduDGED01kBsTkgywYPxXVTKec0WxYEEF0oMn4wSYNl0lt2eJAKHXjNf
# GTwiibdP8CUR2ghSM2sUTI8Nt1Omfc4SMHhGhYD64uJMbX98THQ/4LMGuYegou+d
# GTiahfHtjn7AboSEknwAMJHCh5RlYZZ6B1O4QbKJ+34Q0eKgnI3X6Vc9u0zf6DH8
# Dk+4zQDYRRTqTnVO3VT8jzqDlCRuNtq6YvryOWN74/dq8LQhUnXHvFyrsdMaE1X2
# DwIDAQABo2MwYTAPBgNVHRMBAf8EBTADAQH/MA4GA1UdDwEB/wQEAwIBhjAdBgNV
# HQ4EFgQUGRdkFnbGt1EWjKwbUne+5OaZvRYwHwYDVR0jBBgwFoAUGRdkFnbGt1EW
# jKwbUne+5OaZvRYwDQYJKoZIhvcNAQELBQADggEBAHcqsHkrjpESqfuVTRiptJfP
# 9JbdtWqRTmOf6uJi2c8YVqI6XlKXsD8C1dUUaaHKLUJzvKiazibVuBwMIT84AyqR
# QELn3e0BtgEymEygMU569b01ZPxoFSnNXc7qDZBDef8WfqAV/sxkTi8L9BkmFYfL
# uGLOhRJOFprPdoDIUBB+tmCl3oDcBy3vnUeOEioz8zAkprcb3GHwHAK+vHmmfgcn
# WsfMLH4JCLa/tRYL+Rw/N3ybCkDp00s0WUZ+AoDywSl0Q/ZEnNY0MsFiw6LyIdbq
# M/s/1JRtO3bDSzD9TazRVzn2oBqzSa8VgIo5C1nOnoAKJTlsClJKvIhnRlaLQqk=
# EOF

#     }

#     revoked_certificate {
#       name       = "Verizon-Global-Root-CA"
#       thumbprint = "912198EEF23DCAC40939312FEE97DD560BAE49B1"
#     }
#   }
}


resource "azurerm_local_network_gateway" "lng_on_prem_network_address_space" {
  name                = "lng_on_prem_network_address_space"
  resource_group_name = var.var_vpn_rg_name
  location            = var.var_vpn_rg_location
  gateway_address     = "1.1.1.1"
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_virtual_network_gateway_connection" "conn_on_prem_network_address_space" {
  name                = "conn_on_prem_network_address_space"
  location            = var.var_vpn_rg_location
  resource_group_name = var.var_vpn_rg_name

  type                       = "IPsec"
  virtual_network_gateway_id = azurerm_virtual_network_gateway.az_vpn_gw.id
  local_network_gateway_id   = azurerm_local_network_gateway.lng_on_prem_network_address_space.id
  shared_key = var.onprem_shared_key
}