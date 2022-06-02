resource azurerm_route_table onprem_to_hub_rt {
  name                          = var.route_table_name
  location                      = azurerm_resource_group.rg.location
  resource_group_name           = azurerm_resource_group.rg.name

  route {
    name                   = "to-hub"
    address_prefix         = var.remote_vnet_address_space
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = module.winra_vm.private_ip_address
  }
}
