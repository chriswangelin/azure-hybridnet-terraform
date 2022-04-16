output resource_group_name {
  value = azurerm_resource_group.rg.name
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

output vpng_public_ip_address {
  value = try(azurerm_public_ip.vpng_pip[0].ip_address, null)
}

output vnet_address_space {
  value = azurerm_virtual_network.vnet.address_space
}