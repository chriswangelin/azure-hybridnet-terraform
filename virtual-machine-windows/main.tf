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

  # Translate level to size, or if level is not set, use specified size (default if not specified)
  size = (var.size_level == 1 ? "Standard_B1s" : 
          var.size_level == 2 ? "Standard_B1ms" : 
          var.size_level == 3 ? "Standard_B2s" : 
          var.size_level == 4 ? "Standard_DS1_v2" : 
          var.size_level == 5 ? "Standard_DS2_v3" :
          var.size)
}