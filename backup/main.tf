terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.50.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id =  "2516b39f-5013-4afb-918b-0ccab1067b26"
}

resource "azurerm_resource_group" "terra-admin" {
  name     = "admin-cindia-rg"
  location = "West Europe"
}

resource "azurerm_resource_group" "terra-app" {
  name     = "admin-cindia-rg"
  location = "West Europe"
}

