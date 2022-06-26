

## Overview
Windows virtual machine module.

Simplifies creating a Windows virtual machine by requiring only several input parameters: ```resource_group_name```, ```snet_id``` (subnet id), and ```admin_password```.  Default VM image is Windows Server. An alternate can be specified via ```urn``` and ```plan```.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_random"></a> [random](#provider\_random) | n/a |
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >= 3.0.0, < 4.0.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Name of the resource group in which to create the virtual machine. | `string` | n/a | yes |
| <a name="input_snet_id"></a> [snet\_id](#input\_snet\_id) | Resource ID of subnet to which virtual machine will be attached. | `string` | n/a | yes |
| <a name="input_admin_password"></a> [admin\_password](#input\_admin\_password) | Admin password for the virtual machine. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Virtual machine name. Defaults to random pet if not specified. | `string` | `null` | no |
| <a name="input_location"></a> [location](#input\_location) | The Azure location where the Windows Virtual Machine should exist. | `string` | `"eastus"` | no |
| <a name="input_urn"></a> [urn](#input\_urn) | Virtual machine URN. | `string` | `"MicrosoftWindowsServer:WindowsServer:2019-Datacenter-smalldisk:latest"` | no |
| <a name="input_plan"></a> [plan](#input\_plan) | Virtual machine plan (publisher:product:plan). | `string` | `null` | no |
| <a name="input_size"></a> [size](#input\_size) | Virtual machine size. | `string` | `"Standard_DS1_v2"` | no |
| <a name="input_priority"></a> [priority](#input\_priority) | Virtual machine priority. Possible values are Regular and Spot. | `string` | `"Regular"` | no |
| <a name="input_os_disk_size_gb"></a> [os\_disk\_size\_gb](#input\_os\_disk\_size\_gb) | Virtual machine OS disk size in GB. | `number` | `30` | no |
| <a name="input_os_disk_storage_account_type"></a> [os\_disk\_storage\_account\_type](#input\_os\_disk\_storage\_account\_type) | Storage account type for virtual machine OS disk. | `string` | `"Standard_LRS"` | no |
| <a name="input_os_disk_caching"></a> [os\_disk\_caching](#input\_os\_disk\_caching) | Caching type for virtual machine OS disk. | `string` | `"ReadWrite"` | no |
| <a name="input_admin_username"></a> [admin\_username](#input\_admin\_username) | Admin username for the virtual machine. | `string` | `"azadmin"` | no |
| <a name="input_enable_public_ip"></a> [enable\_public\_ip](#input\_enable\_public\_ip) | Enable public IP address on virtual machine network interface. | `bool` | `false` | no |
| <a name="input_public_ip_allocation_method"></a> [public\_ip\_allocation\_method](#input\_public\_ip\_allocation\_method) | IP address allocation method for the virtual machine. | `string` | `"Static"` | no |
| <a name="input_private_ip_address"></a> [private\_ip\_address](#input\_private\_ip\_address) | Static private IP address for virtual machine. | `string` | `null` | no |
| <a name="input_enable_ip_forwarding"></a> [enable\_ip\_forwarding](#input\_enable\_ip\_forwarding) | Enable IP forwarding on virtual machine. Required when VM is acting as a router. | `bool` | `false` | no |
| <a name="input_timezone"></a> [timezone](#input\_timezone) | Time zone for the virtual machine. | `string` | `"Eastern Standard Time"` | no |
| <a name="input_shutdown_enabled"></a> [shutdown\_enabled](#input\_shutdown\_enabled) | Enable auto-shutdown for virtual machine. | `bool` | `true` | no |
| <a name="input_shutdown_daily_recurrence_time"></a> [shutdown\_daily\_recurrence\_time](#input\_shutdown\_daily\_recurrence\_time) | Daily auto-shutdown time for virtual machine. | `string` | `"0300"` | no |
| <a name="input_shutdown_timezone"></a> [shutdown\_timezone](#input\_shutdown\_timezone) | Daily auto-shutdown timezone for virtual machine. | `string` | `"Eastern Standard Time"` | no |
| <a name="input_shutdown_notification_enabled"></a> [shutdown\_notification\_enabled](#input\_shutdown\_notification\_enabled) | Whether to enable pre-shutdown notifications for virtual machine. | `bool` | `false` | no |
| <a name="input_shutdown_notification_email"></a> [shutdown\_notification\_email](#input\_shutdown\_notification\_email) | E-mail address for virtual machine shutdown notifications. | `string` | `null` | no |
| <a name="input_shutdown_notification_time_in_minutes"></a> [shutdown\_notification\_time\_in\_minutes](#input\_shutdown\_notification\_time\_in\_minutes) | Time in minutes between 15 and 120 before a virtual machine shutdown event at which a notification will be sent. | `number` | `30` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_vm_id"></a> [vm\_id](#output\_vm\_id) | Virtual machine resource ID. |
| <a name="output_private_ip_address"></a> [private\_ip\_address](#output\_private\_ip\_address) | Virtual machine private IP address. |
| <a name="output_public_ip_address"></a> [public\_ip\_address](#output\_public\_ip\_address) | Virtual machine public IP address. |
