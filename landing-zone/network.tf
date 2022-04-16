resource "azurerm_virtual_network" "vnet" {
  name                = local.vnet_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  address_space       = var.vnet_address_space
}

resource "azurerm_subnet" "mgmt_snet" {  
  name                  = local.mgmt_snet_name
  virtual_network_name  = azurerm_virtual_network.vnet.name
  resource_group_name   = azurerm_resource_group.rg.name
  address_prefixes      = var.mgmt_snet_address_prefixes
}

resource "azurerm_virtual_network_peering" "peer_hub_to_spoke" {
  count                        = var.hub_resource_group_name != null ? 1 : 0
  name                         = "peer-hub-to-${azurerm_virtual_network.vnet.name}"
  resource_group_name          = var.hub_resource_group_name
  virtual_network_name         = var.hub_vnet_name
  remote_virtual_network_id    = azurerm_virtual_network.vnet.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = false
}

resource "azurerm_virtual_network_peering" "peer_spoke_to_hub" {
  count                        = var.hub_resource_group_name != null ? 1 : 0
  name                         = "peer-${azurerm_virtual_network.vnet.name}-to-hub"
  resource_group_name          = azurerm_resource_group.rg.name
  virtual_network_name         = local.vnet_name
  remote_virtual_network_id    = var.hub_vnet_id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
#  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_network_security_group" "mgmt_snet_nsg" {
  name                = local.mgmt_snet_nsg_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_network_security_rule" "mgmt_snet_allow_inbound_nsg_rule" {
  count                       = var.mgmt_snet_allow_ip_list != null ? 1 : 0
  name                        = "allow-inbound"
  priority                    = 1000
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = var.mgmt_snet_allow_ip_list
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.mgmt_snet_nsg.name
}

resource "azurerm_subnet_network_security_group_association" "mgmt_snet_nsg_assoc" {
  subnet_id                 = azurerm_subnet.mgmt_snet.id
  network_security_group_id = azurerm_network_security_group.mgmt_snet_nsg.id
}
