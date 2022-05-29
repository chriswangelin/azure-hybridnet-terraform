variable pdnsz_subscription_id {
  type        = string
  description = "Subscription containing the private DNS zones to which the policies will add records." 
}

variable resource_group_name {
  type        = string
  description = "Resource group under which the policy assignment managed user identity will be created."
  default     = "policy-rg"
}

variable location {
  type        = string
  description = "Location of resource group under which the policy assignment managed user identity will be created."
  default     = "eastus"
}

variable policy_management_group_name {
  type        = string
  description = "Management group to which the policies will be assigned."
  default     = "Tenant Root Group"
}

variable policy_assignment_identity_name {
  type        = string
  description = "Managed identity that will execute resource changes triggered by policies."
  default     = "policy-assignment-identity"
}

variable private_dns_zone_map {
  type = map(list(string))
  default = {
    dine-automation-wh-pdns  = [ "WebHook", "privatelink.azure-automation.net" ]
    dine-automation-dsc-pdns = [ "DSCAndHybridWorker",  "privatelink.azure-automation.net" ]

    dine-sqldb-sqlsvr-pdns   = [ "sqlServer", "privatelink.database.windows.net" ]
    dine-synapse-sql-pdns    = [ "Sql", "privatelink.sql.azuresynapse.net" ]
    dine-synapse-sqlod-pdns  = [ "SqlOnDemand", "privatelink.sql.azuresynapse.net" ]
    dine-synapse-dev-pdns    = [ "Dev", "privatelink.dev.azuresynapse.net" ]
    dine-synapse-web-pdns    = [ "Web", "privatelink.azuresynapse.net" ]

    dine-storoge-blob-pdns   = [ "blob", "privatelink.blob.core.windows.net" ]
    dine-storage-blobs-pdns  = [ "blob_secondary", "privatelink.blob.core.windows.net" ]
    dine-storage-table-pdns  = [ "table", "privatelink.table.core.windows.net" ]
    dine-storage-tables-pdns = [ "table_secondary", "privatelink.table.core.windows.net" ]
    dine-storage-queue-pdns  = [ "queue", "privatelink.queue.core.windows.net" ]
    dine-storage-queues-pdns = [ "queue_secondary", "privatelink.queue.core.windows.net" ]
    dine-storage-file-pdns   = [ "file", "privatelink.file.core.windows.net" ]
    dine-storage-files-pdns  = [ "file_secondary", "privatelink.file.core.windows.net" ]
    dine-storage-web-pdns    = [ "web", "privatelink.web.core.windows.net" ]
    dine-storage-webs-pdns   = [ "web_secondary", "privatelink.web.core.windows.net" ]
    dine-storage-dfs-pdns    = [ "dfs", "privatelink.dfs.core.windows.net" ]
    dine-storage-dfss-pdns   = [ "dfs_secondary", "privatelink.dfs.core.windows.net" ]

    dine-cosmos-sql-pdns     = [ "Sql", "privatelink.documents.azure.com" ]
    dine-cosmos-mongodb-pdns = [ "MongoDB", "privatelink.mongo.cosmos.azure.com" ]
    dine-cosmos-cassand-pdns = [ "Cassandra",	"privatelink.cassandra.cosmos.azure.com" ]
    dine-cosmos-gremlin-pdns = [ "Gremlin", "privatelink.gremlin.cosmos.azure.com" ]
    dine-cosmos-table-pdns   = [ "Table",	"privatelink.table.cosmos.azure.com" ]

    # Batch regions may be added (privatelink.{region}.batch.azure.com).  
    # Corresponding conditional forwarders must be added to onprem DNS
    dine-batch-acct-eus-pdns = [ "batchAccount",	"privatelink.eastus.batch.azure.com" ]

    dine-postgres-pgsvr-pdns = [ "postgresqlServer",	"privatelink.postgres.database.azure.com" ]
    dine-mysql-mysqlsvr-pdns = [ "mysqlServer",	"privatelink.mysql.database.azure.com" ]
    dine-mariadb-mdbsvr-pdns = [ "mariadbServer",	"privatelink.mariadb.database.azure.com" ]

    dine-keyvault-vault-pdns = [ "vault", "privatelink.vaultcore.azure.net" ]
    dine-keyvault-mghsm-pdns = [ "managedHSMs", "privatelink.managedhsm.azure.net" ]

    # AKS regions may be added (privatelink.{region}.azmk8s.io)
    # Corresponding conditional forwarders must be added to onprem DNS
    dine-aks-mgmt-eus-pdns   = [ "management",	"privatelink.eastus.azmk8s.io" ]

    dine-search-srchsvc-pdns = [ "searchService",	"privatelink.search.windows.net" ]
    dine-contreg-reg-pdns    = [ "registry","privatelink.azurecr.io" ]
    dine-appcfg-stores-pdns  = [ "configurationStores", "privatelink.azconfig.io" ]
    
    # Azure Backup regions may be added (privatelink.{region}.backup.windowsazure.com)
    # Corresponding conditional forwarders must be added to onprem DNS
    dine-azbkp-bkp-eus-pdns  = [ "AzureBackup",	"privatelink.eastus.backup.windowsazure.com"	]

    dine-monitor-mon-pdns    = [ "azuremonitor", "privatelink.monitor.azure.com" ]
    dine-monitor-oms-pdns    = [ "azuremonitor", "privatelink.oms.opinsights.azure.com" ]
    dine-monitor-ods-pdns    = [ "azuremonitor", "privatelink.ods.opinsights.azure.com" ]
    dine-monitor-agt-pdns    = [ "azuremonitor", "privatelink.agentsvc.azure-automation.net" ]
    dine-monitor-blob-pdns   = [ "azuremonitor", "privatelink.blob.core.windows.net" ]
  }
}

# Azure Site Recovery (Microsoft.RecoveryServices/vaults) / AzureSiteRecovery	privatelink.siterecovery.windowsazure.com	{region}.hypervrecoverymanager.windowsazure.com
# Azure Event Hubs (Microsoft.EventHub/namespaces) / namespace	privatelink.servicebus.windows.net	servicebus.windows.net
# Azure Service Bus (Microsoft.ServiceBus/namespaces) / namespace	privatelink.servicebus.windows.net	servicebus.windows.net
# Azure IoT Hub (Microsoft.Devices/IotHubs) / iotHub	privatelink.azure-devices.net
# privatelink.servicebus.windows.net1	azure-devices.net
# servicebus.windows.net
# Azure Relay (Microsoft.Relay/namespaces) / namespace	privatelink.servicebus.windows.net	servicebus.windows.net
# Azure Event Grid (Microsoft.EventGrid/topics) / topic	privatelink.eventgrid.azure.net	eventgrid.azure.net
# Azure Event Grid (Microsoft.EventGrid/domains) / domain	privatelink.eventgrid.azure.net	eventgrid.azure.net
# Azure Web Apps (Microsoft.Web/sites) / sites	privatelink.azurewebsites.net	azurewebsites.net
# Azure Machine Learning (Microsoft.MachineLearningServices/workspaces) / amlworkspace	privatelink.api.azureml.ms
# privatelink.notebooks.azure.net	api.azureml.ms
# notebooks.azure.net
# instances.azureml.ms
# aznbcontent.net
# SignalR (Microsoft.SignalRService/SignalR) / signalR	privatelink.service.signalr.net	service.signalr.net


# Cognitive Services (Microsoft.CognitiveServices/accounts) / account	privatelink.cognitiveservices.azure.com	cognitiveservices.azure.com
# Azure File Sync (Microsoft.StorageSync/storageSyncServices) / afs	privatelink.afs.azure.net	afs.azure.net