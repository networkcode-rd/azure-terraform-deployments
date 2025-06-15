resource "azurerm_resource_group" "tf-rg-networkhub" {
  name     = "tf-rg-networkhub"
  location = "Central India"
}

resource "azurerm_network_security_group" "subnet-nsg-tf" {
  name                = "subnet-nsg-tf"
  location = azurerm_resource_group.tf-rg-networkhub.location
  resource_group_name = azurerm_resource_group.tf-rg-networkhub.name
  security_rule {
    name                       = "Allow-SSH"
    priority                   = 1000
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "49.37.132.65"
    destination_address_prefix = "*"
  }
}

resource "azurerm_virtual_network" "tf-vnet-networkhub" {
  name                = "tf-vnet-networkhub"
  address_space       = ["172.26.0.0/16"]
  location = azurerm_resource_group.tf-rg-networkhub.location
  resource_group_name = azurerm_resource_group.tf-rg-networkhub.name
}

resource "azurerm_subnet" "default-tf-sub" {
  name                 = "default-tf-sub"
  resource_group_name  = azurerm_resource_group.tf-rg-networkhub.name
  virtual_network_name = azurerm_virtual_network.tf-vnet-networkhub.name
  address_prefixes     = ["172.26.0.0/24"]
}
