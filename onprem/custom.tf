# Custom modules
module "winra_vm" {
  source = "../virtual-machine-windows"

  resource_group_name  = local.resource_group_name
  name                 = local.winra_vm_name
  location             = var.location
  snet_id              = azurerm_subnet.winra_snet.id
  admin_username       = var.winra_vm_admin_username
  admin_password       = var.winra_vm_admin_password
  enable_public_ip     = var.winra_vm_enable_public_ip
  enable_ip_forwarding = var.winra_vm_enable_ip_forwarding

  depends_on = [
    azurerm_resource_group.rg,
    azurerm_subnet.mgmt_snet
  ]
}

# Custom modules
module "dns_vm_001" {
  source = "../virtual-machine-linux"

  resource_group_name  = local.resource_group_name
  name                 = local.dns_vm_001_name
  location             = var.location
  snet_id              = azurerm_subnet.dns_snet.id
  admin_username       = var.dns_vm_001_admin_username
  admin_password       = var.dns_vm_001_admin_password
  enable_public_ip     = var.dns_vm_001_enable_public_ip
  custom_data          = local.dns_vm_001_custom_data

  depends_on = [
    azurerm_resource_group.rg,
    azurerm_subnet.dns_snet
  ]
}
