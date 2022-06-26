module "dns_vm_001" {
  source = "../../core/virtual-machine-linux"

  resource_group_name = azurerm_resource_group.rg.name
  name                = local.dns_vm_001_name
  location            = azurerm_resource_group.rg.location
  urn                 = var.dns_vm_001_urn
  plan                = var.dns_vm_001_plan
  size                = var.dns_vm_001_size
  admin_username      = var.dns_vm_001_admin_username
  admin_password      = var.dns_vm_001_admin_password
  snet_id             = azurerm_subnet.dns_snet.id
  enable_public_ip    = true
  private_ip_address  = var.dns_vm_001_private_ip_address
}

module "mgmt_vm" {
  source = "../../core/virtual-machine-linux"

  resource_group_name = azurerm_resource_group.rg.name
  name                = local.mgmt_vm_name
  location            = azurerm_resource_group.rg.location
  urn                 = var.mgmt_vm_urn
  plan                = var.mgmt_vm_plan
  size                = var.mgmt_vm_size
  admin_username      = var.mgmt_vm_admin_username
  admin_password      = var.mgmt_vm_admin_password
  snet_id             = azurerm_subnet.mgmt_snet.id
  enable_public_ip    = true
  private_ip_address  = var.mgmt_vm_private_ip_address

  depends_on = [
     azurerm_virtual_network_dns_servers.vnet_dns_servers
  ]
}
