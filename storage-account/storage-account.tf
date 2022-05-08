resource "azurerm_storage_account" "sa" {
  resource_group_name       = var.resource_group_name
  location                  = var.location
  
  name                      = var.name
  account_kind              = "StorageV2"
  account_tier              = "Standard"
  account_replication_type  = "LRS"
  access_tier               = "Hot"

  enable_https_traffic_only       = true
  min_tls_version                 = "TLS1_2"
  allow_nested_items_to_be_public = false 
  shared_access_key_enabled       = false
  is_hns_enabled                  = false
  nfsv3_enabled                   = false


  blob_properties {
    versioning_enabled       = true
    last_access_time_enabled = true
    delete_retention_policy { 
      days = 35
    }
    container_delete_retention_policy { 
      days = 35
    }
  }
}

resource "azurerm_storage_account_network_rules" "sa_netrules" {
  storage_account_id = azurerm_storage_account.sa.id
  default_action     = "Deny"  
  bypass             = [ "None" ]
}
