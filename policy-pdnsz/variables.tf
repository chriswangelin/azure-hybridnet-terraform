variable policy_management_group_name {
  type        = string
  description = "Management group to which the policies will be assigned."
  default     = "Tenant Root Group"
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

variable pdnsz_subscription_id {
  type        = string
  description = "Subscription containing the private DNS zones to which the policies will add records." 
}

variable private_dns_zone_map {
  type = map(string)
  default = {
    WebHook            = "privatelink.azure-automation.net"
    DSCAndHybridWorker = "privatelink.azure-automation.net"

    sqlServer          = "privatelink.database.windows.net"
    Sql                = "privatelink.sql.azuresynapse.net"
    SqlOnDemand        = "privatelink.sql.azuresynapse.net"
    Dev                = "privatelink.dev.azuresynapse.net"
    Web                = "privatelink.azuresynapse.net"

    blob               = "privatelink.blob.core.windows.net"
    blob_secondary     = "privatelink.blob.core.windows.net"
    table              = "privatelink.table.core.windows.net"
    table_secondary    = "privatelink.table.core.windows.net"
    queue              = "privatelink.queue.core.windows.net"
    queue_secondary    = "privatelink.queue.core.windows.net"
    file               = "privatelink.file.core.windows.net"
    file_secondary     = "privatelink.file.core.windows.net"
    web                = "privatelink.web.core.windows.net"
    web_secondary      = "privatelink.web.core.windows.net"
    dfs                = "privatelink.dfs.core.windows.net"
    dfs_secondary      = "privatelink.dfs.core.windows.net"

    vault              = "privatelink.vaultcore.azure.net"
  }
}

Azure Cosmos DB (Microsoft.AzureCosmosDB/databaseAccounts) / Sql	privatelink.documents.azure.com	documents.azure.com
Azure Cosmos DB (Microsoft.AzureCosmosDB/databaseAccounts) / MongoDB	privatelink.mongo.cosmos.azure.com	mongo.cosmos.azure.com
Azure Cosmos DB (Microsoft.AzureCosmosDB/databaseAccounts) / Cassandra	privatelink.cassandra.cosmos.azure.com	cassandra.cosmos.azure.com
Azure Cosmos DB (Microsoft.AzureCosmosDB/databaseAccounts) / Gremlin	privatelink.gremlin.cosmos.azure.com	gremlin.cosmos.azure.com
Azure Cosmos DB (Microsoft.AzureCosmosDB/databaseAccounts) / Table	privatelink.table.cosmos.azure.com	table.cosmos.azure.com
Azure Batch (Microsoft.Batch/batchAccounts) / batchAccount	privatelink.{region}.batch.azure.com	{region}.batch.azure.com
Azure Database for PostgreSQL - Single server (Microsoft.DBforPostgreSQL/servers) / postgresqlServer	privatelink.postgres.database.azure.com	postgres.database.azure.com
Azure Database for MySQL (Microsoft.DBforMySQL/servers) / mysqlServer	privatelink.mysql.database.azure.com	mysql.database.azure.com
Azure Database for MariaDB (Microsoft.DBforMariaDB/servers) / mariadbServer	privatelink.mariadb.database.azure.com	mariadb.database.azure.com