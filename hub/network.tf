# Virtual network
resource "azurerm_virtual_network" "vnet" {
  name                = local.vnet_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  address_space       = var.vnet_address_space
  dns_servers         = [ var.dns_vm_001_private_ip_address ]
}

# Subnet: AzureFirewallSubnet must be /26
resource "azurerm_subnet" "afw_snet" {
  name                 = "AzureFirewallSubnet"
  virtual_network_name = azurerm_virtual_network.vnet.name
  resource_group_name  = azurerm_resource_group.rg.name
  address_prefixes     = var.afw_snet_address_prefixes
  depends_on = [
    azurerm_virtual_network.vnet
  ]
}

# Subnet: GatewaySubnet - MS-recommended size = /27 (min. /29)
resource "azurerm_subnet" "vpng_snet" {
  name                 = "GatewaySubnet"
  virtual_network_name = azurerm_virtual_network.vnet.name
  resource_group_name  = azurerm_resource_group.rg.name
  address_prefixes     = var.vpng_snet_address_prefixes
  depends_on = [
    azurerm_virtual_network.vnet
  ]
}

# Subnet: DNS
resource "azurerm_subnet" "dns_snet" {
  name                  = local.dns_snet_name
  virtual_network_name  = azurerm_virtual_network.vnet.name
  resource_group_name   = azurerm_resource_group.rg.name
  address_prefixes      = var.dns_snet_address_prefixes
  depends_on = [
    azurerm_virtual_network.vnet
  ]
}

# Subnet: Management
resource "azurerm_subnet" "mgmt_snet" {
  name                  = local.mgmt_snet_name
  virtual_network_name  = azurerm_virtual_network.vnet.name
  resource_group_name   = azurerm_resource_group.rg.name
  address_prefixes      = var.mgmt_snet_address_prefixes
  depends_on = [
    azurerm_virtual_network.vnet
  ]
}

# Peering to on-prem
resource "azurerm_virtual_network_peering" "peer_hub_to_onprem" {
  count                        = var.peering_enable ? 0 : 1
  name                         = "peer-hub-to-onprem"
  resource_group_name          = azurerm_resource_group.rg.name
  virtual_network_name         = azurerm_virtual_network.vnet.name
  remote_virtual_network_id    = var.onprem_vnet_id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = false

  depends_on = [
    azurerm_virtual_network.vnet
  ]
}

resource "azurerm_virtual_network_peering" "peer_onprem_to_hub" {
  count                        = var.peering_enable ? 0 : 1
  name                         = "peer-onprem-to-hub"
  resource_group_name          = var.onprem_vnet_resource_group_name
  virtual_network_name         = var.onprem_vnet_name
  remote_virtual_network_id    = azurerm_virtual_network.vnet.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = false
  use_remote_gateways          = false

  depends_on = [
    azurerm_virtual_network.vnet
  ]
}

resource "azurerm_virtual_network_dns_servers" "vnet_dns_servers" {
  virtual_network_id = azurerm_virtual_network.vnet.id
  dns_servers        = [ var.dns_vm_001_private_ip_address ]

  # This must not execute until after the DNS server has been created
  depends_on = [
    azurerm_virtual_machine_extension.dns_vm_001_customscript_vmext
  ]
}
