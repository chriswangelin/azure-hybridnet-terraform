
# hub.net
resource "azurerm_private_dns_a_record" "hub_dot_net_pdnsz_hub_dns_vm_001_a_record" {
  name                = "hub-dns-vm-001"
  zone_name           = azurerm_private_dns_zone.hub_dot_net_pdnsz.name
  resource_group_name = azurerm_resource_group.rg.name
  ttl                 = 300
  records             = [ "10.0.254.4" ]
}

resource "azurerm_private_dns_a_record" "hub_dot_net_pdnsz_hub_mgmt_vm_a_record" {
  name                = "hub-mgmt-vm"
  zone_name           = azurerm_private_dns_zone.hub_dot_net_pdnsz.name
  resource_group_name = azurerm_resource_group.rg.name
  ttl                 = 300
  records             = [ "10.0.255.4" ]
}