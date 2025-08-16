# Mapping & Configutation for dev subnet

resource "azurerm_subnet_network_security_group_association" "dev-subnet-1-nsg-association" {
  subnet_id                 = azurerm_subnet.dev_subnet_1.id
  network_security_group_id = azurerm_network_security_group.dev-sub-nsg.id
}



# Mapping & Configutation for Prod subnet

resource "azurerm_subnet_network_security_group_association" "prd-subnet-1-nsg-association" {
  subnet_id                 = azurerm_subnet.prd_subnet_1.id
  network_security_group_id = azurerm_network_security_group.prd-sub1-nsg.id
}


resource "azurerm_subnet_network_security_group_association" "prd-subnet-2-nsg-association" {
  subnet_id                 = azurerm_subnet.prd_subnet_2.id
  network_security_group_id = azurerm_network_security_group.prd-sub2-nsg.id
}

resource "azurerm_subnet_network_security_group_association" "prd-subnet-3-nsg-association" {
  subnet_id                 = azurerm_subnet.prd_subnet_3.id
  network_security_group_id = azurerm_network_security_group.prd-sub3-nsg.id
}



# Mapping for Prod2 subnet and NSG

resource "azurerm_subnet_network_security_group_association" "prd2-app-nsg-association" {
  subnet_id                 = azurerm_subnet.prd2_app_subnet_1.id
  network_security_group_id = azurerm_network_security_group.prd-app-nsg.id
}

resource "azurerm_subnet_network_security_group_association" "prd-appGW-nsg-association" {
  subnet_id                 = azurerm_subnet.prd2_appgw_subnet_2.id
  network_security_group_id = azurerm_network_security_group.prd-appGW-nsg.id
}