resource azurerm_management_group_policy_assignment policy_assignment {
#  for_each = {
#    blob  = "privatelink.blob.core.windows.net"
#    vault = "privatelink.vaultcore.azure.net"
#  }
  for_each = var.private_dns_zone_map

  name                 = "${each.key}-pdnsz"
  display_name         = "???" # can be more than 24 characters
  location             = "eastus"
  policy_definition_id = azurerm_policy_definition.policy["${each.key}"].id
  management_group_id  = data.azurerm_management_group.mg.id
  identity {
    type         = "UserAssigned"
    identity_ids = [ azurerm_user_assigned_identity.policy_assignment_identity.id ] 
  }

  parameters = <<PARAMS
    {
      "privateDnsZoneId": {
        "value": "/subscriptions/${var.pdnsz_subscription_id}/resourcegroups/hub-rg/providers/microsoft.network/privatednszones/${each.value}"
      }
    }
PARAMS
}

#  sqlServer
#  Sql
#  SqlOnDemand
#  Dev
#  Web
#  Blob (blob, blob_secondary)
#  Table (table, table_secondary)
#  Queue (queue, queue_secondary)
#  File (file, file_secondary)
#  Web (web, web_secondary)
#  Data Lake File System Gen2 (dfs, dfs_secondary)
#  Sql
#  MongoDB
#  Cassandra
#  Gremlin
#  Table
#  batchAccount
#  postgresqlServer
#  mysqlServer
#  mariadbServer
#  vault
#  Managed HSMs
#  management
#  searchService
#  registry
#  configurationStores
#  AzureBackup
#  AzureSiteRecovery
#  namespace
#  namespace
#  iotHub
#  namespace
#  topic
#  domain
#  sites
#  amlworkspace
#  signalR
#  azuremonitor
#  account
#  afs
#  dataFactory
#  portal
#  redisCache
#  redisEnterprise
#  Webhook
#  DSCAndHybridWorker
#  blob
#  blob_secondary
#  table
#  table_secondary
#  queue
#  queue_secondary
#  file
#  file_secondary
#  web
#  web_secondary
#  dfs
#  dfs_secondary
#  Sql
#  MongoDB
#  Cassandra
#  Gremlin
#  Table
#  postgresqlServer
#  mysqlServer
#  mariadbServer
#  vault
#  namespace
#  namespace
#  iotHub
#  namespace
#  topic
#  domain
#  sites
#  amlworkspace
#  signalR
#  afs
#  dataFactory
#  portal
#  redisCache