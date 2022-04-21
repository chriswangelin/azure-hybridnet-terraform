output resource_group_name {
  value = azurerm_resource_group.rg.name
}

output location {
  value = azurerm_resource_group.rg.location
}

output vnet_id {
  value = azurerm_virtual_network.vnet.id
}

output vnet_name {
  value = azurerm_virtual_network.vnet.name
}

output mgmt_snet_id {
  value = azurerm_subnet.mgmt_snet.id
}

output mgmt_snet_address_prefixes {
  value = azurerm_subnet.mgmt_snet.address_prefixes
}

output winra_vm_id {
  value = module.winra_vm.vm_id
}

output winra_vm_private_ip_address {
  value = module.winra_vm.private_ip_address
}

output winra_vm_public_ip_address {
  value = module.winra_vm.public_ip_address
}

output clientip {
  value = chomp(data.http.clientip.body)
}