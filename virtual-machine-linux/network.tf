resource "azurerm_virtual_network" "vnet" {
  # If no subnet id is passed in, then create a virtual network and subnet with random names
  count               = var.snet_id == null ? 1 : 0
  resource_group_name = local.resource_group_name
  name                = local.vnet_name
  location            = var.location
  address_space       = var.vnet_address_space

  # Explicit dependency added since resource group must be created when it's not passed in
  depends_on = [
    azurerm_resource_group.rg
  ]
}

resource "azurerm_subnet" "mgmt_snet" {
  count                = var.snet_id == null ? 1 : 0
  resource_group_name  = local.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet[0].name
  name                 = local.mgmt_snet_name
  address_prefixes     = var.vnet_address_space
}

