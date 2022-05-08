# Private DNS zone in hub for registering virtual machines attached to landing zone vnet
resource "azurerm_private_dns_zone_virtual_network_link" "vmreg_pdnsz_link" {
  count                 = var.vnet_peering_enable != null ? 1 : 0
  name                  = local.vmreg_pdnsz_link_name
  resource_group_name   = var.vmreg_pdnsz_resource_group_name
  private_dns_zone_name = var.vmreg_pdnsz_name
  virtual_network_id    = azurerm_virtual_network.vnet.id
  registration_enabled  = true
}
