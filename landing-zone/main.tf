terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}

# resource "random_pet" "admin_username_prefix" {
#   length    = 2
#   separator = ""
# }

locals {
  resource_prefix        = coalesce(var.resource_prefix, "spoke")
  spoke_number_formatted = var.spoke_number != null ? "-${var.spoke_number}" : ""
  resource_group_name    = coalesce(var.resource_group_name, "${local.resource_prefix}-rg${local.spoke_number_formatted}")
  vnet_name              = "${local.resource_prefix}${local.spoke_number_formatted}-vnet"
  mgmt_snet_name         = "${local.resource_prefix}${local.spoke_number_formatted}-vnet-mgmt-snet"
  mgmt_snet_nsg_name     = "${local.resource_prefix}${local.spoke_number_formatted}-vnet-mgmt-snet-nsg" 
  mgmt_vm_name           = coalesce(var.mgmt_vm_name, "${var.resource_prefix}-mgmt-vm")
  mgmt_vm_admin_username = coalesce(var.mgmt_vm_admin_username, "${local.resource_prefix}${local.spoke_number_formatted}-admin")
}

# data "azurerm_virtual_network" "hub_vnet" {
#   count               = var.hub_vnet_name == null ? 0 : 1
#   resource_group_name = var.hub_resource_group_name
#   name                = var.hub_vnet_name
# }