output vm_id {
  value = azurerm_linux_virtual_machine.vm.id
}

output private_ip_address {
  value = azurerm_network_interface.nic_001.private_ip_address
}

output admin_username {
  value = local.admin_username
}