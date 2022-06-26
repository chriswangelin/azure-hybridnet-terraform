resource azurerm_management_group_policy_assignment policy_assignment {
  for_each = local.private_dns_zone_map_mg

  name                 = "${each.key}" # 3-24 characters
  display_name         = "${each.key}" # (optional) can be > 24 characters
  location             = "eastus"
  policy_definition_id = azurerm_policy_definition.policy["${each.key}"].id
  management_group_id  = data.azurerm_management_group.mg[0].id

  identity {
    type         = "UserAssigned"
    identity_ids = [ azurerm_user_assigned_identity.policy_assignment_identity.id ] 
  }

  parameters = <<PARAMS
    {
      "privateDnsZoneId": {
        "value": "/subscriptions/${local.pdnsz_subscription_id}/resourcegroups/hub-rg/providers/microsoft.network/privatednszones/${each.value[1]}"
      }
    }
PARAMS
}

resource azurerm_subscription_policy_assignment policy_assignment {
  for_each = local.private_dns_zone_map_subs

  name                 = "${each.key}" # 3-24 characters
  display_name         = "${each.key}" # (optional) can be > 24 characters
  location             = "eastus"
  policy_definition_id = azurerm_policy_definition.policy["${each.key}"].id
  subscription_id      = coalesce(var.policy_subscription_id, data.azurerm_subscription.current.id)
  
  identity {
    type         = "UserAssigned"
    identity_ids = [ azurerm_user_assigned_identity.policy_assignment_identity.id ] 
  }

  parameters = <<PARAMS
    {
      "privateDnsZoneId": {
        "value": "/subscriptions/${local.pdnsz_subscription_id}/resourcegroups/hub-rg/providers/microsoft.network/privatednszones/${each.value[1]}"
      }
    }
PARAMS
}
