output vnet_address_space {
  value       = azurerm_virtual_network.vnet.address_space
  description = "Virtual network address space."
}

output winra_vm_id {
  value       = module.winra_vm.id
  description = "Resource ID of the Windows Remote Access (RAS) virtual machine."
}

output winra_vm_public_ip_address {
  value       = module.winra_vm.public_ip_address
  description = "Public IP address of the Windows Remote Access (RAS) virtual machine."
}
