# Terraform block
# Providers
# Locals
# Data sources
# Other non-resources except variables and outputs
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}

provider "azurerm" {
  skip_provider_registration = true  
  features { }
}

locals {
  resource_group_name    = coalesce(var.resource_group_name, "${var.resource_prefix}-rg")
  winra_vm_name          = coalesce(var.winra_vm_name, "${var.resource_prefix}-winra-vm")
  dns_vm_001_name        = coalesce(var.dns_vm_001_name, "${var.resource_prefix}-dns-vm-001")
  vnet_name              = coalesce(var.vnet_name, "${var.resource_prefix}-vnet")
  winra_snet_name        = coalesce(var.winra_snet_name, "${var.resource_prefix}-winra-snet")
  winra_snet_nsg_name    = coalesce(var.winra_snet_nsg_name, "${var.resource_prefix}-winra-snet-nsg")
  dns_snet_name          = coalesce(var.dns_snet_name, "${var.resource_prefix}-dns-snet")
  dns_snet_nsg_name      = coalesce(var.dns_snet_nsg_name, "${var.resource_prefix}-dns-snet-nsg")
  mgmt_snet_name         = coalesce(var.mgmt_snet_name, "${var.resource_prefix}-mgmt-snet")
  mgmt_snet_nsg_name     = coalesce(var.mgmt_snet_nsg_name, "${var.resource_prefix}-mgmt-snet-nsg")
  route_table_name       = coalesce(var.route_table_name, "${var.resource_prefix}-winra-snet-rt")
  local_gateway_name     = coalesce(var.local_gateway_name, "${var.resource_prefix}-lgw")
}
