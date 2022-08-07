variable resource_group_name {
  type        = string
  description = "The name of the resource group in which to create the storage account. Changing this forces a new resource to be created."
}

variable location {
  type        = string
  description = "Storage account location."
  default     = "eastus"
}

variable name {
  type        = string
  description = "Specifies the name of the storage account. Changing this forces a new resource to be created. This must be unique across the entire Azure service, not just within the resource group."
}

variable snet_id {
  type        = string
  description = "Resource ID of subnet to which the private endpoint will be connected."
}

variable storage_account_network_rules_default_action {
  type        = string
  description = "Allow or Deny public network access to the storage account."
  default     = "Deny"
}
