module "mgmt_vm" {
  source = "../virtual-machine-linux"

  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  name                = local.mgmt_vm_name
  admin_username      = local.mgmt_vm_admin_username
  snet_id             = azurerm_subnet.mgmt_snet.id
  enable_public_ip    = var.mgmt_vm_enable_public_ip
}