# Virtual network
resource azurerm_virtual_network vnet {
  name                = local.vnet_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  address_space       = local.vnet_address_space
}

resource azurerm_virtual_network_dns_servers vnet_dns_servers {
  virtual_network_id = azurerm_virtual_network.vnet.id
  dns_servers        = var.vnet_dns_servers
}

resource azurerm_virtual_network_peering peer_hub_to_spoke {
  name                         = "peer-hub-to-${azurerm_virtual_network.vnet.name}"
  resource_group_name          = var.hub_resource_group_name
  virtual_network_name         = var.hub_vnet_name
  remote_virtual_network_id    = azurerm_virtual_network.vnet.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  use_remote_gateways          = false
  allow_gateway_transit        = true
}

resource azurerm_virtual_network_peering peer_spoke_to_hub {
  name                         = "peer-${azurerm_virtual_network.vnet.name}-to-hub"
  resource_group_name          = azurerm_resource_group.rg.name
  virtual_network_name         = local.vnet_name
  remote_virtual_network_id    = var.hub_vnet_id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  use_remote_gateways          = var.vnet_peering_use_remote_gateways
  allow_gateway_transit        = false
}

# Subnets
resource azurerm_subnet app_snet {  
  name                  = local.app_snet_name
  virtual_network_name  = azurerm_virtual_network.vnet.name
  resource_group_name   = azurerm_resource_group.rg.name
  address_prefixes      = local.app_snet_address_prefixes
}

resource azurerm_subnet mgmt_snet {  
  name                  = local.mgmt_snet_name
  virtual_network_name  = azurerm_virtual_network.vnet.name
  resource_group_name   = azurerm_resource_group.rg.name
  address_prefixes      = local.mgmt_snet_address_prefixes
}
