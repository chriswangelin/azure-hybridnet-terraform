terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.0.0"
    }
  }
}

locals {
  nic_name_001      = "${var.name}-nic-001"
  pip_name_001      = "${var.name}-pip-001"
  ipconfig_name_001 = "ipconfig-001"
  os_disk_name      = "${var.name}-osdisk-001"

  # Split urn into its component pieces 
  source_image_publisher = split(":", var.urn)[0] 
  source_image_offer     = split(":", var.urn)[1]
  source_image_sku       = split(":", var.urn)[2]
  source_image_version   = split(":", var.urn)[3]

  plan_publisher = var.plan != null ? split(":", var.plan)[0] : null
  plan_product   = var.plan != null ? split(":", var.plan)[1] : null
  plan_name      = var.plan != null ? split(":", var.plan)[2] : null
}