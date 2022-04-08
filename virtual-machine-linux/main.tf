terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}

locals {
  nic_name_001      = "${var.name}-nic-001"
  pip_name_001      = "${var.name}-pip-001"
  ipconfig_name_001 = "ipconfig-001"
  os_disk_name      = "${var.name}-osdisk-001"
}