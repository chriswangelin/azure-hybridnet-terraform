resource "azurerm_local_network_gateway" "lgw" {
  count               = var.vpng_enable ? var.vpng_connection_onprem_enable ? 1 : 0 : 0
  name                = local.lgw_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  gateway_address     = var.lgw_gateway_address  ### Public IP address of Windows Server machine
  address_space       = var.lgw_address_space
}

### Need to add local gateway connection here