

## Overview
Hub module. Contains hub network and related resources.

- Integrates with [onprem](../onprem/README.md) and [s2svpn-winra-vpng](../s2svpn-winra-vpng/README.md) modules.
- Deploys its resources to the ```hub-rg``` resource group by default.
- Top-level [README](../README.md) explains the resources in detail and how they fit into a [larger architecture](../images/hub-spoke.png).

## Providers

| Name | Version |
|------|---------|
| <a name="provider_http"></a> [http](#provider\_http) | 2.2.0 |
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.10.0 |

## Inputs

| Name | Description | Default |
|------|-------------|---------|
| <a name="input_hub_name"></a> [hub\_name](#input\_hub\_name) | Hub name. Used as a name prefix for resources in this module. | `"hub"` |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource group name. Set to <hub\_name>-rg if not specified. | `null` |
| <a name="input_location"></a> [location](#input\_location) | Region of hub resources. | `"eastus"` |
| <a name="input_vnet_name"></a> [vnet\_name](#input\_vnet\_name) | Virtual network name. Set to <hub\_name>-vnet if not specified. | `null` |
| <a name="input_vnet_address_space"></a> [vnet\_address\_space](#input\_vnet\_address\_space) | Virtual network address space. | <pre>[<br>  "10.0.0.0/16"<br>]</pre> |
| <a name="input_afw_snet_address_prefixes"></a> [afw\_snet\_address\_prefixes](#input\_afw\_snet\_address\_prefixes) | Firewall subnet address prefix. | <pre>[<br>  "10.0.0.0/26"<br>]</pre> |
| <a name="input_vpng_snet_address_prefixes"></a> [vpng\_snet\_address\_prefixes](#input\_vpng\_snet\_address\_prefixes) | Gateway subnet address prefix. | <pre>[<br>  "10.0.0.64/27"<br>]</pre> |
| <a name="input_mgmt_snet_name"></a> [mgmt\_snet\_name](#input\_mgmt\_snet\_name) | Management subnet name. Set to <hub\_name>-mgmt-snet if not specified. | `null` |
| <a name="input_mgmt_snet_address_prefixes"></a> [mgmt\_snet\_address\_prefixes](#input\_mgmt\_snet\_address\_prefixes) | Management subnet address prefix. | <pre>[<br>  "10.0.255.0/24"<br>]</pre> |
| <a name="input_mgmt_snet_nsg_name"></a> [mgmt\_snet\_nsg\_name](#input\_mgmt\_snet\_nsg\_name) | Management subnet network security group name. Set to <hub\_name>-mgmt-snet if not specified. | `null` |
| <a name="input_mgmt_snet_allow_ip_list"></a> [mgmt\_snet\_allow\_ip\_list](#input\_mgmt\_snet\_allow\_ip\_list) | List of IP addresses to allow inbound to the management subnet. Default of 'clientip' sets allow list to client IP. | `"clientip"` |
| <a name="input_dns_snet_name"></a> [dns\_snet\_name](#input\_dns\_snet\_name) | DNS subnet name. Set to <hub\_name>-dns-snet if not specified. | `null` |
| <a name="input_dns_snet_address_prefixes"></a> [dns\_snet\_address\_prefixes](#input\_dns\_snet\_address\_prefixes) | DNS subnet address prefixes. | <pre>[<br>  "10.0.254.0/24"<br>]</pre> |
| <a name="input_dns_snet_nsg_name"></a> [dns\_snet\_nsg\_name](#input\_dns\_snet\_nsg\_name) | DNS subnet network security group name. Set to <hub\_name>-snet-nsg if not specified. | `null` |
| <a name="input_dns_snet_allow_ip_list"></a> [dns\_snet\_allow\_ip\_list](#input\_dns\_snet\_allow\_ip\_list) | Group of IP's to allow inbound access to the DNS subnet. Default of 'clientip' sets allow list to client IP. | `"clientip"` |
| <a name="input_afw_enable"></a> [afw\_enable](#input\_afw\_enable) | Enable Azure firewall. | `false` |
| <a name="input_afw_name"></a> [afw\_name](#input\_afw\_name) | Azure Firewall name. Set to <hub\_name>-afw if not specified. | `null` |
| <a name="input_vpng_enable"></a> [vpng\_enable](#input\_vpng\_enable) | Enable VPN gateway. | `false` |
| <a name="input_vpng_name"></a> [vpng\_name](#input\_vpng\_name) | VPN Gateway name. Set to <hub\_name>-vpng if not specified. | `null` |
| <a name="input_vpng_shared_key"></a> [vpng\_shared\_key](#input\_vpng\_shared\_key) | VPN Gateway shared key. | `null` |
| <a name="input_vpng_connection_onprem_enable"></a> [vpng\_connection\_onprem\_enable](#input\_vpng\_connection\_onprem\_enable) | Enable VPN gateway connection to simulated on-premises network. | `false` |
| <a name="input_lgw_name"></a> [lgw\_name](#input\_lgw\_name) | Local network gateway name. Set to <hub\_name>-lgw if not specified. | `null` |
| <a name="input_lgw_gateway_address"></a> [lgw\_gateway\_address](#input\_lgw\_gateway\_address) | Local network gateway address. (Public IP address of remote VPN device.) | `null` |
| <a name="input_lgw_address_space"></a> [lgw\_address\_space](#input\_lgw\_address\_space) | Local network gateway address space. | <pre>[<br>  "172.16.0.0/16"<br>]</pre> |
| <a name="input_onprem_vnet_resource_group_name"></a> [onprem\_vnet\_resource\_group\_name](#input\_onprem\_vnet\_resource\_group\_name) | Resource group containing on-prem simulator virtual network. | `"onprem-rg"` |
| <a name="input_onprem_vnet_name"></a> [onprem\_vnet\_name](#input\_onprem\_vnet\_name) | On-premises simulator virtual network name. | `"onprem-vnet"` |
| <a name="input_onprem_vnet_id"></a> [onprem\_vnet\_id](#input\_onprem\_vnet\_id) | On-premises simulator virtual network ID. | `null` |
| <a name="input_mgmt_vm_name"></a> [mgmt\_vm\_name](#input\_mgmt\_vm\_name) | Name of management virtual machine. Set to <hub-name>-mgmt-vm if not specified. | `null` |
| <a name="input_mgmt_vm_urn"></a> [mgmt\_vm\_urn](#input\_mgmt\_vm\_urn) | URN for management virtual machine | `"RedHat:RHEL:8_6:latest"` |
| <a name="input_mgmt_vm_plan"></a> [mgmt\_vm\_plan](#input\_mgmt\_vm\_plan) | Plan for management virtual machine. | `null` |
| <a name="input_mgmt_vm_size"></a> [mgmt\_vm\_size](#input\_mgmt\_vm\_size) | Size of management virtual machine. | `"Standard_B1s"` |
| <a name="input_mgmt_vm_private_ip_address"></a> [mgmt\_vm\_private\_ip\_address](#input\_mgmt\_vm\_private\_ip\_address) | Private IP address for management virtual machine. | `"10.0.255.4"` |
| <a name="input_mgmt_vm_enable_public_ip"></a> [mgmt\_vm\_enable\_public\_ip](#input\_mgmt\_vm\_enable\_public\_ip) | Enable public IP address for management virtual machine. | `true` |
| <a name="input_mgmt_vm_admin_username"></a> [mgmt\_vm\_admin\_username](#input\_mgmt\_vm\_admin\_username) | Admin username for management virtual machine. | `"azadmin"` |
| <a name="input_mgmt_vm_admin_password"></a> [mgmt\_vm\_admin\_password](#input\_mgmt\_vm\_admin\_password) | Admin password for management virtual machine. | `null` |
| <a name="input_mgmt_vm_admin_public_ssh_key_path"></a> [mgmt\_vm\_admin\_public\_ssh\_key\_path](#input\_mgmt\_vm\_admin\_public\_ssh\_key\_path) | Admin user public SSH key path for management virtual machine. | `"~/.ssh/id_rsa.pub"` |
| <a name="input_dns_vm_001_name"></a> [dns\_vm\_001\_name](#input\_dns\_vm\_001\_name) | Name of the DNS virtual machine. Set to <hub\_name>-dns-vm-001 if not specified. | `null` |
| <a name="input_dns_vm_001_urn"></a> [dns\_vm\_001\_urn](#input\_dns\_vm\_001\_urn) | URN for DNS virtual machine. | `"RedHat:RHEL:8_6:latest"` |
| <a name="input_dns_vm_001_plan"></a> [dns\_vm\_001\_plan](#input\_dns\_vm\_001\_plan) | Plan for the DNS virtual machine. | `null` |
| <a name="input_dns_vm_001_size"></a> [dns\_vm\_001\_size](#input\_dns\_vm\_001\_size) | Size of DNS virtual machine. | `"Standard_B1s"` |
| <a name="input_dns_vm_001_private_ip_address"></a> [dns\_vm\_001\_private\_ip\_address](#input\_dns\_vm\_001\_private\_ip\_address) | Private IP address for the DNS virtual machine. | `"10.0.254.4"` |
| <a name="input_dns_vm_001_enable_public_ip"></a> [dns\_vm\_001\_enable\_public\_ip](#input\_dns\_vm\_001\_enable\_public\_ip) | Enable public IP address for the DNS virtual machine. | `false` |
| <a name="input_dns_vm_001_admin_username"></a> [dns\_vm\_001\_admin\_username](#input\_dns\_vm\_001\_admin\_username) | Admin username for the DNS virtual machine. | `"azadmin"` |
| <a name="input_dns_vm_001_admin_password"></a> [dns\_vm\_001\_admin\_password](#input\_dns\_vm\_001\_admin\_password) | Admin password or the DNS virtual machine. | `null` |
| <a name="input_dns_vm_001_admin_public_ssh_key_path"></a> [dns\_vm\_001\_admin\_public\_ssh\_key\_path](#input\_dns\_vm\_001\_admin\_public\_ssh\_key\_path) | Admin user public SSH key path for the DNS virtual machine. | `"~/.ssh/id_rsa.pub"` |
| <a name="input_vmreg_pdnsz_name"></a> [vmreg\_pdnsz\_name](#input\_vmreg\_pdnsz\_name) | Name of DNS zone for registering virtual machines. | `"foo.net"` |
| <a name="input_enable_privatelink_azure_automation_net_pdnsz"></a> [enable\_privatelink\_azure\_automation\_net\_pdnsz](#input\_enable\_privatelink\_azure\_automation\_net\_pdnsz) | Enable private DNS zone corresponding to the variable name. | `false` |
| <a name="input_enable_privatelink_database_windows_net_pdnsz"></a> [enable\_privatelink\_database\_windows\_net\_pdnsz](#input\_enable\_privatelink\_database\_windows\_net\_pdnsz) | Enable private DNS zone corresponding to the variable name. | `false` |
| <a name="input_enable_privatelink_sql_azuresynapse_net_pdnsz"></a> [enable\_privatelink\_sql\_azuresynapse\_net\_pdnsz](#input\_enable\_privatelink\_sql\_azuresynapse\_net\_pdnsz) | Enable private DNS zone corresponding to the variable name. | `false` |
| <a name="input_enable_privatelink_sqlondemand_azuresynapse_net_pdnsz"></a> [enable\_privatelink\_sqlondemand\_azuresynapse\_net\_pdnsz](#input\_enable\_privatelink\_sqlondemand\_azuresynapse\_net\_pdnsz) | Enable private DNS zone corresponding to the variable name. | `false` |
| <a name="input_enable_privatelink_dev_azuresynapse_net_pdnsz"></a> [enable\_privatelink\_dev\_azuresynapse\_net\_pdnsz](#input\_enable\_privatelink\_dev\_azuresynapse\_net\_pdnsz) | Enable private DNS zone corresponding to the variable name. | `false` |
| <a name="input_enable_privatelink_azuresynapse_net_pdnsz"></a> [enable\_privatelink\_azuresynapse\_net\_pdnsz](#input\_enable\_privatelink\_azuresynapse\_net\_pdnsz) | Enable private DNS zone corresponding to the variable name. | `false` |
| <a name="input_enable_privatelink_blob_core_windows_net_pdnsz"></a> [enable\_privatelink\_blob\_core\_windows\_net\_pdnsz](#input\_enable\_privatelink\_blob\_core\_windows\_net\_pdnsz) | Enable private DNS zone corresponding to the variable name. | `false` |
| <a name="input_enable_privatelink_table_core_windows_net_pdnsz"></a> [enable\_privatelink\_table\_core\_windows\_net\_pdnsz](#input\_enable\_privatelink\_table\_core\_windows\_net\_pdnsz) | Enable private DNS zone corresponding to the variable name. | `false` |
| <a name="input_enable_privatelink_queue_core_windows_net_pdnsz"></a> [enable\_privatelink\_queue\_core\_windows\_net\_pdnsz](#input\_enable\_privatelink\_queue\_core\_windows\_net\_pdnsz) | Enable private DNS zone corresponding to the variable name. | `false` |
| <a name="input_enable_privatelink_file_core_windows_net_pdnsz"></a> [enable\_privatelink\_file\_core\_windows\_net\_pdnsz](#input\_enable\_privatelink\_file\_core\_windows\_net\_pdnsz) | Enable private DNS zone corresponding to the variable name. | `false` |
| <a name="input_enable_privatelink_web_core_windows_net_pdnsz"></a> [enable\_privatelink\_web\_core\_windows\_net\_pdnsz](#input\_enable\_privatelink\_web\_core\_windows\_net\_pdnsz) | Enable private DNS zone corresponding to the variable name. | `false` |
| <a name="input_enable_privatelink_dfs_core_windows_net_pdnsz"></a> [enable\_privatelink\_dfs\_core\_windows\_net\_pdnsz](#input\_enable\_privatelink\_dfs\_core\_windows\_net\_pdnsz) | Enable private DNS zone corresponding to the variable name. | `false` |
| <a name="input_enable_privatelink_documents_azure_com_pdnsz"></a> [enable\_privatelink\_documents\_azure\_com\_pdnsz](#input\_enable\_privatelink\_documents\_azure\_com\_pdnsz) | Enable private DNS zone corresponding to the variable name. | `false` |
| <a name="input_enable_privatelink_mongo_cosmos_azure_com_pdnsz"></a> [enable\_privatelink\_mongo\_cosmos\_azure\_com\_pdnsz](#input\_enable\_privatelink\_mongo\_cosmos\_azure\_com\_pdnsz) | Enable private DNS zone corresponding to the variable name. | `false` |
| <a name="input_enable_privatelink_cassandra_cosmos_azure_com_pdnsz"></a> [enable\_privatelink\_cassandra\_cosmos\_azure\_com\_pdnsz](#input\_enable\_privatelink\_cassandra\_cosmos\_azure\_com\_pdnsz) | Enable private DNS zone corresponding to the variable name. | `false` |
| <a name="input_enable_privatelink_gremlin_cosmos_azure_com_pdnsz"></a> [enable\_privatelink\_gremlin\_cosmos\_azure\_com\_pdnsz](#input\_enable\_privatelink\_gremlin\_cosmos\_azure\_com\_pdnsz) | Enable private DNS zone corresponding to the variable name. | `false` |
| <a name="input_enable_privatelink_table_cosmos_azure_com_pdnsz"></a> [enable\_privatelink\_table\_cosmos\_azure\_com\_pdnsz](#input\_enable\_privatelink\_table\_cosmos\_azure\_com\_pdnsz) | Enable private DNS zone corresponding to the variable name. | `false` |
| <a name="input_enable_privatelink_centralus_batch_azure_com_pdnsz"></a> [enable\_privatelink\_centralus\_batch\_azure\_com\_pdnsz](#input\_enable\_privatelink\_centralus\_batch\_azure\_com\_pdnsz) | Enable private DNS zone corresponding to the variable name. | `false` |
| <a name="input_enable_privatelink_eastus_batch_azure_com_pdnsz"></a> [enable\_privatelink\_eastus\_batch\_azure\_com\_pdnsz](#input\_enable\_privatelink\_eastus\_batch\_azure\_com\_pdnsz) | Enable private DNS zone corresponding to the variable name. | `false` |
| <a name="input_enable_privatelink_westus_batch_azure_com_pdnsz"></a> [enable\_privatelink\_westus\_batch\_azure\_com\_pdnsz](#input\_enable\_privatelink\_westus\_batch\_azure\_com\_pdnsz) | Enable private DNS zone corresponding to the variable name. | `false` |
| <a name="input_enable_privatelink_postgres_database_azure_com_pdnsz"></a> [enable\_privatelink\_postgres\_database\_azure\_com\_pdnsz](#input\_enable\_privatelink\_postgres\_database\_azure\_com\_pdnsz) | Enable private DNS zone corresponding to the variable name. | `false` |
| <a name="input_enable_privatelink_mysql_database_azure_com_pdnsz"></a> [enable\_privatelink\_mysql\_database\_azure\_com\_pdnsz](#input\_enable\_privatelink\_mysql\_database\_azure\_com\_pdnsz) | Enable private DNS zone corresponding to the variable name. | `false` |
| <a name="input_enable_privatelink_mariadb_database_azure_com_pdnsz"></a> [enable\_privatelink\_mariadb\_database\_azure\_com\_pdnsz](#input\_enable\_privatelink\_mariadb\_database\_azure\_com\_pdnsz) | Enable private DNS zone corresponding to the variable name. | `false` |
| <a name="input_enable_privatelink_vaultcore_azure_net_pdnsz"></a> [enable\_privatelink\_vaultcore\_azure\_net\_pdnsz](#input\_enable\_privatelink\_vaultcore\_azure\_net\_pdnsz) | Enable private DNS zone corresponding to the variable name. | `false` |
| <a name="input_enable_privatelink_managedhsm_azure_net_pdnsz"></a> [enable\_privatelink\_managedhsm\_azure\_net\_pdnsz](#input\_enable\_privatelink\_managedhsm\_azure\_net\_pdnsz) | Enable private DNS zone corresponding to the variable name. | `false` |
| <a name="input_enable_privatelink_eastus_azmk8s_io_pdnsz"></a> [enable\_privatelink\_eastus\_azmk8s\_io\_pdnsz](#input\_enable\_privatelink\_eastus\_azmk8s\_io\_pdnsz) | Enable private DNS zone corresponding to the variable name. | `false` |
| <a name="input_enable_privatelink_search_windows_net_pdnsz"></a> [enable\_privatelink\_search\_windows\_net\_pdnsz](#input\_enable\_privatelink\_search\_windows\_net\_pdnsz) | Enable private DNS zone corresponding to the variable name. | `false` |
| <a name="input_enable_privatelink_azurecr_io_pdnsz"></a> [enable\_privatelink\_azurecr\_io\_pdnsz](#input\_enable\_privatelink\_azurecr\_io\_pdnsz) | Enable private DNS zone corresponding to the variable name. | `false` |
| <a name="input_enable_privatelink_azconfig_io_pdnsz"></a> [enable\_privatelink\_azconfig\_io\_pdnsz](#input\_enable\_privatelink\_azconfig\_io\_pdnsz) | Enable private DNS zone corresponding to the variable name. | `false` |
| <a name="input_enable_privatelink_centralus_backup_windowsazure_com_pdnsz"></a> [enable\_privatelink\_centralus\_backup\_windowsazure\_com\_pdnsz](#input\_enable\_privatelink\_centralus\_backup\_windowsazure\_com\_pdnsz) | Enable private DNS zone corresponding to the variable name. | `false` |
| <a name="input_enable_privatelink_eastus_backup_windowsazure_com_pdnsz"></a> [enable\_privatelink\_eastus\_backup\_windowsazure\_com\_pdnsz](#input\_enable\_privatelink\_eastus\_backup\_windowsazure\_com\_pdnsz) | Enable private DNS zone corresponding to the variable name. | `false` |
| <a name="input_enable_privatelink_hypervrecoverymanager_windowsazure_com_pdnsz"></a> [enable\_privatelink\_hypervrecoverymanager\_windowsazure\_com\_pdnsz](#input\_enable\_privatelink\_hypervrecoverymanager\_windowsazure\_com\_pdnsz) | Enable private DNS zone corresponding to the variable name. | `false` |
| <a name="input_enable_privatelink_siterecovery_windowsazure_com_pdnsz"></a> [enable\_privatelink\_siterecovery\_windowsazure\_com\_pdnsz](#input\_enable\_privatelink\_siterecovery\_windowsazure\_com\_pdnsz) | Enable private DNS zone corresponding to the variable name. | `false` |
| <a name="input_enable_privatelink_azure_devices_net_pdnsz"></a> [enable\_privatelink\_azure\_devices\_net\_pdnsz](#input\_enable\_privatelink\_azure\_devices\_net\_pdnsz) | Enable private DNS zone corresponding to the variable name. | `false` |
| <a name="input_enable_privatelink_servicebus_windows_net_pdnsz"></a> [enable\_privatelink\_servicebus\_windows\_net\_pdnsz](#input\_enable\_privatelink\_servicebus\_windows\_net\_pdnsz) | Enable private DNS zone corresponding to the variable name. | `false` |
| <a name="input_enable_privatelink_eventgrid_azure_net_pdnsz"></a> [enable\_privatelink\_eventgrid\_azure\_net\_pdnsz](#input\_enable\_privatelink\_eventgrid\_azure\_net\_pdnsz) | Enable private DNS zone corresponding to the variable name. | `false` |
| <a name="input_enable_privatelink_azurewebsites_net_pdnsz"></a> [enable\_privatelink\_azurewebsites\_net\_pdnsz](#input\_enable\_privatelink\_azurewebsites\_net\_pdnsz) | Enable private DNS zone corresponding to the variable name. | `false` |
| <a name="input_enable_privatelink_api_azureml_ms_pdnsz"></a> [enable\_privatelink\_api\_azureml\_ms\_pdnsz](#input\_enable\_privatelink\_api\_azureml\_ms\_pdnsz) | Enable private DNS zone corresponding to the variable name. | `false` |
| <a name="input_enable_privatelink_notebooks_azure_net_pdnsz"></a> [enable\_privatelink\_notebooks\_azure\_net\_pdnsz](#input\_enable\_privatelink\_notebooks\_azure\_net\_pdnsz) | Enable private DNS zone corresponding to the variable name. | `false` |
| <a name="input_enable_privatelink_service_signalr_net_pdnsz"></a> [enable\_privatelink\_service\_signalr\_net\_pdnsz](#input\_enable\_privatelink\_service\_signalr\_net\_pdnsz) | Enable private DNS zone corresponding to the variable name. | `false` |
| <a name="input_enable_privatelink_monitor_azure_com_pdnsz"></a> [enable\_privatelink\_monitor\_azure\_com\_pdnsz](#input\_enable\_privatelink\_monitor\_azure\_com\_pdnsz) | Enable private DNS zone corresponding to the variable name. | `false` |
| <a name="input_enable_privatelink_oms_opinsights_azure_com_pdnsz"></a> [enable\_privatelink\_oms\_opinsights\_azure\_com\_pdnsz](#input\_enable\_privatelink\_oms\_opinsights\_azure\_com\_pdnsz) | Enable private DNS zone corresponding to the variable name. | `false` |
| <a name="input_enable_privatelink_ods_opinsights_azure_com_pdnsz"></a> [enable\_privatelink\_ods\_opinsights\_azure\_com\_pdnsz](#input\_enable\_privatelink\_ods\_opinsights\_azure\_com\_pdnsz) | Enable private DNS zone corresponding to the variable name. | `false` |
| <a name="input_enable_privatelink_agentsvc_azure_automation_net_pdnsz"></a> [enable\_privatelink\_agentsvc\_azure\_automation\_net\_pdnsz](#input\_enable\_privatelink\_agentsvc\_azure\_automation\_net\_pdnsz) | Enable private DNS zone corresponding to the variable name. | `false` |
| <a name="input_enable_privatelink_cognitiveservices_azure_com_pdnsz"></a> [enable\_privatelink\_cognitiveservices\_azure\_com\_pdnsz](#input\_enable\_privatelink\_cognitiveservices\_azure\_com\_pdnsz) | Enable private DNS zone corresponding to the variable name. | `false` |
| <a name="input_enable_privatelink_afs_azure_net_pdnsz"></a> [enable\_privatelink\_afs\_azure\_net\_pdnsz](#input\_enable\_privatelink\_afs\_azure\_net\_pdnsz) | Enable private DNS zone corresponding to the variable name. | `false` |
| <a name="input_enable_privatelink_datafactory_azure_net_pdnsz"></a> [enable\_privatelink\_datafactory\_azure\_net\_pdnsz](#input\_enable\_privatelink\_datafactory\_azure\_net\_pdnsz) | Enable private DNS zone corresponding to the variable name. | `false` |
| <a name="input_enable_privatelink_adf_azure_com_pdnsz"></a> [enable\_privatelink\_adf\_azure\_com\_pdnsz](#input\_enable\_privatelink\_adf\_azure\_com\_pdnsz) | Enable private DNS zone corresponding to the variable name. | `false` |
| <a name="input_enable_privatelink_redis_cache_windows_net_pdnsz"></a> [enable\_privatelink\_redis\_cache\_windows\_net\_pdnsz](#input\_enable\_privatelink\_redis\_cache\_windows\_net\_pdnsz) | Enable private DNS zone corresponding to the variable name. | `false` |
| <a name="input_enable_privatelink_redisenterprise_cache_azure_net_pdnsz"></a> [enable\_privatelink\_redisenterprise\_cache\_azure\_net\_pdnsz](#input\_enable\_privatelink\_redisenterprise\_cache\_azure\_net\_pdnsz) | Enable private DNS zone corresponding to the variable name. | `false` |
| <a name="input_enable_privatelink_purview_azure_com_pdnsz"></a> [enable\_privatelink\_purview\_azure\_com\_pdnsz](#input\_enable\_privatelink\_purview\_azure\_com\_pdnsz) | Enable private DNS zone corresponding to the variable name. | `false` |
| <a name="input_enable_privatelink_purviewstudio_azure_com_pdnsz"></a> [enable\_privatelink\_purviewstudio\_azure\_com\_pdnsz](#input\_enable\_privatelink\_purviewstudio\_azure\_com\_pdnsz) | Enable private DNS zone corresponding to the variable name. | `false` |
| <a name="input_enable_privatelink_digitaltwins_azure_net_pdnsz"></a> [enable\_privatelink\_digitaltwins\_azure\_net\_pdnsz](#input\_enable\_privatelink\_digitaltwins\_azure\_net\_pdnsz) | Enable private DNS zone corresponding to the variable name. | `false` |
| <a name="input_enable_privatelink_azurehdinsight_net_pdnsz"></a> [enable\_privatelink\_azurehdinsight\_net\_pdnsz](#input\_enable\_privatelink\_azurehdinsight\_net\_pdnsz) | Enable private DNS zone corresponding to the variable name. | `false` |
| <a name="input_enable_privatelink_his_arc_azure_com_pdnsz"></a> [enable\_privatelink\_his\_arc\_azure\_com\_pdnsz](#input\_enable\_privatelink\_his\_arc\_azure\_com\_pdnsz) | Enable private DNS zone corresponding to the variable name. | `false` |
| <a name="input_enable_privatelink_guestconfiguration_azure_com_pdnsz"></a> [enable\_privatelink\_guestconfiguration\_azure\_com\_pdnsz](#input\_enable\_privatelink\_guestconfiguration\_azure\_com\_pdnsz) | Enable private DNS zone corresponding to the variable name. | `false` |
| <a name="input_enable_privatelink_media_azure_net_pdnsz"></a> [enable\_privatelink\_media\_azure\_net\_pdnsz](#input\_enable\_privatelink\_media\_azure\_net\_pdnsz) | Enable private DNS zone corresponding to the variable name. | `false` |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_vnet_id"></a> [vnet\_id](#output\_vnet\_id) | n/a |
| <a name="output_vpng_public_ip_address"></a> [vpng\_public\_ip\_address](#output\_vpng\_public\_ip\_address) | n/a |
| <a name="output_vnet_address_space"></a> [vnet\_address\_space](#output\_vnet\_address\_space) | n/a |
| <a name="output_vmreg_pdnsz_name"></a> [vmreg\_pdnsz\_name](#output\_vmreg\_pdnsz\_name) | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_firewall.afw](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/firewall) | resource |
| [azurerm_local_network_gateway.lgw](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/local_network_gateway) | resource |
| [azurerm_network_security_group.dns_snet_nsg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group) | resource |
| [azurerm_network_security_group.mgmt_snet_nsg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group) | resource |
| [azurerm_network_security_rule.dns_snet_allow_inbound_nsg_rule](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_rule) | resource |
| [azurerm_network_security_rule.mgmt_snet_allow_inbound_nsg_rule](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_rule) | resource |
| [azurerm_private_dns_zone.privatelink_adf_azure_com_pdnsz](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone.privatelink_afs_azure_net_pdnsz](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone.privatelink_agentsvc_azure_automation_net_pdnsz](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone.privatelink_api_azureml_ms_pdnsz](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone.privatelink_azconfig_io_pdnsz](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone.privatelink_azure_automation_net_pdnsz](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone.privatelink_azure_devices_net_pdnsz](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone.privatelink_azurecr_io_pdnsz](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone.privatelink_azurehdinsight_net_pdnsz](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone.privatelink_azuresynapse_net_pdnsz](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone.privatelink_azurewebsites_net_pdnsz](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone.privatelink_blob_core_windows_net_pdnsz](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone.privatelink_cassandra_cosmos_azure_com_pdnsz](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone.privatelink_centralus_backup_windowsazure_com_pdnsz](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone.privatelink_centralus_batch_azure_com_pdnsz](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone.privatelink_cognitiveservices_azure_com_pdnsz](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone.privatelink_database_windows_net_pdnsz](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone.privatelink_datafactory_azure_net_pdnsz](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone.privatelink_dev_azuresynapse_net_pdnsz](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone.privatelink_dfs_core_windows_net_pdnsz](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone.privatelink_digitaltwins_azure_net_pdnsz](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone.privatelink_documents_azure_com_pdnsz](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone.privatelink_eastus_azmk8s_io_pdnsz](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone.privatelink_eastus_backup_windowsazure_com_pdnsz](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone.privatelink_eastus_batch_azure_com_pdnsz](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone.privatelink_eventgrid_azure_net_pdnsz](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone.privatelink_file_core_windows_net_pdnsz](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone.privatelink_gremlin_cosmos_azure_com_pdnsz](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone.privatelink_guestconfiguration_azure_com_pdnsz](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone.privatelink_his_arc_azure_com_pdnsz](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone.privatelink_hypervrecoverymanager_windowsazure_com_pdnsz](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone.privatelink_managedhsm_azure_net_pdnsz](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone.privatelink_mariadb_database_azure_com_pdnsz](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone.privatelink_media_azure_net_pdnsz](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone.privatelink_mongo_cosmos_azure_com_pdnsz](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone.privatelink_monitor_azure_com_pdnsz](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone.privatelink_mysql_database_azure_com_pdnsz](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone.privatelink_notebooks_azure_net_pdnsz](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone.privatelink_ods_opinsights_azure_com_pdnsz](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone.privatelink_oms_opinsights_azure_com_pdnsz](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone.privatelink_postgres_database_azure_com_pdnsz](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone.privatelink_purview_azure_com_pdnsz](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone.privatelink_purviewstudio_azure_com_pdnsz](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone.privatelink_queue_core_windows_net_pdnsz](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone.privatelink_redis_cache_windows_net_pdnsz](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone.privatelink_redisenterprise_cache_azure_net_pdnsz](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone.privatelink_search_windows_net_pdnsz](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone.privatelink_service_signalr_net_pdnsz](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone.privatelink_servicebus_windows_net_pdnsz](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone.privatelink_siterecovery_windowsazure_com_pdnsz](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone.privatelink_sql_azuresynapse_net_pdnsz](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone.privatelink_sqlondemand_azuresynapse_net_pdnsz](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone.privatelink_table_core_windows_net_pdnsz](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone.privatelink_table_cosmos_azure_com_pdnsz](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone.privatelink_vaultcore_azure_net_pdnsz](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone.privatelink_web_core_windows_net_pdnsz](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone.privatelink_westus_batch_azure_com_pdnsz](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone.vmreg_pdnsz](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone_virtual_network_link.privatelink_adf_azure_com_pdnsz_link](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_private_dns_zone_virtual_network_link.privatelink_afs_azure_net_pdnsz_link](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_private_dns_zone_virtual_network_link.privatelink_agentsvc_azure_automation_net_pdnsz_link](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_private_dns_zone_virtual_network_link.privatelink_api_azureml_ms_pdnsz_link](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_private_dns_zone_virtual_network_link.privatelink_azconfig_io_pdnsz_link](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_private_dns_zone_virtual_network_link.privatelink_azure_automation_net_pdnsz_link](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_private_dns_zone_virtual_network_link.privatelink_azure_devices_net_pdnsz_link](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_private_dns_zone_virtual_network_link.privatelink_azurecr_io_pdnsz_link](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_private_dns_zone_virtual_network_link.privatelink_azurehdinsight_net_pdnsz_link](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_private_dns_zone_virtual_network_link.privatelink_azuresynapse_net_pdnsz_link](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_private_dns_zone_virtual_network_link.privatelink_azurewebsites_net_pdnsz_link](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_private_dns_zone_virtual_network_link.privatelink_blob_core_windows_net_pdnsz_link](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_private_dns_zone_virtual_network_link.privatelink_cassandra_cosmos_azure_com_pdnsz_link](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_private_dns_zone_virtual_network_link.privatelink_centralus_backup_windowsazure_com_pdnsz_link](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_private_dns_zone_virtual_network_link.privatelink_centralus_batch_azure_com_pdnsz_link](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_private_dns_zone_virtual_network_link.privatelink_cognitiveservices_azure_com_pdnsz_link](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_private_dns_zone_virtual_network_link.privatelink_database_windows_net_pdnsz_link](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_private_dns_zone_virtual_network_link.privatelink_datafactory_azure_net_pdnsz_link](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_private_dns_zone_virtual_network_link.privatelink_dev_azuresynapse_net_pdnsz_link](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_private_dns_zone_virtual_network_link.privatelink_dfs_core_windows_net_pdnsz_link](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_private_dns_zone_virtual_network_link.privatelink_digitaltwins_azure_net_pdnsz_link](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_private_dns_zone_virtual_network_link.privatelink_documents_azure_com_pdnsz_link](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_private_dns_zone_virtual_network_link.privatelink_eastus_azmk8s_io_pdnsz_link](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_private_dns_zone_virtual_network_link.privatelink_eastus_backup_windowsazure_com_pdnsz_link](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_private_dns_zone_virtual_network_link.privatelink_eastus_batch_azure_com_pdnsz_link](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_private_dns_zone_virtual_network_link.privatelink_eventgrid_azure_net_pdnsz_link](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_private_dns_zone_virtual_network_link.privatelink_file_core_windows_net_pdnsz_link](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_private_dns_zone_virtual_network_link.privatelink_gremlin_cosmos_azure_com_pdnsz_link](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_private_dns_zone_virtual_network_link.privatelink_guestconfiguration_azure_com_pdnsz_link](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_private_dns_zone_virtual_network_link.privatelink_his_arc_azure_com_pdnsz_link](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_private_dns_zone_virtual_network_link.privatelink_hypervrecoverymanager_windowsazure_com_pdnsz_link](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_private_dns_zone_virtual_network_link.privatelink_managedhsm_azure_net_pdnsz_link](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_private_dns_zone_virtual_network_link.privatelink_mariadb_database_azure_com_pdnsz_link](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_private_dns_zone_virtual_network_link.privatelink_media_azure_net_pdnsz_link](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_private_dns_zone_virtual_network_link.privatelink_mongo_cosmos_azure_com_pdnsz_link](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_private_dns_zone_virtual_network_link.privatelink_monitor_azure_com_pdnsz_link](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_private_dns_zone_virtual_network_link.privatelink_mysql_database_azure_com_pdnsz_link](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_private_dns_zone_virtual_network_link.privatelink_notebooks_azure_net_pdnsz_link](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_private_dns_zone_virtual_network_link.privatelink_ods_opinsights_azure_com_pdnsz_link](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_private_dns_zone_virtual_network_link.privatelink_oms_opinsights_azure_com_pdnsz_link](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_private_dns_zone_virtual_network_link.privatelink_postgres_database_azure_com_pdnsz_link](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_private_dns_zone_virtual_network_link.privatelink_purview_azure_com_pdnsz_link](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_private_dns_zone_virtual_network_link.privatelink_purviewstudio_azure_com_pdnsz_link](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_private_dns_zone_virtual_network_link.privatelink_queue_core_windows_net_pdnsz_link](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_private_dns_zone_virtual_network_link.privatelink_redis_cache_windows_net_pdnsz_link](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_private_dns_zone_virtual_network_link.privatelink_redisenterprise_cache_azure_net_pdnsz_link](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_private_dns_zone_virtual_network_link.privatelink_search_windows_net_pdnsz_link](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_private_dns_zone_virtual_network_link.privatelink_service_signalr_net_pdnsz_link](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_private_dns_zone_virtual_network_link.privatelink_servicebus_windows_net_pdnsz_link](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_private_dns_zone_virtual_network_link.privatelink_siterecovery_windowsazure_com_pdnsz_link](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_private_dns_zone_virtual_network_link.privatelink_sql_azuresynapse_net_pdnsz_link](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_private_dns_zone_virtual_network_link.privatelink_sqlondemand_azuresynapse_net_pdnsz_link](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_private_dns_zone_virtual_network_link.privatelink_table_core_windows_net_pdnsz_link](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_private_dns_zone_virtual_network_link.privatelink_table_cosmos_azure_com_pdnsz_link](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_private_dns_zone_virtual_network_link.privatelink_vaultcore_azure_net_pdnsz_link](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_private_dns_zone_virtual_network_link.privatelink_web_core_windows_net_pdnsz_link](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_private_dns_zone_virtual_network_link.privatelink_westus_batch_azure_com_pdnsz_link](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_private_dns_zone_virtual_network_link.vmreg_pdnsz_link](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_public_ip.afw_pip](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip) | resource |
| [azurerm_public_ip.vpng_pip](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip) | resource |
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_subnet.afw_snet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_subnet.dns_snet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_subnet.mgmt_snet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_subnet.vpng_snet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_subnet_network_security_group_association.dns_snet_nsg_assoc](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_network_security_group_association) | resource |
| [azurerm_subnet_network_security_group_association.mgmt_snet_nsg_assoc](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_network_security_group_association) | resource |
| [azurerm_virtual_machine_extension.dns_vm_001_config_unbound_dns_customscript_vmext](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_machine_extension) | resource |
| [azurerm_virtual_network.vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |
| [azurerm_virtual_network_dns_servers.vnet_dns_servers](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_dns_servers) | resource |
| [azurerm_virtual_network_gateway.vpng](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_gateway) | resource |
| [azurerm_virtual_network_gateway_connection.hub_to_onprem](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_gateway_connection) | resource |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_dns_vm_001"></a> [dns\_vm\_001](#module\_dns\_vm\_001) | ../virtual-machine-linux | n/a |
| <a name="module_mgmt_vm"></a> [mgmt\_vm](#module\_mgmt\_vm) | ../virtual-machine-linux | n/a |
