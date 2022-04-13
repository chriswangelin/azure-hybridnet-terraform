resource "azurerm_resource_group" "rg" {
  # If no resource group name is passed in, then create a resource group with a random name
  count    = var.resource_group_name == null ? 1 : 0
  name     = local.resource_group_name
  location = var.location
}
