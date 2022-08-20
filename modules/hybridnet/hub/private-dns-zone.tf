#######################################################################################################################
# custom domain - all virtual machines in the hub and spokes are registered under this domain
#######################################################################################################################
resource azurerm_private_dns_zone vmreg_pdnsz {
  name                = var.vmreg_pdnsz_name
  resource_group_name = azurerm_resource_group.rg.name
}

resource azurerm_private_dns_zone_virtual_network_link vmreg_pdnsz_link {
  name                  = local.vmreg_pdnsz_link_name
  resource_group_name   = azurerm_resource_group.rg.name
  private_dns_zone_name = azurerm_private_dns_zone.vmreg_pdnsz.name
  virtual_network_id    = azurerm_virtual_network.vnet.id
  registration_enabled  = true
}

#######################################################################################################################
# All other private DNS zones
#######################################################################################################################
resource azurerm_private_dns_zone pdnsz {
  for_each            = toset(var.pdnsz_list)
  name                = "${each.value}"
  resource_group_name = azurerm_resource_group.rg.name
}

resource azurerm_private_dns_zone_virtual_network_link pdnsz_link {
  for_each              = toset(var.pdnsz_list)
  name                  = replace("${each.key}-pdnsz-link", ".", "-")
  resource_group_name   = azurerm_resource_group.rg.name
  private_dns_zone_name = "${each.value}"
  virtual_network_id    = azurerm_virtual_network.vnet.id
  depends_on = [
    azurerm_private_dns_zone.pdnsz
  ]
}
