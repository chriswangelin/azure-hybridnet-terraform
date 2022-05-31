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

variable policy_subscription_id {
  type        = string
  description = "Subscription that will own the policies."
  default     = null
}

variable pdnsz_subscription_id {
  type        = string
  description = "Subscription containing the private DNS zones to which the policies will add records." 
  default     = null
}

variable policy_management_group_name {
  type        = string
  description = "Name of management group to which the policies will be assigned."
  default     = null
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

    dine-sqldb-pdns          = [ "sqlServer", "privatelink.database.windows.net" ]
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
    dine-batchacct-eus-pdns  = [ "batchAccount",	"privatelink.eastus.batch.azure.com" ]

    dine-postgres-pdns       = [ "postgresqlServer",	"privatelink.postgres.database.azure.com" ]
    dine-mysql-pdns          = [ "mysqlServer",	"privatelink.mysql.database.azure.com" ]
    dine-mariadb-pdns        = [ "mariadbServer",	"privatelink.mariadb.database.azure.com" ]

    dine-keyvault-vault-pdns = [ "vault", "privatelink.vaultcore.azure.net" ]
    dine-keyvault-mghsm-pdns = [ "managedHSMs", "privatelink.managedhsm.azure.net" ]

    # AKS regions may be added (privatelink.{region}.azmk8s.io)
    # Corresponding conditional forwarders must be added to onprem DNS
    dine-aks-eus-pdns        = [ "management",	"privatelink.eastus.azmk8s.io" ]

    dine-search-pdns         = [ "searchService",	"privatelink.search.windows.net" ]
    dine-containerreg-pdns   = [ "registry","privatelink.azurecr.io" ]
    dine-appconfig-pdns      = [ "configurationStores", "privatelink.azconfig.io" ]
    
    # Azure Backup regions may be added (privatelink.{region}.backup.windowsazure.com)
    # Corresponding conditional forwarders must be added to onprem DNS
    dine-backup-eus-pdns     = [ "AzureBackup",	"privatelink.eastus.backup.windowsazure.com"	]
    dine-sitereco-eus-pdns   = [ "AzureSiteRecovery", "privatelink.siterecovery.windowsazure.com" ]

    dine-eventhub-pdns       = [ "namespace",	"privatelink.servicebus.windows.net" ]
    dine-servicebus-pdns     = [ "namespace",	"privatelink.servicebus.windows.net" ]
    dine-iothub-azdvc-pdns   = [ "iotHub", "privatelink.azure-devices.net" ]
    dine-iothub-svcbus-pdns  = [ "iothub",	"privatelink.servicebus.windows.net" ]
    dine-relay-pdns          = [ "namespace", "privatelink.servicebus.windows.net" ]

    dine-evtgrid-topic-pdns  = [ "topic", "privatelink.eventgrid.azure.net" ]
    dine-evtgrid-domain-pdns = [ "domain", "privatelink.eventgrid.azure.net" ]

    dine-webapps-pdns        = [ "sites", "privatelink.azurewebsites.net" ]
    dine-machlearn-api-pdns  = [ "amlworkspace", "privatelink.api.azureml.ms" ]
    dine-machlearn-note-pdns = [ "amlworkspace", "privatelink.notebooks.azure.net" ]

    dine-signalr-pdns        = [ "signalR", "privatelink.service.signalr.net" ]

    dine-monitor-mon-pdns    = [ "azuremonitor", "privatelink.monitor.azure.com" ]
    dine-monitor-oms-pdns    = [ "azuremonitor", "privatelink.oms.opinsights.azure.com" ]
    dine-monitor-ods-pdns    = [ "azuremonitor", "privatelink.ods.opinsights.azure.com" ]
    dine-monitor-agt-pdns    = [ "azuremonitor", "privatelink.agentsvc.azure-automation.net" ]
    dine-monitor-blob-pdns   = [ "azuremonitor", "privatelink.blob.core.windows.net" ]

    dine-cognitivesvcs-pdns  = [ "account", "privatelink.cognitiveservices.azure.com" ]
    dine-filesync-pdns       = [ "afs", "privatelink.afs.azure.net" ]

    dine-adf-datafact-pdns   = [ "dataFactory", "privatelink.datafactory.azure.net" ]
    dine-adf-portal-pdns     = [ "portal", "privatelink.adf.azure.com" ]

    dine-redis-cache-pdns    = [ "redisCache", "privatelink.redis.cache.windows.net" ]
    dine-redis-enter-pdns    = [ "redisEnterprise", "privatelink.redisenterprise.cache.azure.net" ]

    dine-purview-acct-pdns   = [ "account", "privatelink.purview.azure.com" ]
    dine-purview-portal-pdns = [ "portal", "privatelink.purviewstudio.azure.com" ]

    dine-digitaltwins-pdns   = [ "digitalTwinsInstances", "privatelink.digitaltwins.azure.net" ]
    dine-hdinsight-pdns      = [ "privatelink.azurehdinsight.net", "azurehdinsight.net" ]

    dine-arc-his-pdns        = [ "hybridcompute", "privatelink.his.arc.azure.com" ]
    dine-arc-guest-pdns      = [ "hybridcompute", "privatelink.guestconfiguration.azure.com" ]

    dine-media-keydeliv-pdns = [ "keydelivery", "privatelink.media.azure.net" ]
    dine-media-liveevt-pdns  = [ "liveevent", "privatelink.media.azure.net" ]
    dine-media-stream-pdns   = [ "streamingendpoint", "privatelink.media.azure.net" ]

    # Azure Data Explorer regions may be added (privatelink.{region}.kusto.windows.net)
    # Corresponding conditional forwarders must be added to onprem DNS
    dine-dataexp-eus-pdns    = [ "kusto", "privatelink.eastus.kusto.windows.net" ]
  }
}