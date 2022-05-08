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

locals {
  name                    = coalesce(var.name, "${random_pet.resource_prefix.id}-vm")  
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
