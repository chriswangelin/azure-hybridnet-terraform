terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}

data azurerm_management_group mg {
  display_name = var.management_group_name
}