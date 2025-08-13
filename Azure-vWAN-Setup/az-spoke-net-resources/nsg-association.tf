# Configutation for dev subnet

resource "azurerm_subnet_network_security_group_association" "dev-subnet-1-nsg-association" {
  subnet_id                 = azurerm_subnet.dev_subnet_1.id
  network_security_group_id = azurerm_network_security_group.dev-sub-nsg.id
}



# Configutation for Prod subnet

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