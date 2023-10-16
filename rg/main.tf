provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "this" {
  name     = "rg-tags"
  location = "eastus"
  tags = {
    environment = "dev"
    costcenter  = "it"
  }
}