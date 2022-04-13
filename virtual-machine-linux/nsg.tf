resource "azurerm_network_security_group" "mgmt_snet_nsg" {
  count               = var.snet_id == null ? 1 : 0
  name                = local.mgmt_snet_nsg_name
  resource_group_name = local.resource_group_name
  location            = var.location

  # Resource group must exist before the NSG can be created.  If resource group is passed in, then it is assumed to 
  # exists; otherwise, it must be created.
  depends_on = [
    azurerm_resource_group.rg
  ]
}

resource "azurerm_network_security_rule" "mgmt_snet_allow_inbound_nsg_rule" {
  count                       = var.snet_id == null ? var.mgmt_snet_allow_ip_list == null ? 0 : 1 : 0
  name                        = "allow-inbound"
  priority                    = 1000
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = var.mgmt_snet_allow_ip_list
  destination_address_prefix  = "*"
  resource_group_name         = local.resource_group_name
  network_security_group_name = azurerm_network_security_group.mgmt_snet_nsg[0].name
}

resource "azurerm_subnet_network_security_group_association" "mgmt_snet_nsg_assoc" {
  count                     = var.snet_id == null ? 1 : 0
  subnet_id                 = azurerm_subnet.mgmt_snet[0].id
  network_security_group_id = azurerm_network_security_group.mgmt_snet_nsg[0].id
}