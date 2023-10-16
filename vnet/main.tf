provider "azurerm" {
  features {}
}

data "azurerm_resource_group" "this" {
  name     = "rg-tags"
}

locals {
  vnet_tags = {
    random = "1234"
  }
  tags = merge(
    data.azurerm_resource_group.this.tags,
    local.vnet_tags
  )
}

resource "azurerm_virtual_network" "this" {
  name                = "my-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = data.azurerm_resource_group.this.location
  resource_group_name = data.azurerm_resource_group.this.name
  tags                = local.tags
}