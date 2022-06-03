terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0, < 4.0.0"
    }
  }
}

locals {
  policy_assignment_identity_name = "policy-assignment-identity"
  pdnsz_subscription_id           = coalesce(var.pdnsz_subscription_id, data.azurerm_subscription.current.id)
  policy_subscription_id          = coalesce(var.policy_subscription_id, data.azurerm_subscription.current.id)
  private_dns_zone_map_mg         = var.policy_management_group_name != null ? var.private_dns_zone_map : {}
  private_dns_zone_map_subs       = var.policy_management_group_name != null ? {} : var.private_dns_zone_map
}

provider azurerm {
  features { }
  skip_provider_registration = true
}

data "azurerm_subscription" "current" {}

data azurerm_management_group mg {
  count = var.policy_management_group_name != null ? 1 : 0
  display_name = var.policy_management_group_name
}
