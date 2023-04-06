resource "azurerm_virtual_network_peering" "Terra-admin" {
  name                      = "vnet-admin-cindia-to-vnet-app-cindia"
  resource_group_name       = azurerm_resource_group.terra-admin.name
  virtual_network_name      = azurerm_virtual_network.terra-admin.name
  remote_virtual_network_id = azurerm_virtual_network.terra-app.id
}

resource "azurerm_virtual_network_peering" "Terra-app" {
  name                      = "vnet-app-cindia-to-vnet-admin-cindia"
  resource_group_name       = azurerm_resource_group.terra-app.name
  virtual_network_name      = azurerm_virtual_network.terra-app.name
  remote_virtual_network_id = azurerm_virtual_network.terra-admin.id
}