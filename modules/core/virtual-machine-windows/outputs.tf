output vm_id {
  description = "Virtual machine resource ID."
  value       = azurerm_windows_virtual_machine.vm.id
}

output private_ip_address {
  description = "Virtual machine private IP address."
  value       = azurerm_network_interface.nic_001.private_ip_address
}

output public_ip_address {
  count       = var.enable_public_ip ? 1 : 0
  description = "Virtual machine public IP address."
  value       = azurerm_public_ip.pip_001[0].ip_address
}
