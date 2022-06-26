resource azurerm_public_ip vpng_pip {
  count               = var.vpng_enable ? 1 : 0
  name                = local.vpng_pip_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  allocation_method   = "Dynamic"
#  sku                 = "Standard"
}

resource azurerm_virtual_network_gateway vpng {
  count               = var.vpng_enable ? 1 : 0
  name                = local.vpng_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  type     = "Vpn"
  vpn_type = "RouteBased"

  active_active = false
  enable_bgp    = false
  sku           = "Basic"
  #sku           = "VpnGw1"

  ip_configuration {
    name                          = "vnetGatewayConfig"
    public_ip_address_id          = azurerm_public_ip.vpng_pip[0].id
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = azurerm_subnet.vpng_snet.id
  }

  # Errors sometimes occur when the VPN gateway is provisioned in parallel with
  # other resources.  Adding these dependencies reduces the parallel activity.
  depends_on = [
    azurerm_subnet_network_security_group_association.dns_snet_nsg_assoc,
    azurerm_subnet_network_security_group_association.mgmt_snet_nsg_assoc,
    module.mgmt_vm,
    azurerm_virtual_machine_extension.dns_vm_001_config_unbound_dns_customscript_vmext,
    azurerm_firewall.afw
  ]
}

resource "azurerm_local_network_gateway" "lgw" {
  count               = var.vpng_enable ? var.vpng_connection_onprem_enable ? 1 : 0 : 0
  name                = local.lgw_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  gateway_address     = var.lgw_gateway_address  ### Public IP address of Windows Server machine
  address_space       = var.lgw_address_space
}

resource azurerm_virtual_network_gateway_connection hub_to_onprem {
  count               = var.vpng_enable ? var.vpng_connection_onprem_enable ? 1 : 0 : 0
  name                = local.vpng_conn_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  type                       = "IPsec"
  virtual_network_gateway_id = azurerm_virtual_network_gateway.vpng[0].id
  local_network_gateway_id   = azurerm_local_network_gateway.lgw[0].id

  shared_key = var.vpng_shared_key
}
