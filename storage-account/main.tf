terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}

provider azurerm {
  skip_provider_registration = true  
  storage_use_azuread        = true
  features { }
}
