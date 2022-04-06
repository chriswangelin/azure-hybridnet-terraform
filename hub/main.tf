terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}

provider azurerm {
  skip_provider_registration = true
  features { }
}

locals {
  resource_group_name = coalesce(var.resource_group_name, "${var.resource_prefix}-rg")

  vnet_name              = coalesce(var.vnet_name, "${var.resource_prefix}-vnet")
  mgmt_snet_name         = coalesce(var.mgmt_snet_name, "${var.resource_prefix}-mgmt-snet")
  mgmt_snet_nsg_name     = coalesce(var.mgmt_snet_nsg_name, "${var.resource_prefix}-mgmt-snet-nsg")
  dns_snet_name          = coalesce(var.dns_snet_name, "${var.resource_prefix}-dns-snet")
  dns_snet_nsg_name      = coalesce(var.dns_snet_nsg_name, "${var.resource_prefix}-dns-snet-nsg")

  mgmt_vm_name           = coalesce(var.mgmt_vm_name, "${var.resource_prefix}-mgmt-vm")
  dns_vm_001_name        = coalesce(var.dns_vm_001_name, "${var.resource_prefix}-dns-vm-001")

  afw_name               = coalesce(var.afw_name, "${var.resource_prefix}-afw")
  afw_pip_name           = "${local.afw_name}-pip"

  vpng_name              = coalesce(var.vpng_name, "${var.resource_prefix}-vpng")
  vpng_conn_name         = "onprem-conn"
  vpng_pip_name          = "${local.vpng_name}-pip"

  lgw_name               = coalesce(var.lgw_name, "${var.resource_prefix}-lgw")
}