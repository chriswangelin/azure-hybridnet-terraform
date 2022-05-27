module dns_vm_001 {
  source = "../virtual-machine-linux"

  resource_group_name  = azurerm_resource_group.rg.name
  name                 = local.dns_vm_001_name
  location             = var.location
  urn                  = var.dns_vm_001_urn
  plan_publisher       = var.dns_vm_001_plan_publisher
  plan_product         = var.dns_vm_001_plan_product
  plan_name            = var.dns_vm_001_plan_name
  size                 = var.dns_vm_001_size
  admin_username       = var.dns_vm_001_admin_username
  admin_password       = var.dns_vm_001_admin_password
  snet_id              = azurerm_subnet.dns_snet.id
  enable_public_ip     = var.dns_vm_001_enable_public_ip
  private_ip_address   = var.dns_vm_001_private_ip_address
}

module mgmt_vm {
  source = "../virtual-machine-linux"

  resource_group_name  = azurerm_resource_group.rg.name
  name                 = local.mgmt_vm_name
  location             = var.location
  urn                  = var.mgmt_vm_urn
  plan_publisher       = var.mgmt_vm_plan_publisher
  plan_product         = var.mgmt_vm_plan_product
  plan_name            = var.mgmt_vm_plan_name
  size                 = var.mgmt_vm_size
  admin_username       = var.mgmt_vm_admin_username
  admin_password       = var.mgmt_vm_admin_password
  snet_id              = azurerm_subnet.mgmt_snet.id
  enable_public_ip     = var.mgmt_vm_enable_public_ip
  private_ip_address   = var.mgmt_vm_private_ip_address

  depends_on = [
    azurerm_virtual_network_dns_servers.vnet_dns_servers # Wait for DNS servers to be assigned to vnet
  ]
}

module winra_vm {
  source = "../virtual-machine-windows"

  resource_group_name  = azurerm_resource_group.rg.name
  name                 = local.winra_vm_name
  location             = var.location
  urn                  = var.winra_vm_urn
  plan_publisher       = var.winra_vm_plan_publisher
  plan_product         = var.winra_vm_plan_product
  plan_name            = var.winra_vm_plan_name
  size                 = var.winra_vm_size
  admin_username       = var.winra_vm_admin_username
  admin_password       = var.winra_vm_admin_password
  snet_id              = azurerm_subnet.winra_snet.id
  enable_public_ip     = var.winra_vm_enable_public_ip
  enable_ip_forwarding = var.winra_vm_enable_ip_forwarding

  depends_on = [
    azurerm_virtual_network_dns_servers.vnet_dns_servers # Wait for DNS servers to be assigned to vnet
  ]
}
