#######################################################################################################################
# custom domain - all virtual machines in the hub and spokes are registered under this domain
#######################################################################################################################
resource "azurerm_private_dns_zone" "custom_domain_pdnsz" {
  name                = var.custom_domain_name
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "vmreg_pdnsz_link" {
  name                  = local.vmreg_pdnsz_link_name
  resource_group_name   = azurerm_resource_group.rg.name
  private_dns_zone_name = azurerm_private_dns_zone.custom_domain_pdnsz.name
  virtual_network_id    = azurerm_virtual_network.vnet.id
  registration_enabled  = true
}

#######################################################################################################################
# privatelink.azure-automation.net
#######################################################################################################################
resource "azurerm_private_dns_zone" "privatelink_azure_automation_net_pdnsz" {
  count               = var.enable_privatelink_azure_automation_net_pdnsz ? 1 : 0
  name                = "privatelink.azure-automation.net"
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_azure_automation_net_pdnsz_link" {
  count                 = var.enable_privatelink_azure_automation_net_pdnsz ? 1 : 0
  name                  = "privatelink-azure-automation-net-pdnsz-link"
  resource_group_name   = azurerm_resource_group.rg.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_azure_automation_net_pdnsz[0].name
  virtual_network_id    = azurerm_virtual_network.vnet.id
}

#######################################################################################################################
# privatelink.database.windows.net
#######################################################################################################################
resource "azurerm_private_dns_zone" "privatelink_database_windows_net_pdnsz" {
  count               = var.enable_privatelink_database_windows_net_pdnsz ? 1 : 0
  name                = "privatelink.database.windows.net"
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_database_windows_net_pdnsz_link" {
  count               = var.enable_privatelink_database_windows_net_pdnsz ? 1 : 0
  name                  = "privatelink-database-windows-net-pdnsz-link"
  resource_group_name   = azurerm_resource_group.rg.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_database_windows_net_pdnsz[0].name
  virtual_network_id    = azurerm_virtual_network.vnet.id
}

#######################################################################################################################
# privatelink.sql.azuresynapse.net
#######################################################################################################################
resource "azurerm_private_dns_zone" "privatelink_sql_azuresynapse_net_pdnsz" {
  count               = var.enable_privatelink_sql_azuresynapse_net_pdnsz ? 1 : 0
  name                = "privatelink.sql.azuresynapse.net"
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_sql_azuresynapse_net_pdnsz_link" {
  count               = var.enable_privatelink_sql_azuresynapse_net_pdnsz ? 1 : 0
  name                  = "privatelink-sql-azuresynapse-net-pdnsz-link"
  resource_group_name   = azurerm_resource_group.rg.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_sql_azuresynapse_net_pdnsz[0].name
  virtual_network_id    = azurerm_virtual_network.vnet.id
}

#######################################################################################################################
# privatelink.sqlondemand.azuresynapse.net
#######################################################################################################################
resource "azurerm_private_dns_zone" "privatelink_sqlondemand_azuresynapse_net_pdnsz" {
  count               = var.enable_privatelink_sqlondemand_azuresynapse_net_pdnsz ? 1 : 0
  name                = "privatelink.sqlondemand.azuresynapse.net"
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_sqlondemand_azuresynapse_net_pdnsz_link" {
  count                 = var.enable_privatelink_sqlondemand_azuresynapse_net_pdnsz ? 1 : 0
  name                  = "privatelink-sqlondemand-azuresynapse-net-pdnsz-link"
  resource_group_name   = azurerm_resource_group.rg.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_sqlondemand_azuresynapse_net_pdnsz[0].name
  virtual_network_id    = azurerm_virtual_network.vnet.id
}

#######################################################################################################################
# privatelink.dev.azuresynapse.net
#######################################################################################################################
resource "azurerm_private_dns_zone" "privatelink_dev_azuresynapse_net_pdnsz" {
  count               = var.enable_privatelink_dev_azuresynapse_net_pdnsz ? 1 : 0
  name                = "privatelink.dev.azuresynapse.net"
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_dev_azuresynapse_net_pdnsz_link" {
  count                 = var.enable_privatelink_dev_azuresynapse_net_pdnsz ? 1 : 0
  name                  = "privatelink-dev-azuresynapse-net-pdnsz-link"
  resource_group_name   = azurerm_resource_group.rg.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_dev_azuresynapse_net_pdnsz[0].name
  virtual_network_id    = azurerm_virtual_network.vnet.id
}

#######################################################################################################################
# privatelink.azuresynapse.net
#######################################################################################################################
resource "azurerm_private_dns_zone" "privatelink_azuresynapse_net_pdnsz" {
  count               = var.enable_privatelink_azuresynapse_net_pdnsz ? 1 : 0
  name                = "privatelink.azuresynapse.net"
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_azuresynapse_net_pdnsz_link" {
  count                 = var.enable_privatelink_azuresynapse_net_pdnsz ? 1 : 0
  name                  = "privatelink-azuresynapse-net-pdnsz-link"
  resource_group_name   = azurerm_resource_group.rg.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_azuresynapse_net_pdnsz[0].name
  virtual_network_id    = azurerm_virtual_network.vnet.id
}

#######################################################################################################################
# privatelink.blob.core.windows.net
#######################################################################################################################
resource "azurerm_private_dns_zone" "privatelink_blob_core_windows_net_pdnsz" {
  count               = var.enable_privatelink_blob_core_windows_net_pdnsz ? 1 : 0
  name                = "privatelink.blob.core.windows.net"
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_blob_core_windows_net_pdnsz_link" {
  count                 = var.enable_privatelink_blob_core_windows_net_pdnsz ? 1 : 0
  name                  = "privatelink-blob-core-windows-net-pdnsz-link"
  resource_group_name   = azurerm_resource_group.rg.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_blob_core_windows_net_pdnsz[0].name
  virtual_network_id    = azurerm_virtual_network.vnet.id
}

#######################################################################################################################
# privatelink.table.core.windows.net
#######################################################################################################################
resource "azurerm_private_dns_zone" "privatelink_table_core_windows_net_pdnsz" {
  count               = var.enable_privatelink_table_core_windows_net_pdnsz ? 1 : 0
  name                = "privatelink.table.core.windows.net"
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_table_core_windows_net_pdnsz_link" {
  count                 = var.enable_privatelink_table_core_windows_net_pdnsz ? 1 : 0
  name                  = "privatelink-table-core-windows-net-pdnsz-link"
  resource_group_name   = azurerm_resource_group.rg.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_table_core_windows_net_pdnsz[0].name
  virtual_network_id    = azurerm_virtual_network.vnet.id
}

#######################################################################################################################
# privatelink.queue.core.windows.net
#######################################################################################################################
resource "azurerm_private_dns_zone" "privatelink_queue_core_windows_net_pdnsz" {
  count               = var.enable_privatelink_queue_core_windows_net_pdnsz ? 1 : 0
  name                = "privatelink.queue.core.windows.net"
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_queue_core_windows_net_pdnsz_link" {
  count                 = var.enable_privatelink_queue_core_windows_net_pdnsz ? 1 : 0
  name                  = "privatelink-queue-core-windows-net-pdnsz-link"
  resource_group_name   = azurerm_resource_group.rg.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_queue_core_windows_net_pdnsz[0].name
  virtual_network_id    = azurerm_virtual_network.vnet.id
}

#######################################################################################################################
# privatelink.file.core.windows.net
#######################################################################################################################
resource "azurerm_private_dns_zone" "privatelink_file_core_windows_net_pdnsz" {
  count               = var.enable_privatelink_file_core_windows_net_pdnsz ? 1 : 0
  name                = "privatelink.file.core.windows.net"
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_file_core_windows_net_pdnsz_link" {
  count                 = var.enable_privatelink_file_core_windows_net_pdnsz ? 1 : 0
  name                  = "privatelink-file-core-windows-net-pdnsz-link"
  resource_group_name   = azurerm_resource_group.rg.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_file_core_windows_net_pdnsz[0].name
  virtual_network_id    = azurerm_virtual_network.vnet.id
}

#######################################################################################################################
# privatelink.web.core.windows.net
#######################################################################################################################
resource "azurerm_private_dns_zone" "privatelink_web_core_windows_net_pdnsz" {
  count               = var.enable_privatelink_web_core_windows_net_pdnsz ? 1 : 0
  name                = "privatelink.web.core.windows.net"
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_web_core_windows_net_pdnsz_link" {
  count                 = var.enable_privatelink_web_core_windows_net_pdnsz ? 1 : 0
  name                  = "privatelink-web-core-windows-net-pdnsz-link"
  resource_group_name   = azurerm_resource_group.rg.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_web_core_windows_net_pdnsz[0].name
  virtual_network_id    = azurerm_virtual_network.vnet.id
}

#######################################################################################################################
# privatelink.dfs.core.windows.net
#######################################################################################################################
resource "azurerm_private_dns_zone" "privatelink_dfs_core_windows_net_pdnsz" {
  count               = var.enable_privatelink_dfs_core_windows_net_pdnsz ? 1 : 0
  name                = "privatelink.dfs.core.windows.net"
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_dfs_core_windows_net_pdnsz_link" {
  count                 = var.enable_privatelink_dfs_core_windows_net_pdnsz ? 1 : 0
  name                  = "privatelink-dfs-core-windows-net-pdnsz-link"
  resource_group_name   = azurerm_resource_group.rg.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_dfs_core_windows_net_pdnsz[0].name
  virtual_network_id    = azurerm_virtual_network.vnet.id
}

#######################################################################################################################
# privatelink.documents.azure.com
#######################################################################################################################
resource "azurerm_private_dns_zone" "privatelink_documents_azure_com_pdnsz" {
  count               = var.enable_privatelink_documents_azure_com_pdnsz ? 1 : 0
  name                = "privatelink.documents.azure.com"
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_documents_azure_com_pdnsz_link" {
  count               = var.enable_privatelink_documents_azure_com_pdnsz ? 1 : 0
  name                  = "privatelink-documents-azure-com-pdnsz-link"
  resource_group_name   = azurerm_resource_group.rg.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_documents_azure_com_pdnsz[0].name
  virtual_network_id    = azurerm_virtual_network.vnet.id
}

#######################################################################################################################
# privatelink.mongo.cosmos.azure.com
#######################################################################################################################
resource "azurerm_private_dns_zone" "privatelink_mongo_cosmos_azure_com_pdnsz" {
  count               = var.enable_privatelink_mongo_cosmos_azure_com_pdnsz ? 1 : 0
  name                = "privatelink.mongo.cosmos.azure.com"
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_mongo_cosmos_azure_com_pdnsz_link" {
  count               = var.enable_privatelink_mongo_cosmos_azure_com_pdnsz ? 1 : 0
  name                  = "privatelink-mongo-cosmos-azure-com-pdnsz-link"
  resource_group_name   = azurerm_resource_group.rg.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_mongo_cosmos_azure_com_pdnsz[0].name
  virtual_network_id    = azurerm_virtual_network.vnet.id
}

#######################################################################################################################
# privatelink.cassandra.cosmos.azure.com
#######################################################################################################################
resource "azurerm_private_dns_zone" "privatelink_cassandra_cosmos_azure_com_pdnsz" {
  count               = var.enable_privatelink_cassandra_cosmos_azure_com_pdnsz ? 1 : 0
  name                = "privatelink.cassandra.cosmos.azure.com"
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_cassandra_cosmos_azure_com_pdnsz_link" {
  count                 = var.enable_privatelink_cassandra_cosmos_azure_com_pdnsz ? 1 : 0
  name                  = "privatelink-cassandra-cosmos-azure-com-pdnsz-link"
  resource_group_name   = azurerm_resource_group.rg.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_cassandra_cosmos_azure_com_pdnsz[0].name
  virtual_network_id    = azurerm_virtual_network.vnet.id
}

#######################################################################################################################
# privatelink.gremlin.cosmos.azure.com
#######################################################################################################################
resource "azurerm_private_dns_zone" "privatelink_gremlin_cosmos_azure_com_pdnsz" {
  count               = var.enable_privatelink_gremlin_cosmos_azure_com_pdnsz ? 1 : 0
  name                = "privatelink.gremlin.cosmos.azure.com"
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_gremlin_cosmos_azure_com_pdnsz_link" {
  count                 = var.enable_privatelink_gremlin_cosmos_azure_com_pdnsz ? 1 : 0
  name                  = "privatelink-gremlin-cosmos-azure-com-pdnsz-link"
  resource_group_name   = azurerm_resource_group.rg.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_gremlin_cosmos_azure_com_pdnsz[0].name
  virtual_network_id    = azurerm_virtual_network.vnet.id
}

#######################################################################################################################
# privatelink.table.cosmos.azure.com
#######################################################################################################################
resource "azurerm_private_dns_zone" "privatelink_table_cosmos_azure_com_pdnsz" {
  count               = var.enable_privatelink_table_cosmos_azure_com_pdnsz ? 1 : 0
  name                = "privatelink.table.cosmos.azure.com"
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_table_cosmos_azure_com_pdnsz_link" {
  count                 = var.enable_privatelink_table_cosmos_azure_com_pdnsz ? 1 : 0
  name                  = "privatelink-table-cosmos-azure-com-pdnsz-link"
  resource_group_name   = azurerm_resource_group.rg.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_table_cosmos_azure_com_pdnsz[0].name
  virtual_network_id    = azurerm_virtual_network.vnet.id
}

#######################################################################################################################
# privatelink.centralus.batch.azure.com
#######################################################################################################################
resource "azurerm_private_dns_zone" "privatelink_centralus_batch_azure_com_pdnsz" {
  count               = var.enable_privatelink_centralus_batch_azure_com_pdnsz ? 1 : 0
  name                = "privatelink.centralus.batch.azure.com"
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_centralus_batch_azure_com_pdnsz_link" {
  count                 = var.enable_privatelink_centralus_batch_azure_com_pdnsz ? 1 : 0
  name                  = "privatelink-centralus-batch-azure-com-pdnsz-link"
  resource_group_name   = azurerm_resource_group.rg.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_centralus_batch_azure_com_pdnsz[0].name
  virtual_network_id    = azurerm_virtual_network.vnet.id
}

#######################################################################################################################
# privatelink.eastus.batch.azure.com
#######################################################################################################################
resource "azurerm_private_dns_zone" "privatelink_eastus_batch_azure_com_pdnsz" {
  count               = var.enable_privatelink_eastus_batch_azure_com_pdnsz ? 1 : 0
  name                = "privatelink.eastus.batch.azure.com"
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_eastus_batch_azure_com_pdnsz_link" {
  count               = var.enable_privatelink_eastus_batch_azure_com_pdnsz ? 1 : 0
  name                  = "privatelink-eastus-batch-azure-com-pdnsz-link"
  resource_group_name   = azurerm_resource_group.rg.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_eastus_batch_azure_com_pdnsz[0].name
  virtual_network_id    = azurerm_virtual_network.vnet.id
}

#######################################################################################################################
# privatelink.westus.batch.azure.com
#######################################################################################################################
resource "azurerm_private_dns_zone" "privatelink_westus_batch_azure_com_pdnsz" {
  count               = var.enable_privatelink_westus_batch_azure_com_pdnsz ? 1 : 0
  name                = "privatelink.westus.batch.azure.com"
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_westus_batch_azure_com_pdnsz_link" {
  count                 = var.enable_privatelink_westus_batch_azure_com_pdnsz ? 1 : 0
  name                  = "privatelink-westus-batch-azure-com-pdnsz-link"
  resource_group_name   = azurerm_resource_group.rg.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_westus_batch_azure_com_pdnsz[0].name
  virtual_network_id    = azurerm_virtual_network.vnet.id
}

#######################################################################################################################
# privatelink.postgres.database.azure.com
#######################################################################################################################
resource "azurerm_private_dns_zone" "privatelink_postgres_database_azure_com_pdnsz" {
  count               = var.enable_privatelink_postgres_database_azure_com_pdnsz ? 1 : 0
  name                = "privatelink.postgres.database.azure.com"
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_postgres_database_azure_com_pdnsz_link" {
  count                 = var.enable_privatelink_postgres_database_azure_com_pdnsz ? 1 : 0
  name                  = "privatelink-postgres-database-azure-com-pdnsz-link"
  resource_group_name   = azurerm_resource_group.rg.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_postgres_database_azure_com_pdnsz[0].name
  virtual_network_id    = azurerm_virtual_network.vnet.id
}

#######################################################################################################################
# privatelink.mysql.database.azure.com
#######################################################################################################################
resource "azurerm_private_dns_zone" "privatelink_mysql_database_azure_com_pdnsz" {
  count               = var.enable_privatelink_mysql_database_azure_com_pdnsz ? 1 : 0
  name                = "privatelink.mysql.database.azure.com"
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_mysql_database_azure_com_pdnsz_link" {
  count                 = var.enable_privatelink_mysql_database_azure_com_pdnsz ? 1 : 0
  name                  = "privatelink-mysql-database-azure-com-pdnsz-link"
  resource_group_name   = azurerm_resource_group.rg.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_mysql_database_azure_com_pdnsz[0].name
  virtual_network_id    = azurerm_virtual_network.vnet.id
}

#######################################################################################################################
# privatelink.mariadb.database.azure.com
#######################################################################################################################
resource "azurerm_private_dns_zone" "privatelink_mariadb_database_azure_com_pdnsz" {
  count               = var.enable_privatelink_mariadb_database_azure_com_pdnsz ? 1 : 0
  name                = "privatelink.mariadb.database.azure.com"
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_mariadb_database_azure_com_pdnsz_link" {
  count                 = var.enable_privatelink_mariadb_database_azure_com_pdnsz ? 1 : 0
  name                  = "privatelink-mariadb-database-azure-com-pdnsz-link"
  resource_group_name   = azurerm_resource_group.rg.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_mariadb_database_azure_com_pdnsz[0].name
  virtual_network_id    = azurerm_virtual_network.vnet.id
}

#######################################################################################################################
# privatelink.vaultcore.azure.net
#######################################################################################################################
resource "azurerm_private_dns_zone" "privatelink_vaultcore_azure_net_pdnsz" {
  count               = var.enable_privatelink_vaultcore_azure_net_pdnsz ? 1 : 0
  name                = "privatelink.vaultcore.azure.net"
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_vaultcore_azure_net_pdnsz_link" {
  count                 = var.enable_privatelink_vaultcore_azure_net_pdnsz ? 1 : 0
  name                  = "privatelink-vaultcore-azure-net-pdnsz-link"
  resource_group_name   = azurerm_resource_group.rg.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_vaultcore_azure_net_pdnsz[0].name
  virtual_network_id    = azurerm_virtual_network.vnet.id
}

#######################################################################################################################
# privatelink.managedhsm.azure.net
#######################################################################################################################
resource "azurerm_private_dns_zone" "privatelink_managedhsm_azure_net_pdnsz" {
  count               = var.enable_privatelink_managedhsm_azure_net_pdnsz ? 1 : 0
  name                = "privatelink.managedhsm.azure.net"
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_managedhsm_azure_net_pdnsz_link" {
  count                 = var.enable_privatelink_managedhsm_azure_net_pdnsz ? 1 : 0
  name                  = "privatelink-managedhsm-azure-net-pdnsz-link"
  resource_group_name   = azurerm_resource_group.rg.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_managedhsm_azure_net_pdnsz[0].name
  virtual_network_id    = azurerm_virtual_network.vnet.id
}

#######################################################################################################################
# privatelink.eastus.azmk8s.io
#######################################################################################################################
resource "azurerm_private_dns_zone" "privatelink_eastus_azmk8s_io_pdnsz" {
  count               = var.enable_privatelink_eastus_azmk8s_io_pdnsz ? 1 : 0
  name                = "privatelink.eastus.azmk8s.io"
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_eastus_azmk8s_io_pdnsz_link" {
  count                 = var.enable_privatelink_eastus_azmk8s_io_pdnsz ? 1 : 0
  name                  = "privatelink-eastus-azmk8s-io-pdnsz-link"
  resource_group_name   = azurerm_resource_group.rg.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_eastus_azmk8s_io_pdnsz[0].name
  virtual_network_id    = azurerm_virtual_network.vnet.id
}

#######################################################################################################################
# privatelink.search.windows.net
#######################################################################################################################
resource "azurerm_private_dns_zone" "privatelink_search_windows_net_pdnsz" { 
  count               = var.enable_privatelink_search_windows_net_pdnsz ? 1 : 0
  name                = "privatelink.search.windows.net"
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_search_windows_net_pdnsz_link" { 
  count                 = var.enable_privatelink_search_windows_net_pdnsz ? 1 : 0
  name                  = "privatelink-search-windows-net-pdnsz-link"
  resource_group_name   = azurerm_resource_group.rg.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_search_windows_net_pdnsz[0].name
  virtual_network_id    = azurerm_virtual_network.vnet.id
}

#######################################################################################################################
# privatelink.azurecr.io
#######################################################################################################################
resource "azurerm_private_dns_zone" "privatelink_azurecr_io_pdnsz" {
  count               = var.enable_privatelink_azurecr_io_pdnsz ? 1 : 0
  name                = "privatelink.azurecr.io"
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_azurecr_io_pdnsz_link" {
  count                 = var.enable_privatelink_azurecr_io_pdnsz ? 1 : 0
  name                  = "privatelink-azurecr-io-pdnsz-link"
  resource_group_name   = azurerm_resource_group.rg.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_azurecr_io_pdnsz[0].name
  virtual_network_id    = azurerm_virtual_network.vnet.id
}

#######################################################################################################################
# privatelink.azconfig.io
#######################################################################################################################
resource "azurerm_private_dns_zone" "privatelink_azconfig_io_pdnsz" {
  count               = var.enable_privatelink_azconfig_io_pdnsz ? 1 : 0
  name                = "privatelink.azconfig.io"
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_azconfig_io_pdnsz_link" {
  count                 = var.enable_privatelink_azconfig_io_pdnsz ? 1 : 0
  name                  = "privatelink-azconfig-io-pdnsz-link"
  resource_group_name   = azurerm_resource_group.rg.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_azconfig_io_pdnsz[0].name
  virtual_network_id    = azurerm_virtual_network.vnet.id
}

#######################################################################################################################
# privatelink.centralus.backup.windowsazure.com
#######################################################################################################################
resource "azurerm_private_dns_zone" "privatelink_centralus_backup_windowsazure_com_pdnsz" {
  count               = var.enable_privatelink_centralus_backup_windowsazure_com_pdnsz ? 1 : 0
  name                = "privatelink.centralus.backup.windowsazure.com"
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_centralus_backup_windowsazure_com_pdnsz_link" {
  count                 = var.enable_privatelink_centralus_backup_windowsazure_com_pdnsz ? 1 : 0
  name                  = "privatelink-centralus-backup-windowsazure-com-pdnsz-link"
  resource_group_name   = azurerm_resource_group.rg.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_centralus_backup_windowsazure_com_pdnsz[0].name
  virtual_network_id    = azurerm_virtual_network.vnet.id
}

#######################################################################################################################
# privatelink.eastus.backup.windowsazure.com
#######################################################################################################################
resource "azurerm_private_dns_zone" "privatelink_eastus_backup_windowsazure_com_pdnsz" {
  count               = var.enable_privatelink_eastus_backup_windowsazure_com_pdnsz ? 1 : 0
  name                = "privatelink.eastus.backup.windowsazure.com"
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_eastus_backup_windowsazure_com_pdnsz_link" {
  count                 = var.enable_privatelink_eastus_backup_windowsazure_com_pdnsz ? 1 : 0
  name                  = "privatelink-eastus-backup-windowsazure-com-pdnsz-link"
  resource_group_name   = azurerm_resource_group.rg.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_eastus_backup_windowsazure_com_pdnsz[0].name
  virtual_network_id    = azurerm_virtual_network.vnet.id
}

#######################################################################################################################
# privatelink.hypervrecoverymanager.windowsazure.com
#######################################################################################################################
resource "azurerm_private_dns_zone" "privatelink_hypervrecoverymanager_windowsazure_com_pdnsz" {
  count               = var.enable_privatelink_hypervrecoverymanager_windowsazure_com_pdnsz ? 1 : 0
  name                = "privatelink.hypervrecoverymanager.windowsazure.com"
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_hypervrecoverymanager_windowsazure_com_pdnsz_link" {
  count                 = var.enable_privatelink_hypervrecoverymanager_windowsazure_com_pdnsz ? 1 : 0
  name                  = "privatelink-hypervrecoverymanager-windowsazure-com-pdnsz-link"
  resource_group_name   = azurerm_resource_group.rg.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_hypervrecoverymanager_windowsazure_com_pdnsz[0].name
  virtual_network_id    = azurerm_virtual_network.vnet.id
}

#######################################################################################################################
# privatelink.siterecovery.windowsazure.com
#######################################################################################################################
resource "azurerm_private_dns_zone" "privatelink_siterecovery_windowsazure_com_pdnsz" {
  count               = var.enable_privatelink_siterecovery_windowsazure_com_pdnsz ? 1 : 0
  name                = "privatelink.siterecovery.windowsazure.com"
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_siterecovery_windowsazure_com_pdnsz_link" {
  count                 = var.enable_privatelink_siterecovery_windowsazure_com_pdnsz ? 1 : 0
  name                  = "privatelink-siterecovery-windowsazure-com-pdnsz-link"
  resource_group_name   = azurerm_resource_group.rg.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_siterecovery_windowsazure_com_pdnsz[0].name
  virtual_network_id    = azurerm_virtual_network.vnet.id
}

#######################################################################################################################
# privatelink.azure-devices.net
#######################################################################################################################
resource "azurerm_private_dns_zone" "privatelink_azure_devices_net_pdnsz" {
  count               = var.enable_privatelink_azure_devices_net_pdnsz ? 1 : 0
  name                = "privatelink.azure-devices.net"
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_azure_devices_net_pdnsz_link" {
  count                 = var.enable_privatelink_azure_devices_net_pdnsz ? 1 : 0
  name                  = "privatelink-azure-devices-net-pdnsz-link"
  resource_group_name   = azurerm_resource_group.rg.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_azure_devices_net_pdnsz[0].name
  virtual_network_id    = azurerm_virtual_network.vnet.id
}

#######################################################################################################################
# privatelink.servicebus.windows.net
#######################################################################################################################
resource "azurerm_private_dns_zone" "privatelink_servicebus_windows_net_pdnsz" {
  count               = var.enable_privatelink_servicebus_windows_net_pdnsz ? 1 : 0
  name                = "privatelink.servicebus.windows.net"
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_servicebus_windows_net_pdnsz_link" {
  count                 = var.enable_privatelink_servicebus_windows_net_pdnsz ? 1 : 0
  name                  = "privatelink-servicebus-windows-net-pdnsz-link"
  resource_group_name   = azurerm_resource_group.rg.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_servicebus_windows_net_pdnsz[0].name
  virtual_network_id    = azurerm_virtual_network.vnet.id
}

#######################################################################################################################
# privatelink.eventgrid.azure.net
#######################################################################################################################
resource "azurerm_private_dns_zone" "privatelink_eventgrid_azure_net_pdnsz" {
  count               = var.enable_privatelink_eventgrid_azure_net_pdnsz ? 1 : 0
  name                = "privatelink.eventgrid.azure.net"
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_eventgrid_azure_net_pdnsz_link" {
  count                 = var.enable_privatelink_eventgrid_azure_net_pdnsz ? 1 : 0
  name                  = "privatelink-eventgrid-azure-net-pdnsz-link"
  resource_group_name   = azurerm_resource_group.rg.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_eventgrid_azure_net_pdnsz[0].name
  virtual_network_id    = azurerm_virtual_network.vnet.id
}

#######################################################################################################################
# privatelink.azurewebsites.net
#######################################################################################################################
resource "azurerm_private_dns_zone" "privatelink_azurewebsites_net_pdnsz" {
  count               = var.enable_privatelink_azurewebsites_net_pdnsz ? 1 : 0
  name                = "privatelink.azurewebsites.net"
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_azurewebsites_net_pdnsz_link" {
  count                 = var.enable_privatelink_azurewebsites_net_pdnsz ? 1 : 0
  name                  = "privatelink-azurewebsites-net-pdnsz-link"
  resource_group_name   = azurerm_resource_group.rg.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_azurewebsites_net_pdnsz[0].name
  virtual_network_id    = azurerm_virtual_network.vnet.id
}

#######################################################################################################################
# privatelink.api.azureml.ms
#######################################################################################################################
resource "azurerm_private_dns_zone" "privatelink_api_azureml_ms_pdnsz" {
  count               = var.enable_privatelink_api_azureml_ms_pdnsz ? 1 : 0
  name                = "privatelink.api.azureml.ms"
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_api_azureml_ms_pdnsz_link" {
  count                 = var.enable_privatelink_api_azureml_ms_pdnsz ? 1 : 0  
  name                  = "privatelink-api-azureml-ms-pdnsz-link"
  resource_group_name   = azurerm_resource_group.rg.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_api_azureml_ms_pdnsz[0].name
  virtual_network_id    = azurerm_virtual_network.vnet.id
}

#######################################################################################################################
# privatelink.notebooks.azure.net
#######################################################################################################################
resource "azurerm_private_dns_zone" "privatelink_notebooks_azure_net_pdnsz" {
  count               = var.enable_privatelink_notebooks_azure_net_pdnsz ? 1 : 0
  name                = "privatelink.notebooks.azure.net"
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_notebooks_azure_net_pdnsz_link" {
  count                 = var.enable_privatelink_notebooks_azure_net_pdnsz ? 1 : 0
  name                  = "privatelink-notebooks-azure-net-pdnsz-link"
  resource_group_name   = azurerm_resource_group.rg.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_notebooks_azure_net_pdnsz[0].name
  virtual_network_id    = azurerm_virtual_network.vnet.id
}

#######################################################################################################################
# privatelink.service.signalr.net
#######################################################################################################################
resource "azurerm_private_dns_zone" "privatelink_service_signalr_net_pdnsz" {
  count               = var.enable_privatelink_service_signalr_net_pdnsz ? 1 : 0
  name                = "privatelink.service.signalr.net"
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_service_signalr_net_pdnsz_link" {
  count                 = var.enable_privatelink_service_signalr_net_pdnsz ? 1 : 0
  name                  = "privatelink-service-signalr-net-pdnsz-link"
  resource_group_name   = azurerm_resource_group.rg.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_service_signalr_net_pdnsz[0].name
  virtual_network_id    = azurerm_virtual_network.vnet.id
}

#######################################################################################################################
# privatelink.monitor.azure.com
#######################################################################################################################
resource "azurerm_private_dns_zone" "privatelink_monitor_azure_com_pdnsz" { 
  count               = var.enable_privatelink_monitor_azure_com_pdnsz ? 1 : 0
  name                = "privatelink.monitor.azure.com"
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_monitor_azure_com_pdnsz_link" { 
  count                 = var.enable_privatelink_monitor_azure_com_pdnsz ? 1 : 0
  name                  = "privatelink-monitor-azure-com-pdnsz-link"
  resource_group_name   = azurerm_resource_group.rg.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_monitor_azure_com_pdnsz[0].name
  virtual_network_id    = azurerm_virtual_network.vnet.id
}

#######################################################################################################################
# privatelink.oms.opinsights.azure.com
#######################################################################################################################
resource "azurerm_private_dns_zone" "privatelink_oms_opinsights_azure_com_pdnsz" {
  count               = var.enable_privatelink_oms_opinsights_azure_com_pdnsz ? 1 : 0
  name                = "privatelink.oms.opinsights.azure.com"
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_oms_opinsights_azure_com_pdnsz_link" {
  count               = var.enable_privatelink_oms_opinsights_azure_com_pdnsz ? 1 : 0
  name                  = "privatelink-oms-opinsights-azure-com-pdnsz-link"
  resource_group_name   = azurerm_resource_group.rg.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_oms_opinsights_azure_com_pdnsz[0].name
  virtual_network_id    = azurerm_virtual_network.vnet.id
}

#######################################################################################################################
# privatelink.ods.opinsights.azure.com
#######################################################################################################################
resource "azurerm_private_dns_zone" "privatelink_ods_opinsights_azure_com_pdnsz" {
  count               = var.enable_privatelink_ods_opinsights_azure_com_pdnsz ? 1 : 0
  name                = "privatelink.ods.opinsights.azure.com"
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_ods_opinsights_azure_com_pdnsz_link" {
  count                 = var.enable_privatelink_ods_opinsights_azure_com_pdnsz ? 1 : 0
  name                  = "privatelink-ods-opinsights-azure-com-pdnsz-link"
  resource_group_name   = azurerm_resource_group.rg.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_ods_opinsights_azure_com_pdnsz[0].name
  virtual_network_id    = azurerm_virtual_network.vnet.id
}

#######################################################################################################################
# privatelink.agentsvc.azure-automation.net
#######################################################################################################################
resource "azurerm_private_dns_zone" "privatelink_agentsvc_azure_automation_net_pdnsz" {
  count               = var.enable_privatelink_agentsvc_azure_automation_net_pdnsz ? 1 : 0
  name                = "privatelink.agentsvc.azure-automation.net"
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_agentsvc_azure_automation_net_pdnsz_link" {
  count                 = var.enable_privatelink_agentsvc_azure_automation_net_pdnsz ? 1 : 0
  name                  = "privatelink.agentsvc-azure-automation-net-pdnsz-link"
  resource_group_name   = azurerm_resource_group.rg.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_agentsvc_azure_automation_net_pdnsz[0].name
  virtual_network_id    = azurerm_virtual_network.vnet.id
}

#######################################################################################################################
# privatelink.cognitiveservices.azure.com
#######################################################################################################################
resource "azurerm_private_dns_zone" "privatelink_cognitiveservices_azure_com_pdnsz" {
  count               = var.enable_privatelink_cognitiveservices_azure_com_pdnsz ? 1 : 0
  name                = "privatelink.cognitiveservices.azure.com"
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_cognitiveservices_azure_com_pdnsz_link" {
  count                 = var.enable_privatelink_cognitiveservices_azure_com_pdnsz ? 1 : 0
  name                  = "privatelink-cognitiveservices-azure-com-pdnsz-link"
  resource_group_name   = azurerm_resource_group.rg.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_cognitiveservices_azure_com_pdnsz[0].name
  virtual_network_id    = azurerm_virtual_network.vnet.id
}

#######################################################################################################################
# privatelink.afs.azure.net
#######################################################################################################################
resource "azurerm_private_dns_zone" "privatelink_afs_azure_net_pdnsz" {
  count               = var.enable_privatelink_afs_azure_net_pdnsz ? 1 : 0
  name                = "privatelink.afs.azure.net"
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_afs_azure_net_pdnsz_link" {
  count                 = var.enable_privatelink_afs_azure_net_pdnsz ? 1 : 0
  name                  = "privatelink-afs-azure-net-pdnsz-link"
  resource_group_name   = azurerm_resource_group.rg.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_afs_azure_net_pdnsz[0].name
  virtual_network_id    = azurerm_virtual_network.vnet.id
}

#######################################################################################################################
# privatelink.datafactory.azure.net
#######################################################################################################################
resource "azurerm_private_dns_zone" "privatelink_datafactory_azure_net_pdnsz" {
  count               = var.enable_privatelink_datafactory_azure_net_pdnsz ? 1 : 0
  name                = "privatelink.datafactory.azure.net"
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_datafactory_azure_net_pdnsz_link" {
  count                 = var.enable_privatelink_datafactory_azure_net_pdnsz ? 1 : 0
  name                  = "privatelink-datafactory-azure-net-pdnsz-link"
  resource_group_name   = azurerm_resource_group.rg.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_datafactory_azure_net_pdnsz[0].name
  virtual_network_id    = azurerm_virtual_network.vnet.id
}

#######################################################################################################################
# privatelink.adf.azure.com
#######################################################################################################################
resource "azurerm_private_dns_zone" "privatelink_adf_azure_com_pdnsz" {
  count                 = var.enable_privatelink_adf_azure_com_pdnsz ? 1 : 0
  name                = "privatelink.adf.azure.com"
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_adf_azure_com_pdnsz_link" {
  count                 = var.enable_privatelink_adf_azure_com_pdnsz ? 1 : 0
  name                  = "privatelink-adf-azure-com-pdnsz-link"
  resource_group_name   = azurerm_resource_group.rg.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_adf_azure_com_pdnsz[0].name
  virtual_network_id    = azurerm_virtual_network.vnet.id
}

#######################################################################################################################
# privatelink.redis.cache.windows.net
#######################################################################################################################
resource "azurerm_private_dns_zone" "privatelink_redis_cache_windows_net_pdnsz" {
  count                = var.enable_privatelink_redis_cache_windows_net_pdnsz ? 1 : 0
  name                = "privatelink.redis.cache.windows.net"
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_redis_cache_windows_net_pdnsz_link" {
  count                 = var.enable_privatelink_redis_cache_windows_net_pdnsz ? 1 : 0
  name                  = "privatelink-redis-cache-windows-net-pdnsz-link"
  resource_group_name   = azurerm_resource_group.rg.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_redis_cache_windows_net_pdnsz[0].name
  virtual_network_id    = azurerm_virtual_network.vnet.id
}

#######################################################################################################################
# privatelink.redisenterprise.cache.azure.net
#######################################################################################################################
resource "azurerm_private_dns_zone" "privatelink_redisenterprise_cache_azure_net_pdnsz" {
  count               = var.enable_privatelink_redisenterprise_cache_azure_net_pdnsz ? 1 : 0
  name                = "privatelink.redisenterprise.cache.azure.net"
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_redisenterprise_cache_azure_net_pdnsz_link" {
  count                 = var.enable_privatelink_redisenterprise_cache_azure_net_pdnsz ? 1 : 0
  name                  = "privatelink-redisenterprise-cache-azure-net-pdnsz-link"
  resource_group_name   = azurerm_resource_group.rg.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_redisenterprise_cache_azure_net_pdnsz[0].name
  virtual_network_id    = azurerm_virtual_network.vnet.id
}

#######################################################################################################################
# privatelink.purview.azure.com
#######################################################################################################################
resource "azurerm_private_dns_zone" "privatelink_purview_azure_com_pdnsz" {
  count               = var.enable_privatelink_purview_azure_com_pdnsz ? 1 : 0
  name                = "privatelink.purview.azure.com"
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_purview_azure_com_pdnsz_link" {
  count                 = var.enable_privatelink_purview_azure_com_pdnsz ? 1 : 0
  name                  = "privatelink-purview-azure-com-pdnsz-link"
  resource_group_name   = azurerm_resource_group.rg.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_purview_azure_com_pdnsz[0].name
  virtual_network_id    = azurerm_virtual_network.vnet.id
}

#######################################################################################################################
# privatelink.purviewstudio.azure.com
#######################################################################################################################
resource "azurerm_private_dns_zone" "privatelink_purviewstudio_azure_com_pdnsz" {
  count               = var.enable_privatelink_purviewstudio_azure_com_pdnsz ? 1 : 0
  name                = "privatelink.purviewstudio.azure.com"
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_purviewstudio_azure_com_pdnsz_link" {
  count                 = var.enable_privatelink_purviewstudio_azure_com_pdnsz ? 1 : 0
  name                  = "privatelink-purviewstudio-azure-com-pdnsz-link"
  resource_group_name   = azurerm_resource_group.rg.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_purviewstudio_azure_com_pdnsz[0].name
  virtual_network_id    = azurerm_virtual_network.vnet.id
}

#######################################################################################################################
# privatelink.digitaltwins.azure.net
#######################################################################################################################
resource "azurerm_private_dns_zone" "privatelink_digitaltwins_azure_net_pdnsz" {
  count               = var.enable_privatelink_digitaltwins_azure_net_pdnsz ? 1 : 0
  name                = "privatelink.digitaltwins.azure.net"
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_digitaltwins_azure_net_pdnsz_link" {
  count               = var.enable_privatelink_digitaltwins_azure_net_pdnsz ? 1 : 0
  name                  = "privatelink-digitaltwins-azure-net-pdnsz-link"
  resource_group_name   = azurerm_resource_group.rg.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_digitaltwins_azure_net_pdnsz[0].name
  virtual_network_id    = azurerm_virtual_network.vnet.id
}

#######################################################################################################################
# privatelink.azurehdinsight.net
#######################################################################################################################
resource "azurerm_private_dns_zone" "privatelink_azurehdinsight_net_pdnsz" {
  count               = var.enable_privatelink_azurehdinsight_net_pdnsz ? 1 : 0
  name                = "privatelink.azurehdinsight.net"
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_azurehdinsight_net_pdnsz_link" {
  count                 = var.enable_privatelink_azurehdinsight_net_pdnsz ? 1 : 0
  name                  = "privatelink-azurehdinsight-net-pdnsz-link"
  resource_group_name   = azurerm_resource_group.rg.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_azurehdinsight_net_pdnsz[0].name
  virtual_network_id    = azurerm_virtual_network.vnet.id
}

#######################################################################################################################
# privatelink.his.arc.azure.com
#######################################################################################################################
resource "azurerm_private_dns_zone" "privatelink_his_arc_azure_com_pdnsz" {
  count               = var.enable_privatelink_his_arc_azure_com_pdnsz ? 1 : 0
  name                = "privatelink.his.arc.azure.com"
  resource_group_name = azurerm_resource_group.rg.name
}
  
resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_his_arc_azure_com_pdnsz_link" {
  count                 = var.enable_privatelink_his_arc_azure_com_pdnsz ? 1 : 0
  name                  = "privatelink-his-arc-azure-com-pdnsz-link"
  resource_group_name   = azurerm_resource_group.rg.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_his_arc_azure_com_pdnsz[0].name
  virtual_network_id    = azurerm_virtual_network.vnet.id
}

#######################################################################################################################
# privatelink.guestconfiguration.azure.com
#######################################################################################################################
resource "azurerm_private_dns_zone" "privatelink_guestconfiguration_azure_com_pdnsz" {
  count               = var.enable_privatelink_guestconfiguration_azure_com_pdnsz ? 1 : 0
  name                = "privatelink.guestconfiguration.azure.com"
  resource_group_name = azurerm_resource_group.rg.name
}
  
resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_guestconfiguration_azure_com_pdnsz_link" {
  count                 = var.enable_privatelink_guestconfiguration_azure_com_pdnsz ? 1 : 0
  name                  = "privatelink-guestconfiguration-azure-com-pdnsz-link"
  resource_group_name   = azurerm_resource_group.rg.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_guestconfiguration_azure_com_pdnsz[0].name
  virtual_network_id    = azurerm_virtual_network.vnet.id
} 

#######################################################################################################################
# privatelink.media.azure.net
#######################################################################################################################
resource "azurerm_private_dns_zone" "privatelink_media_azure_net_pdnsz" {
  count               = var.enable_privatelink_media_azure_net_pdnsz ? 1 : 0
  name                = "privatelink.media.azure.net"
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_media_azure_net_pdnsz_link" {
  count                 = var.enable_privatelink_media_azure_net_pdnsz ? 1 : 0
  name                  = "privatelink-media-azure-net-pdnsz-link"
  resource_group_name   = azurerm_resource_group.rg.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_media_azure_net_pdnsz[0].name
  virtual_network_id    = azurerm_virtual_network.vnet.id
}
