module mgmt_vm {
  source = "../../core/virtual-machine-linux"

  resource_group_name = azurerm_resource_group.rg.name
  name                = local.mgmt_vm_name
  location            = var.location
  urn                 = var.mgmt_vm_urn
  plan                = var.mgmt_vm_plan
  size                = var.mgmt_vm_size
  admin_username      = var.mgmt_vm_admin_username
  snet_id             = azurerm_subnet.mgmt_snet.id
  enable_public_ip    = var.mgmt_vm_enable_public_ip
}