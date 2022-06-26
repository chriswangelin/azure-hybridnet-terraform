terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0, < 4.0.0"
    }
  }
}

locals {
  spoke_name                 = coalesce(var.spoke_name, "spoke${var.vnet_spoke_number}")
  resource_group_name        = coalesce(var.resource_group_name, "${local.spoke_name}-rg")

  vnet_name                  = "${local.spoke_name}-vnet"
  vnet_address_space         = coalesce(var.vnet_address_space, [ "10.${var.vnet_spoke_number}.0.0/16" ])

  app_snet_name              = "${local.spoke_name}-vnet-app-snet"
  app_snet_address_prefixes  = coalesce(var.app_snet_address_prefixes, [ "10.${var.vnet_spoke_number}.1.0/24" ])
  app_snet_nsg_name          = "${local.spoke_name}-vnet-app-snet-nsg" 
  app_snet_allow_ip_list     = var.app_snet_allow_ip_list == "clientip" ? chomp(data.http.clientip.body) : var.app_snet_allow_ip_list

  mgmt_snet_name             = "${local.spoke_name}-vnet-mgmt-snet"
  mgmt_snet_address_prefixes = coalesce(var.mgmt_snet_address_prefixes, [ "10.${var.vnet_spoke_number}.255.0/24" ])
  mgmt_snet_nsg_name         = "${local.spoke_name}-vnet-mgmt-snet-nsg" 
  mgmt_snet_allow_ip_list    = var.mgmt_snet_allow_ip_list == "clientip" ? chomp(data.http.clientip.body) : var.mgmt_snet_allow_ip_list

  mgmt_vm_name               = coalesce(var.mgmt_vm_name, "${local.spoke_name}-mgmt-vm")

  vmreg_pdnsz_link_name      = "${local.vnet_name}-vmreg-pdnsz-link"
}

data "http" "clientip" {
  url = "https://ipv4.icanhazip.com/"
}
