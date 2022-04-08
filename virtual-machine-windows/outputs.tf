output vm_id {
  value = azurerm_windows_virtual_machine.vm.id
}

output private_ip_address {
  value = azurerm_network_interface.nic_001.private_ip_address
}

output public_ip_address {
  value = azurerm_public_ip.pip_001[0].ip_address
}