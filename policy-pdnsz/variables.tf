variable management_group_name {
  type        = string
  description = "Management group to which the policies will be assigned."
  default     = "Tenant Root Group"
}
 iresource azurerm_management_group example {
  display_name = "Some Management Group"
}

resource azurerm_policy_definition example {
  name                = "only-deploy-in-westeurope"
  policy_type         = "Custom"
  mode                = "All"
  management_group_id = azurerm_management_group.example.group_id

  policy_rule = <<POLICY_RULE
    {
    "if": {
      "not": {
        "field": "location",
        "equals": "westeurope"
      }
    },
    "then": {
      "effect": "Deny"
    }
  }
POLICY_RULE
}

resource azurerm_management_group_policy_assignment example {
  name                 = "example-policy"
  policy_definition_id = azurerm_policy_definition.example.id
  management_group_id  = azurerm_management_group.example.id
}