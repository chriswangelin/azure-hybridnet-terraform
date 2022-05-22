module dns_vm_001 {
  source = "../../../virtual-machine-linux"

  resource_group_name  = azurerm_resource_group.rg.name
  name                 = local.dns_vm_001_name
  location             = var.location
  size_level           = var.dns_vm_001_size_level
  snet_id              = azurerm_subnet.dns_snet.id
  admin_username       = var.dns_vm_001_admin_username
  admin_password       = var.dns_vm_001_admin_password
  enable_public_ip     = var.dns_vm_001_enable_public_ip
  private_ip_address   = var.dns_vm_001_private_ip_address
}

module mgmt_vm {
  source = "../../../virtual-machine-linux"

  resource_group_name  = azurerm_resource_group.rg.name
  name                 = local.mgmt_vm_name
  location             = var.location
  size_level           = var.mgmt_vm_size_level
  snet_id              = azurerm_subnet.mgmt_snet.id
  admin_username       = var.mgmt_vm_admin_username
  admin_password       = var.mgmt_vm_admin_password
  enable_public_ip     = var.mgmt_vm_enable_public_ip
  private_ip_address   = var.mgmt_vm_private_ip_address

  depends_on = [
    azurerm_virtual_network_dns_servers.vnet_dns_servers # Wait for DNS servers to be assigned to vnet
  ]
}

module winra_vm {
  source = "../../../virtual-machine-windows"

  resource_group_name  = azurerm_resource_group.rg.name
  name                 = local.winra_vm_name
  location             = var.location
  size_level           = var.winra_vm_size_level
  snet_id              = azurerm_subnet.winra_snet.id
  admin_username       = var.winra_vm_admin_username
  admin_password       = var.winra_vm_admin_password
  enable_public_ip     = var.winra_vm_enable_public_ip
  enable_ip_forwarding = var.winra_vm_enable_ip_forwarding

  depends_on = [
    azurerm_virtual_network_dns_servers.vnet_dns_servers, # Wait for DNS servers to be assigned to vnet
  ]
}
