resource azurerm_user_assigned_identity policy_assignment_identity {
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  name = local.policy_assignment_identity_name
}