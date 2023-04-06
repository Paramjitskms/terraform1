resource "azurerm_virtual_network" "terra-admin" {
  name                = "vnet-admin-cindia"
  location            = azurerm_resource_group.terra-admin.location
  resource_group_name = azurerm_resource_group.terra-admin.name
  address_space       = ["10.0.0.0/16"]
}
resource "azurerm_subnet" "terra-admin-subnet-admin" {
  name                 = "admin"
  resource_group_name  = azurerm_resource_group.terra-admin.name
  virtual_network_name = azurerm_virtual_network.terra-admin.name
  address_prefixes     = ["10.0.0.0/24"]
}

resource "azurerm_virtual_network" "terra-app" {
  name                = "vnet-app-cindia"
  location            = azurerm_resource_group.terra-app.location
  resource_group_name = azurerm_resource_group.terra-app.name
  address_space       = ["10.1.0.0/16"]
}
resource "azurerm_subnet" "terra-app-subnet-frontend" {
  name                 = "front-end"
  resource_group_name  = azurerm_resource_group.terra-app.name
  virtual_network_name = azurerm_virtual_network.terra-app.name
  address_prefixes     = ["10.1.0.0/24"]
}
resource "azurerm_subnet" "terra-app-subnet-backend" {
  name                 = "back-end"
  resource_group_name  = azurerm_resource_group.terra-app.name
  virtual_network_name = azurerm_virtual_network.terra-app.name
  address_prefixes     = ["10.1.1.0/24"]
}
resource "azurerm_subnet" "terra-app-subnet-database" {
  name                 = "database"
  resource_group_name  = azurerm_resource_group.terra-app.name
  virtual_network_name = azurerm_virtual_network.terra-app.name
  address_prefixes     = ["10.1.2.0/24"]
}
