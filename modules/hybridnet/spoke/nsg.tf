
resource azurerm_network_security_group app_snet_nsg {
  name                = local.app_snet_nsg_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource azurerm_subnet_network_security_group_association app_snet_nsg_assoc {
  subnet_id                 = azurerm_subnet.app_snet.id
  network_security_group_id = azurerm_network_security_group.app_snet_nsg.id
}

resource azurerm_network_security_rule app_snet_allow_inbound_nsg_rule {
  count                       = local.app_snet_allow_ip_list != null ? 1 : 0
  name                        = "allow-inbound"
  priority                    = 1000
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = local.app_snet_allow_ip_list
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.app_snet_nsg.name
}

resource azurerm_network_security_group mgmt_snet_nsg {
  name                = local.mgmt_snet_nsg_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource azurerm_subnet_network_security_group_association mgmt_snet_nsg_assoc {
  subnet_id                 = azurerm_subnet.mgmt_snet.id
  network_security_group_id = azurerm_network_security_group.mgmt_snet_nsg.id
}

resource azurerm_network_security_rule mgmt_snet_allow_inbound_nsg_rule {
  count                       = local.mgmt_snet_allow_ip_list != null ? 1 : 0
  name                        = "allow-inbound"
  priority                    = 1000
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = local.mgmt_snet_allow_ip_list
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.mgmt_snet_nsg.name
}
