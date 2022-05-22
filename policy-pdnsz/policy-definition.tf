# az policy definition list --query "[?policyType == 'Custom']" -o json
resource azurerm_policy_definition policy {
  for_each =  toset( ["Todd", "James", "Alice", "Dottie"] )
 sqlServer
 Sql
 SqlOnDemand
 Dev
 Web
 Blob (blob, blob_secondary)
 Table (table, table_secondary)
 Queue (queue, queue_secondary)
 File (file, file_secondary)
 Web (web, web_secondary)
 Data Lake File System Gen2 (dfs, dfs_secondary)
 Sql
 MongoDB
 Cassandra
 Gremlin
 Table
 batchAccount
 postgresqlServer
 mysqlServer
 mariadbServer
 vault
 Managed HSMs
 management
 searchService
 registry
 configurationStores
 AzureBackup
 AzureSiteRecovery
 namespace
 namespace
 iotHub
 namespace
 topic
 domain
 sites
 amlworkspace
 signalR
 azuremonitor
 account
 afs
 dataFactory
 portal
 redisCache
 redisEnterprise
 Webhook
 DSCAndHybridWorker
 blob
 blob_secondary
 table
 table_secondary
 queue
 queue_secondary
 file
 file_secondary
 web
 web_secondary
 dfs
 dfs_secondary
 Sql
 MongoDB
 Cassandra
 Gremlin
 Table
 postgresqlServer
 mysqlServer
 mariadbServer
 vault
 namespace
 namespace
 iotHub
 namespace
 topic
 domain
 sites
 amlworkspace
 signalR
 afs
 dataFactory
 portal
 redisCache
  name         = "deploy-if-not-exists-storage-account-pe-dns-record"
  policy_type  = "Custom"
  mode         = "Indexed"
  display_name = "deploy-if-not-exists-storage-account-pe-dns-record"

  metadata = <<METADATA
    {
      "category": "Storage"
    }

METADATA

  policy_rule = <<POLICY_RULE
{
  "mode": "Indexed",
  "policyRule": {
    "if": {
      "allOf": [
        {
          "field": "type",
          "equals": "Microsoft.Network/privateEndpoints"
        },
        {
          "count": {
            "field": "Microsoft.Network/privateEndpoints/privateLinkServiceConnections[*].groupIds[*]",
            "where": {
              "field": "Microsoft.Network/privateEndpoints/privateLinkServiceConnections[*].groupIds[*]",
              "equals": "blob"
            }
          },
          "greaterOrEquals": 1
        }
      ]
    },
    "then": {
      "effect": "deployIfNotExists",
      "details": {
        "type": "Microsoft.Network/privateEndpoints/privateDnsZoneGroups",
        "evaluationDelay": "AfterProvisioningSuccess",
        "roleDefinitionIds": [
          "/providers/Microsoft.Authorization/roleDefinitions/4d97b98b-1d4f-4787-a291-c67834d212e7"
        ],
        "deployment": {
          "properties": {
            "mode": "incremental",
            "template": {
              "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentTemplate.json#",
              "contentVersion": "1.0.0.0",
              "parameters": {
                "privateDnsZoneId": {
                  "type": "string"
                },
                "privateEndpointName": {
                  "type": "string"
                },
                "location": {
                  "type": "string"
                }
              },
              "resources": [
                {
                  "name": "[concat(parameters('privateEndpointName'), '/deployedByPolicy')]",
                  "type": "Microsoft.Network/privateEndpoints/privateDnsZoneGroups",
                  "apiVersion": "2020-03-01",
                  "location": "[parameters('location')]",
                  "properties": {
                    "privateDnsZoneConfigs": [
                      {
                        "name": "storageBlob-privateDnsZone",
                        "properties": {
                          "privateDnsZoneId": "[parameters('privateDnsZoneId')]"
                        }
                      }
                    ]
                  }
                }
              ]
            },
            "parameters": {
              "privateDnsZoneId": {
                "value": "[parameters('privateDnsZoneId')]"
              },
              "privateEndpointName": {
                "value": "[field('name')]"
              },
              "location": {
                "value": "[field('location')]"
              }
            }
          }
        }
      }
    }
  }
}
POLICY_RULE


  parameters = <<PARAMETERS
  {
    "privateDnsZoneId": {
      "type": "String",
      "metadata": {
        "displayName": "privateDnsZoneId",
        "description": null,
        "strongType": "Microsoft.Network/privateDnsZones"
      }
    }
  }
PARAMETERS
 
}

resource azurerm_management_group_policy_assignment policy_assignment {
  name                 = "policy-assignment"
  policy_definition_id = azurerm_policy_definition.policy.id
  management_group_id  = data.azurerm_management_group.mg.id
}