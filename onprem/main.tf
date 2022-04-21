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
  resource_group_name      = coalesce(var.resource_group_name, "${var.resource_prefix}-rg")

  vnet_name                = coalesce(var.vnet_name, "${var.resource_prefix}-vnet")
  mgmt_snet_name           = coalesce(var.mgmt_snet_name, "${var.resource_prefix}-mgmt-snet")
  mgmt_snet_nsg_name       = coalesce(var.mgmt_snet_nsg_name, "${var.resource_prefix}-mgmt-snet-nsg")
  mgmt_snet_allow_ip_list  = var.mgmt_snet_allow_ip_list == "auto" ? chomp(data.http.clientip.body) : var.mgmt_snet_allow_ip_list
  dns_snet_name            = coalesce(var.dns_snet_name, "${var.resource_prefix}-dns-snet")
  dns_snet_nsg_name        = coalesce(var.dns_snet_nsg_name, "${var.resource_prefix}-dns-snet-nsg")
  dns_snet_allow_ip_list   = var.dns_snet_allow_ip_list == "auto" ? chomp(data.http.clientip.body) : var.dns_snet_allow_ip_list
  winra_snet_name          = coalesce(var.winra_snet_name, "${var.resource_prefix}-winra-snet")
  winra_snet_nsg_name      = coalesce(var.winra_snet_nsg_name, "${var.resource_prefix}-winra-snet-nsg")
  winra_snet_allow_ip_list = var.winra_snet_allow_ip_list == "auto" ? chomp(data.http.clientip.body) : var.winra_snet_allow_ip_list

  mgmt_vm_name             = coalesce(var.mgmt_vm_name, "${var.resource_prefix}-mgmt-vm")
  winra_vm_name            = coalesce(var.winra_vm_name, "${var.resource_prefix}-winra-vm")
  dns_vm_001_name          = coalesce(var.dns_vm_001_name, "${var.resource_prefix}-dns-vm-001")
  
  route_table_name         = coalesce(var.route_table_name, "${var.resource_prefix}-winra-snet-rt")
  local_gateway_name       = coalesce(var.local_gateway_name, "${var.resource_prefix}-lgw")  
}

data "http" "clientip" {
  url = "https://ipv4.icanhazip.com/"
}