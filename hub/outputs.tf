output vnet_id {
  value = azurerm_virtual_network.vnet.id
}

output mgmt_snet_id {
  value = azurerm_subnet.mgmt_snet.id
}

output vpng_public_ip_address {
  value = azurerm_public_ip.vpng_pip[0].ip_address
}

output vnet_address_space {
  value = azurerm_virtual_network.vnet.address_space
}