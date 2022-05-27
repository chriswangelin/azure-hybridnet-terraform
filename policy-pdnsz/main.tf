terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}

locals {
  policy_assignment_identity_name = "policy-assignment-identity"
}

provider azurerm {
  features { }
  skip_provider_registration = true
}

data azurerm_management_group mg {
  display_name = var.policy_management_group_name
}
