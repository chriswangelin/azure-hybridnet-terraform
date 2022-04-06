output vnet_id {
  value = azurerm_virtual_network.vnet.id
}

output mgmt_snet_id {
  value = azurerm_subnet.mgmt_snet.id
}