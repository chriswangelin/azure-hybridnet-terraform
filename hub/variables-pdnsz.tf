variable custom_domain_name {
  type        = string
  description = "Custom domain for hub private DNS zone."
  default     = "foo.net"
}

variable enable_privatelink_azure_automation_net_pdnsz {
  type        = bool
  description = "Toggle creation of private DNS zone corresponding to the variable name."
  default     = false 
}

variable enable_privatelink_database_windows_net_pdnsz {
  type        = bool
  description = "Toggle creation of private DNS zone corresponding to the variable name."
  default     = false
}

variable enable_privatelink_sql_azuresynapse_net_pdnsz {
  type        = bool
  description = "Toggle creation of private DNS zone corresponding to the variable name."
  default     = false
}

variable enable_privatelink_sqlondemand_azuresynapse_net_pdnsz {
  type        = bool
  description = "Toggle creation of private DNS zone corresponding to the variable name."
  default     = false
}

variable enable_privatelink_dev_azuresynapse_net_pdnsz {
  type        = bool
  description = "Toggle creation of private DNS zone corresponding to the variable name."
  default     = false
}

variable enable_privatelink_azuresynapse_net_pdnsz {
  type        = bool
  description = "Toggle creation of private DNS zone corresponding to the variable name."
  default     = false
}

variable enable_privatelink_blob_core_windows_net_pdnsz {
  type        = bool
  description = "Toggle creation of private DNS zone corresponding to the variable name."
  default     = false
}

variable enable_privatelink_table_core_windows_net_pdnsz {
  type        = bool
  description = "Toggle creation of private DNS zone corresponding to the variable name."
  default     = false
}

variable enable_privatelink_queue_core_windows_net_pdnsz {
  type        = bool
  description = "Toggle creation of private DNS zone corresponding to the variable name."
  default     = false
}

variable enable_privatelink_file_core_windows_net_pdnsz {
  type        = bool
  description = "Toggle creation of private DNS zone corresponding to the variable name."
  default     = false
}

variable enable_privatelink_web_core_windows_net_pdnsz {
  type        = bool
  description = "Toggle creation of private DNS zone corresponding to the variable name."
  default     = false
}

variable enable_privatelink_dfs_core_windows_net_pdnsz {
  type        = bool
  description = "Toggle creation of private DNS zone corresponding to the variable name."
  default     = false
}

variable enable_privatelink_documents_azure_com_pdnsz {
  type        = bool
  description = "Toggle creation of private DNS zone corresponding to the variable name."
  default     = false
}

variable enable_privatelink_mongo_cosmos_azure_com_pdnsz {
  type        = bool
  description = "Toggle creation of private DNS zone corresponding to the variable name."
  default     = false
}

variable enable_privatelink_cassandra_cosmos_azure_com_pdnsz {
  type        = bool
  description = "Toggle creation of private DNS zone corresponding to the variable name."
  default     = false
}

variable enable_privatelink_gremlin_cosmos_azure_com_pdnsz {
  type        = bool
  description = "Toggle creation of private DNS zone corresponding to the variable name."
  default     = false
}

variable enable_privatelink_table_cosmos_azure_com_pdnsz {
  type        = bool
  description = "Toggle creation of private DNS zone corresponding to the variable name."
  default     = false
}

variable enable_privatelink_centralus_batch_azure_com_pdnsz {
  type        = bool
  description = "Toggle creation of private DNS zone corresponding to the variable name."
  default     = false
}

variable enable_privatelink_eastus_batch_azure_com_pdnsz {
  type        = bool
  description = "Toggle creation of private DNS zone corresponding to the variable name."
  default     = false
}

variable enable_privatelink_westus_batch_azure_com_pdnsz {
  type        = bool
  description = "Toggle creation of private DNS zone corresponding to the variable name."
  default     = false
}

variable enable_privatelink_postgres_database_azure_com_pdnsz {
  type        = bool
  description = "Toggle creation of private DNS zone corresponding to the variable name."
  default     = false
}

variable enable_privatelink_mysql_database_azure_com_pdnsz {
  type        = bool
  description = "Toggle creation of private DNS zone corresponding to the variable name."
  default     = false
}

variable enable_privatelink_mariadb_database_azure_com_pdnsz {
  type        = bool
  description = "Toggle creation of private DNS zone corresponding to the variable name."
  default     = false
}

variable enable_privatelink_vaultcore_azure_net_pdnsz {
  type        = bool
  description = "Toggle creation of private DNS zone corresponding to the variable name."
  default     = false
}

variable enable_privatelink_managedhsm_azure_net_pdnsz {
  type        = bool
  description = "Toggle creation of private DNS zone corresponding to the variable name."
  default     = false
}

variable enable_privatelink_eastus_azmk8s_io_pdnsz {
  type        = bool
  description = "Toggle creation of private DNS zone corresponding to the variable name."
  default     = false
}

variable enable_privatelink_search_windows_net_pdnsz {
  type        = bool
  description = "Toggle creation of private DNS zone corresponding to the variable name."
  default     = false
}

variable enable_privatelink_azurecr_io_pdnsz {
  type        = bool
  description = "Toggle creation of private DNS zone corresponding to the variable name."
  default     = false
}

variable enable_privatelink_azconfig_io_pdnsz {
  type        = bool
  description = "Toggle creation of private DNS zone corresponding to the variable name."
  default     = false
}

variable enable_privatelink_centralus_backup_windowsazure_com_pdnsz {
  type        = bool
  description = "Toggle creation of private DNS zone corresponding to the variable name."
  default     = false
}

variable enable_privatelink_eastus_backup_windowsazure_com_pdnsz {
  type        = bool
  description = "Toggle creation of private DNS zone corresponding to the variable name."
  default     = false
}

variable enable_privatelink_hypervrecoverymanager_windowsazure_com_pdnsz {
  type        = bool
  description = "Toggle creation of private DNS zone corresponding to the variable name."
  default     = false
}

variable enable_privatelink_siterecovery_windowsazure_com_pdnsz {
  type        = bool
  description = "Toggle creation of private DNS zone corresponding to the variable name."
  default     = false
}

variable enable_privatelink_azure_devices_net_pdnsz {
  type        = bool
  description = "Toggle creation of private DNS zone corresponding to the variable name."
  default     = false
}

variable enable_privatelink_servicebus_windows_net_pdnsz {
  type        = bool
  description = "Toggle creation of private DNS zone corresponding to the variable name."
  default     = false
}

variable enable_privatelink_eventgrid_azure_net_pdnsz {
  type        = bool
  description = "Toggle creation of private DNS zone corresponding to the variable name."
  default     = false
}

variable enable_privatelink_azurewebsites_net_pdnsz {
  type        = bool
  description = "Toggle creation of private DNS zone corresponding to the variable name."
  default     = false
}

variable enable_privatelink_api_azureml_ms_pdnsz {
  type        = bool
  description = "Toggle creation of private DNS zone corresponding to the variable name."
  default     = false
}

variable enable_privatelink_notebooks_azure_net_pdnsz {
  type        = bool
  description = "Toggle creation of private DNS zone corresponding to the variable name."
  default     = false
}

variable enable_privatelink_service_signalr_net_pdnsz {
  type        = bool
  description = "Toggle creation of private DNS zone corresponding to the variable name."
  default     = false
}

variable enable_privatelink_monitor_azure_com_pdnsz {
  type        = bool
  description = "Toggle creation of private DNS zone corresponding to the variable name."
  default     = false
}

variable enable_privatelink_oms_opinsights_azure_com_pdnsz {
  type        = bool
  description = "Toggle creation of private DNS zone corresponding to the variable name."
  default     = false
}

variable enable_privatelink_ods_opinsights_azure_com_pdnsz {
  type        = bool
  description = "Toggle creation of private DNS zone corresponding to the variable name."
  default     = false
}

variable enable_privatelink_agentsvc_azure_automation_net_pdnsz {
  type        = bool
  description = "Toggle creation of private DNS zone corresponding to the variable name."
  default     = false
}

variable enable_privatelink_cognitiveservices_azure_com_pdnsz {
  type        = bool
  description = "Toggle creation of private DNS zone corresponding to the variable name."
  default     = false
}

variable enable_privatelink_afs_azure_net_pdnsz {
  type        = bool
  description = "Toggle creation of private DNS zone corresponding to the variable name."
  default     = false
}

variable enable_privatelink_datafactory_azure_net_pdnsz {
  type        = bool
  description = "Toggle creation of private DNS zone corresponding to the variable name."
  default     = false
}

variable enable_privatelink_adf_azure_com_pdnsz {
  type        = bool
  description = "Toggle creation of private DNS zone corresponding to the variable name."
  default     = false
}

variable enable_privatelink_redis_cache_windows_net_pdnsz {
  type        = bool
  description = "Toggle creation of private DNS zone corresponding to the variable name."
  default     = false
}

variable enable_privatelink_redisenterprise_cache_azure_net_pdnsz {
  type        = bool
  description = "Toggle creation of private DNS zone corresponding to the variable name."
  default     = false
}

variable enable_privatelink_purview_azure_com_pdnsz {
  type        = bool
  description = "Toggle creation of private DNS zone corresponding to the variable name."
  default     = false
}

variable enable_privatelink_purviewstudio_azure_com_pdnsz {
  type        = bool
  description = "Toggle creation of private DNS zone corresponding to the variable name."
  default     = false
}

variable enable_privatelink_digitaltwins_azure_net_pdnsz {
  type        = bool
  description = "Toggle creation of private DNS zone corresponding to the variable name."
  default     = false
}

variable enable_privatelink_azurehdinsight_net_pdnsz {
  type        = bool
  description = "Toggle creation of private DNS zone corresponding to the variable name."
  default     = false
}

variable enable_privatelink_his_arc_azure_com_pdnsz {
  type        = bool
  description = "Toggle creation of private DNS zone corresponding to the variable name."
  default     = false
}

variable enable_privatelink_guestconfiguration_azure_com_pdnsz {
  type        = bool
  description = "Toggle creation of private DNS zone corresponding to the variable name."
  default     = false
}

variable enable_privatelink_media_azure_net_pdnsz {
  type        = bool
  description = "Toggle creation of private DNS zone corresponding to the variable name."
  default     = false
}
