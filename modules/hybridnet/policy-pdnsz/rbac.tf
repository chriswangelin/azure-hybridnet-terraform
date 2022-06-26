resource azurerm_role_assignment network_contributor_on_policy_management_group_to_policy_assignment_identity {
  count                = var.policy_management_group_name != null ? 1 : 0
  scope                = data.azurerm_management_group.mg[0].id
  role_definition_name = "Network Contributor"
  principal_id         = azurerm_user_assigned_identity.policy_assignment_identity.principal_id
}

resource azurerm_role_assignment network_contributor_on_policy_subscription_to_policy_assignment_identity {
  count                = var.policy_management_group_name != null ? 0 : 1
  scope                = data.azurerm_subscription.current.id
  role_definition_name = "Network Contributor"
  principal_id         = azurerm_user_assigned_identity.policy_assignment_identity.principal_id
}