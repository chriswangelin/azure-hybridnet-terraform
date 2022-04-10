# Resource types:
#   Virtual networks
#   Subnets
#     - NSG associations
#     - NAT gateway associations
#     - Route table associations

# On-premises virtual network
resource "azurerm_virtual_network" "vnet" {
  name                = local.vnet_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  address_space       = var.vnet_address_space
}

# Windows RAS subnet
resource "azurerm_subnet" "winra_snet" {
  name                  = local.winra_snet_name
  virtual_network_name  = azurerm_virtual_network.vnet.name
  resource_group_name   = azurerm_resource_group.rg.name
  address_prefixes      = var.winra_snet_address_prefixes
  depends_on = [
    azurerm_virtual_network.vnet
  ]
}

resource "azurerm_subnet_network_security_group_association" "winra_snet_nsg_assoc" {
  count                     = var.winra_snet_allow_ip_list == null ? 0 : 1
  subnet_id                 = azurerm_subnet.winra_snet.id
  network_security_group_id = azurerm_network_security_group.winra_snet_nsg.id
}

resource "azurerm_subnet_route_table_association" "winra_snet_rt_assoc" {
  subnet_id      = azurerm_subnet.winra_snet.id
  route_table_id = azurerm_route_table.winra_snet_rt.id
}

# DNS subnet
resource "azurerm_subnet" "dns_snet" {
  name                  = local.dns_snet_name
  virtual_network_name  = azurerm_virtual_network.vnet.name
  resource_group_name   = azurerm_resource_group.rg.name
  address_prefixes      = var.dns_snet_address_prefixes
  depends_on = [
    azurerm_virtual_network.vnet
  ]
}

resource "azurerm_subnet_network_security_group_association" "dns_snet_nsg_assoc" {
  count                     = var.dns_snet_allow_ip_list == null ? 0 : 1
  subnet_id                 = azurerm_subnet.dns_snet.id
  network_security_group_id = azurerm_network_security_group.dns_snet_nsg.id
}

# Management subnet
resource "azurerm_subnet" "mgmt_snet" {
  name                  = local.mgmt_snet_name
  virtual_network_name  = azurerm_virtual_network.vnet.name
  resource_group_name   = azurerm_resource_group.rg.name
  address_prefixes      = var.mgmt_snet_address_prefixes
  depends_on = [
    azurerm_virtual_network.vnet
  ]
}

resource "azurerm_subnet_network_security_group_association" "mgmt_snet_nsg_assoc" {
  count                     = var.mgmt_snet_allow_ip_list == null ? 0 : 1
  subnet_id                 = azurerm_subnet.mgmt_snet.id
  network_security_group_id = azurerm_network_security_group.mgmt_snet_nsg.id
}

resource "azurerm_virtual_network_dns_servers" "vnet_dns_servers" {
  virtual_network_id = azurerm_virtual_network.vnet.id
  dns_servers        = [ var.dns_vm_001_private_ip_address ]

  # This must not execute until after the DNS server has been created
  depends_on = [
    azurerm_virtual_machine_extension.dns_vm_001_config_unbound_dns_customscript_vmext
  ]
}

