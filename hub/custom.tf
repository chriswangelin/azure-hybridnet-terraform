# Custom modules
module "dns_vm_001" {
  source = "../virtual-machine-linux"

  resource_group_name = azurerm_resource_group.rg.name
  name                = local.dns_vm_001_name
  location            = azurerm_resource_group.rg.location
  snet_id             = azurerm_subnet.dns_snet.id
  admin_username      = var.dns_vm_001_admin_username
  admin_password      = var.dns_vm_001_admin_password
  enable_public_ip    = true
  private_ip_address  = var.dns_vm_001_private_ip_address
}

module "mgmt_vm" {
  source = "../virtual-machine-linux"

   # Management VM
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  name                = local.mgmt_vm_name
  admin_username      = var.mgmt_vm_admin_username
  admin_password      = var.mgmt_vm_admin_password
  snet_id             = azurerm_subnet.mgmt_snet.id
  enable_public_ip    = true
  private_ip_address  = var.mgmt_vm_private_ip_address

  depends_on = [
     azurerm_virtual_network_dns_servers.vnet_dns_servers
  ]
}