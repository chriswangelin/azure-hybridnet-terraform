resource "azurerm_public_ip" "vpng_pip" {
  count               = var.vpng_enable ? 1 : 0
  name                = local.vpng_pip_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  allocation_method   = "Dynamic"
#  sku                 = "Standard"
}


resource "azurerm_virtual_network_gateway" "vpng" {
  count               = var.vpng_enable ? 1 : 0
  name                = local.vpng_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  type     = "Vpn"
  vpn_type = "RouteBased"

  active_active = false
  enable_bgp    = false
  sku           = "VpnGw1"

  ip_configuration {
    name                          = "vnetGatewayConfig"
    public_ip_address_id          = azurerm_public_ip.vpng_pip[0].id
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = azurerm_subnet.vpng_snet.id
  }
  depends_on = [
    azurerm_subnet.vpng_snet
  ]
}

resource "azurerm_virtual_network_gateway_connection" "onprem" {
  count               = var.vpng_enable ? 1 : 0
  name                = local.vpng_conn_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  type                       = "IPsec"
  virtual_network_gateway_id = azurerm_virtual_network_gateway.vpng[0].id
  local_network_gateway_id   = azurerm_local_network_gateway.lgw[0].id

  shared_key = var.vpng_shared_key
}