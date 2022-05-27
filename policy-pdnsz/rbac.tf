resource azurerm_role_assignment network_contributor_on_root_management_group_to_policy_assignment_identity {
  scope                = data.azurerm_management_group.mg.id
  role_definition_name = "Network Contributor"
  principal_id         = azurerm_user_assigned_identity.policy_assignment_identity.principal_id
}