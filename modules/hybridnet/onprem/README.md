

## Overview
On-premises network simulator module.

- Intended to integrate with  [hub](../hub/README.md) and [s2svpn-winra-vpng](../s2svpn-winra-vpng/README.md) modules.
- Creates and deploys its resources to the resource group ```onprem-rg```.
- Top-level [README](../README.md) explains the resources in detail and how they fit into a [larger architecture](../images/hub-spoke.png).
- ```winra_vm_admin_password``` is the only required input parameter.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_http"></a> [http](#provider\_http) | n/a |
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >= 3.0.0, < 4.0.0 |

## Inputs

| Name | Description | Default |
|------|-------------|---------|
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Name of the resource group in which to create the resources. | `"onprem-rg"` |
| <a name="input_location"></a> [location](#input\_location) | Azure location where the resources exists. | `"eastus"` |
| <a name="input_vnet_name"></a> [vnet\_name](#input\_vnet\_name) | Name of the virtual network to which resources will be attached. | `"onprem-vnet"` |
| <a name="input_vnet_address_space"></a> [vnet\_address\_space](#input\_vnet\_address\_space) | Address space of the virtual network to which resources will be attached. | <pre>[<br>  "172.16.0.0/16"<br>]</pre> |
| <a name="input_winra_snet_name"></a> [winra\_snet\_name](#input\_winra\_snet\_name) | Windows Remote Access Services (RAS) subnet name. | `"onprem-winra-snet"` |
| <a name="input_winra_snet_address_prefixes"></a> [winra\_snet\_address\_prefixes](#input\_winra\_snet\_address\_prefixes) | Windows Remote Access Services (RAS) subnet address prefixes. | <pre>[<br>  "172.16.0.0/24"<br>]</pre> |
| <a name="input_winra_snet_nsg_name"></a> [winra\_snet\_nsg\_name](#input\_winra\_snet\_nsg\_name) | Windows Remote Access Services (RAS) subnet network security group name. | `"onprem-winra-snet-nsg"` |
| <a name="input_winra_snet_allow_ip_list"></a> [winra\_snet\_allow\_ip\_list](#input\_winra\_snet\_allow\_ip\_list) | Group of IP's to allow inbound access to the Windows Remote Access Services (RAS) subnet. Default of 'clientip' sets allow list to client IP. | `"clientip"` |
| <a name="input_dns_snet_name"></a> [dns\_snet\_name](#input\_dns\_snet\_name) | DNS subnet name. | `"onprem-dns-snet"` |
| <a name="input_dns_snet_address_prefixes"></a> [dns\_snet\_address\_prefixes](#input\_dns\_snet\_address\_prefixes) | DNS subnet address prefixes. | <pre>[<br>  "172.16.254.0/24"<br>]</pre> |
| <a name="input_dns_snet_nsg_name"></a> [dns\_snet\_nsg\_name](#input\_dns\_snet\_nsg\_name) | DNS subnet network security group name. | `"onprem-dns-snet-nsg"` |
| <a name="input_dns_snet_allow_ip_list"></a> [dns\_snet\_allow\_ip\_list](#input\_dns\_snet\_allow\_ip\_list) | Group of IP's to allow inbound access to the DNS subnet. Default of 'clientip' sets allow list to client IP. | `"clientip"` |
| <a name="input_mgmt_snet_name"></a> [mgmt\_snet\_name](#input\_mgmt\_snet\_name) | Management subnet name. | `"onprem-mgmt-snet"` |
| <a name="input_mgmt_snet_address_prefixes"></a> [mgmt\_snet\_address\_prefixes](#input\_mgmt\_snet\_address\_prefixes) | Management subnet address prefixes. | <pre>[<br>  "172.16.255.0/24"<br>]</pre> |
| <a name="input_mgmt_snet_nsg_name"></a> [mgmt\_snet\_nsg\_name](#input\_mgmt\_snet\_nsg\_name) | Management subnet Network security group name. | `"onprem-mgmt-snet-nsg"` |
| <a name="input_mgmt_snet_allow_ip_list"></a> [mgmt\_snet\_allow\_ip\_list](#input\_mgmt\_snet\_allow\_ip\_list) | Group of IP's to allow inbound access to the management subnet.  Typically, this would be an on-premises NAT gateway or router. Default of 'clientip' sets allow list to client IP. | `"clientip"` |
| <a name="input_mgmt_vm_name"></a> [mgmt\_vm\_name](#input\_mgmt\_vm\_name) | Name of management virtual machine name. | `"onprem-mgmt-vm"` |
| <a name="input_mgmt_vm_urn"></a> [mgmt\_vm\_urn](#input\_mgmt\_vm\_urn) | URN for management virtual machine. | `"RedHat:RHEL:8_6:latest"` |
| <a name="input_mgmt_vm_plan"></a> [mgmt\_vm\_plan](#input\_mgmt\_vm\_plan) | Plan for management virtual machine. | `null` |
| <a name="input_mgmt_vm_size"></a> [mgmt\_vm\_size](#input\_mgmt\_vm\_size) | Size of management virtual machine. | `"Standard_B1s"` |
| <a name="input_mgmt_vm_private_ip_address"></a> [mgmt\_vm\_private\_ip\_address](#input\_mgmt\_vm\_private\_ip\_address) | Private IP address for management virtual machine. | `"172.16.255.4"` |
| <a name="input_mgmt_vm_enable_public_ip"></a> [mgmt\_vm\_enable\_public\_ip](#input\_mgmt\_vm\_enable\_public\_ip) | Enable public IP address for management virtual machine. | `true` |
| <a name="input_mgmt_vm_admin_username"></a> [mgmt\_vm\_admin\_username](#input\_mgmt\_vm\_admin\_username) | Admin username for the management virtual machine. | `"azadmin"` |
| <a name="input_mgmt_vm_admin_password"></a> [mgmt\_vm\_admin\_password](#input\_mgmt\_vm\_admin\_password) | Admin password for the management virtual machine. | `null` |
| <a name="input_mgmt_vm_admin_public_ssh_key_path"></a> [mgmt\_vm\_admin\_public\_ssh\_key\_path](#input\_mgmt\_vm\_admin\_public\_ssh\_key\_path) | Admin user public SSH key path for the management virtual machine. | `"~/.ssh/id_rsa.pub"` |
| <a name="input_winra_vm_name"></a> [winra\_vm\_name](#input\_winra\_vm\_name) | Name of the Windows Remote Access Services virtual machine. | `"onprem-winra-vm"` |
| <a name="input_winra_vm_urn"></a> [winra\_vm\_urn](#input\_winra\_vm\_urn) | URN for Windows Remote Access Services virtual machine. | `"MicrosoftWindowsServer:WindowsServer:2019-Datacenter-smalldisk:latest"` |
| <a name="input_winra_vm_plan"></a> [winra\_vm\_plan](#input\_winra\_vm\_plan) | Plan for Windows Remote Access Services virtual machine. | `null` |
| <a name="input_winra_vm_size"></a> [winra\_vm\_size](#input\_winra\_vm\_size) | Size of Windows Remote Access Services virtual machine. | `"Standard_DS1_v2"` |
| <a name="input_winra_vm_private_ip_address"></a> [winra\_vm\_private\_ip\_address](#input\_winra\_vm\_private\_ip\_address) | Private IP address for the Windows Remote Acess Services virtual machine. | `"172.16.0.4"` |
| <a name="input_winra_vm_enable_public_ip"></a> [winra\_vm\_enable\_public\_ip](#input\_winra\_vm\_enable\_public\_ip) | Enable public IP address on Windows Remote Access Services virtual machine. | `true` |
| <a name="input_winra_vm_enable_ip_forwarding"></a> [winra\_vm\_enable\_ip\_forwarding](#input\_winra\_vm\_enable\_ip\_forwarding) | Enable IP forwarding on the Windows Remote Access Services virtual machine to permit routing traffic to other IP's on the virtual network. | `true` |
| <a name="input_winra_vm_admin_username"></a> [winra\_vm\_admin\_username](#input\_winra\_vm\_admin\_username) | Admin username for the Windows Remote Access Services virtual machine. | `"azadmin"` |
| <a name="input_winra_vm_admin_password"></a> [winra\_vm\_admin\_password](#input\_winra\_vm\_admin\_password) | (Required) Admin password or the Windows Remote Access Services virtual machine. | n/a |
| <a name="input_dns_vm_001_name"></a> [dns\_vm\_001\_name](#input\_dns\_vm\_001\_name) | Name of the Windows Remote Access Services virtual machine. | `"onprem-dns-vm-001"` |
| <a name="input_dns_vm_001_urn"></a> [dns\_vm\_001\_urn](#input\_dns\_vm\_001\_urn) | URN for DNS virtual machine. | `"RedHat:RHEL:8_6:latest"` |
| <a name="input_dns_vm_001_plan"></a> [dns\_vm\_001\_plan](#input\_dns\_vm\_001\_plan) | Plan for DNS virutal machine. | `null` |
| <a name="input_dns_vm_001_size"></a> [dns\_vm\_001\_size](#input\_dns\_vm\_001\_size) | Size of DNS virtual machine. | `"Standard_B1s"` |
| <a name="input_dns_vm_001_private_ip_address"></a> [dns\_vm\_001\_private\_ip\_address](#input\_dns\_vm\_001\_private\_ip\_address) | Private IP address for DNS virtual machine. | `"172.16.254.4"` |
| <a name="input_dns_vm_001_enable_public_ip"></a> [dns\_vm\_001\_enable\_public\_ip](#input\_dns\_vm\_001\_enable\_public\_ip) | Enable public IP address for DNS virtual machine. | `true` |
| <a name="input_dns_vm_001_admin_username"></a> [dns\_vm\_001\_admin\_username](#input\_dns\_vm\_001\_admin\_username) | Admin username for DNS virtual machine. | `"azadmin"` |
| <a name="input_dns_vm_001_admin_password"></a> [dns\_vm\_001\_admin\_password](#input\_dns\_vm\_001\_admin\_password) | Admin password for DNS virtual machine. | `null` |
| <a name="input_dns_vm_001_admin_public_ssh_key_path"></a> [dns\_vm\_001\_admin\_public\_ssh\_key\_path](#input\_dns\_vm\_001\_admin\_public\_ssh\_key\_path) | Admin user public SSH key path for DNS virtual machine. | `"~/.ssh/id_rsa.pub"` |
| <a name="input_route_table_name"></a> [route\_table\_name](#input\_route\_table\_name) | Route table name. | `"onprem-to-hub-rt"` |
| <a name="input_local_gateway_name"></a> [local\_gateway\_name](#input\_local\_gateway\_name) | Local gateway name. | `"onprem-lgw"` |
| <a name="input_remote_vnet_address_space"></a> [remote\_vnet\_address\_space](#input\_remote\_vnet\_address\_space) | Address space of remote vnet connected via S2S VPN. | `"10.0.0.0/8"` |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_vnet_address_space"></a> [vnet\_address\_space](#output\_vnet\_address\_space) | Virtual network address space. |
| <a name="output_winra_vm_id"></a> [winra\_vm\_id](#output\_winra\_vm\_id) | Resource ID of the Windows Remote Access (RAS) virtual machine. |
| <a name="output_winra_vm_public_ip_address"></a> [winra\_vm\_public\_ip\_address](#output\_winra\_vm\_public\_ip\_address) | Public IP address of the Windows Remote Access (RAS) virtual machine. |

## Resources

| Name | Type |
|------|------|
| [azurerm_network_security_group.dns_snet_nsg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group) | resource |
| [azurerm_network_security_group.mgmt_snet_nsg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group) | resource |
| [azurerm_network_security_group.winra_snet_nsg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group) | resource |
| [azurerm_network_security_rule.dns_snet_allow_inbound_nsg_rule](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_rule) | resource |
| [azurerm_network_security_rule.mgmt_snet_allow_inbound_nsg_rule](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_rule) | resource |
| [azurerm_network_security_rule.winra_snet_allow_inbound_nsg_rule](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_rule) | resource |
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_route_table.onprem_to_hub_rt](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/route_table) | resource |
| [azurerm_subnet.dns_snet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_subnet.mgmt_snet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_subnet.winra_snet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_subnet_network_security_group_association.dns_snet_nsg_assoc](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_network_security_group_association) | resource |
| [azurerm_subnet_network_security_group_association.mgmt_snet_nsg_assoc](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_network_security_group_association) | resource |
| [azurerm_subnet_network_security_group_association.winra_snet_nsg_assoc](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_network_security_group_association) | resource |
| [azurerm_subnet_route_table_association.dns_snet_onprem_to_hub_rt_assoc](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_route_table_association) | resource |
| [azurerm_subnet_route_table_association.mgmt_snet_onprem_to_hub_rt_assoc](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_route_table_association) | resource |
| [azurerm_subnet_route_table_association.winra_snet_onprem_to_hub_rt_assoc](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_route_table_association) | resource |
| [azurerm_virtual_machine_extension.dns_vm_001_config_unbound_dns_customscript_vmext](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_machine_extension) | resource |
| [azurerm_virtual_network.vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |
| [azurerm_virtual_network_dns_servers.vnet_dns_servers](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_dns_servers) | resource |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_dns_vm_001"></a> [dns\_vm\_001](#module\_dns\_vm\_001) | ../../core/virtual-machine-linux | n/a |
| <a name="module_mgmt_vm"></a> [mgmt\_vm](#module\_mgmt\_vm) | ../../core/virtual-machine-linux | n/a |
| <a name="module_winra_vm"></a> [winra\_vm](#module\_winra\_vm) | ../../core/virtual-machine-windows | n/a |
