# Virtual network
resource "azurerm_virtual_network" "vnet" {
  name                = local.vnet_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  address_space       = var.vnet_address_space

  # The VM registration private DNS zone must exist in the hub before creating
  # landing zones.  Specifying this dependency avoids having to specify the
  # same dependency in each landing zone module call.
  depends_on = [
    azurerm_private_dns_zone.vmreg_pdnsz
  ]
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

resource "azurerm_virtual_network_dns_servers" "vnet_dns_servers" {
  virtual_network_id = azurerm_virtual_network.vnet.id
  dns_servers        = [ var.dns_vm_001_private_ip_address ]

  # This must not execute until after the DNS server has been created
  depends_on = [
    azurerm_virtual_machine_extension.dns_vm_001_config_unbound_dns_customscript_vmext
  ]
}
