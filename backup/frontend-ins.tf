data "azurerm_image" "terra-app-frontend" {
  name                = "win-iis"
  resource_group_name = "ci-indiarg"
}



resource "azurerm_windows_virtual_machine" "terra-app-frontend" {
    count = 3
  name                = "frontend-ciindia-vm.${count.index+1}"
  resource_group_name = azurerm_resource_group.terra-app.name
  location            = azurerm_resource_group.terra-app.location
  size                = "Standard_Ds1_V2"
  admin_username      = "adminuser"
  admin_password      = "P@$$w0rd1234!"
  source_image_id = data.azurerm_image.terra-app-frontend.id
  computer_name = "fend-ci-vm${count.index+1}"
  zone = "${count.index%3+1}"
  network_interface_ids = [
    azurerm_network_interface.terra-app-frontend[count.index].id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  
}


resource "azurerm_network_interface" "terra-app-frontend" {
    count = 3
  name                = "frontend-ciindia-nic${count.index+1}"
  location            = azurerm_resource_group.terra-app.location
  resource_group_name = azurerm_resource_group.terra-app.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.terra-app-subnet-frontend.id
    private_ip_address_allocation = "Dynamic"
  }
}