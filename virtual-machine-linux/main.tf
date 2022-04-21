terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}

resource "random_pet" "resource_prefix" { 
  length    = 2
  separator = ""
}

resource "random_pet" "admin_username_prefix" {
  length    = 2
  separator = ""
}

locals {
  resource_group_name     = coalesce(var.resource_group_name, "${random_pet.resource_prefix.id}-rg")
  name                    = coalesce(var.name, "${random_pet.resource_prefix.id}-vm")  
  vnet_name               = "${random_pet.resource_prefix.id}-vnet"
  mgmt_snet_name          = "${random_pet.resource_prefix.id}-vnet-mgmt-snet"
  mgmt_snet_nsg_name      = "${random_pet.resource_prefix.id}-vnet-mgmt-snet-nsg"
  mgmt_snet_allow_ip_list = var.mgmt_snet_allow_ip_list == "auto" ? chomp(data.http.clientip.body) : var.mgmt_snet_allow_ip_list
  nic_name_001            = "${local.name}-nic-001"
  pip_name_001            = "${local.name}-pip-001"
  ipconfig_name_001       = "ipconfig-001"
  os_disk_name            = "${local.name}-osdisk-001"

  # Translate level to size, or if level is not set, use specified size (default if not specified)
  size = (var.size_level == 1 ? "Standard_B2s" : 
          var.size_level == 2 ? "Standard_DS1_v2" : 
          var.size_level == 3 ? "Standard_DS2_v3" :
          var.size)
}

data "http" "clientip" {
  url = "https://ipv4.icanhazip.com/"
}