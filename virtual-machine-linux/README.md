

## Overview
Linux virtual machine module.

Simplifies creating a Linux virtual machine by requiring only two parameters: resource group and subnet id.  Module expects admin user's Public SSH key to be in ```~/.ssh/id_rsa.pub``` or a specified via ```admin_ssh_public_key_path```.  Alternatively,  ```disable_password_authentication``` can be set to ```false``` and ```admin_password``` to the desired admin password.  Default VM image is a Red Hat one, or an alternate one can be specified via ```urn``` and if needed, ```plan``` .

## Providers

| Name | Version |
|------|---------|
| <a name="provider_random"></a> [random](#provider\_random) | n/a |
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~>3.0.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Name of the resource group in which to create the virtual machine. | `string` | n/a | yes |
| <a name="input_snet_id"></a> [snet\_id](#input\_snet\_id) | Name of subnet to which virtual machine will be attached. | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Azure location in which to create the virtual machine. | `string` | `"eastus"` | no |
| <a name="input_name"></a> [name](#input\_name) | Virtual machine name. | `string` | `null` | no |
| <a name="input_urn"></a> [urn](#input\_urn) | Virtual machine URN (offer:publisher:sku:version). | `string` | `"RedHat:RHEL:8_6:latest"` | no |
| <a name="input_plan"></a> [plan](#input\_plan) | Virtual machine plan (publisher:product:plan). | `string` | `null` | no |
| <a name="input_size"></a> [size](#input\_size) | Virtual machine size. | `string` | `"Standard_B1s"` | no |
| <a name="input_priority"></a> [priority](#input\_priority) | Virtual machine priority. Possible values are Regular and Spot. | `string` | `"Regular"` | no |
| <a name="input_eviction_policy"></a> [eviction\_policy](#input\_eviction\_policy) | Virtual Machine eviction policy.  Specifies what happens when a Spot instance is evicted. | `string` | `null` | no |
| <a name="input_os_disk_size_gb"></a> [os\_disk\_size\_gb](#input\_os\_disk\_size\_gb) | Virtual machine OS disk size in GB. | `number` | `64` | no |
| <a name="input_os_disk_storage_account_type"></a> [os\_disk\_storage\_account\_type](#input\_os\_disk\_storage\_account\_type) | Storage account type for virtual machine OS disk. | `string` | `"Standard_LRS"` | no |
| <a name="input_os_disk_caching"></a> [os\_disk\_caching](#input\_os\_disk\_caching) | Caching type for virtual machine OS disk. | `string` | `"ReadWrite"` | no |
| <a name="input_admin_username"></a> [admin\_username](#input\_admin\_username) | Admin username for the virtual machine. | `string` | `"azadmin"` | no |
| <a name="input_admin_password"></a> [admin\_password](#input\_admin\_password) | Admin password for the virtual machine.  Required if admin\_ssh\_public\_key\_path is null. | `string` | `null` | no |
| <a name="input_admin_ssh_public_key_path"></a> [admin\_ssh\_public\_key\_path](#input\_admin\_ssh\_public\_key\_path) | Admin user public SSH key path for the virtual machine. | `string` | `"~/.ssh/id_rsa.pub"` | no |
| <a name="input_disable_password_authentication"></a> [disable\_password\_authentication](#input\_disable\_password\_authentication) | Disable password authentication.  If admin\_ssh\_public\_key\_path is not specified, must be set to falsae and admin\_password must be set. | `string` | `true` | no |
| <a name="input_enable_public_ip"></a> [enable\_public\_ip](#input\_enable\_public\_ip) | Enable public IP address on virtual machine network interface. | `bool` | `true` | no |
| <a name="input_public_ip_allocation_method"></a> [public\_ip\_allocation\_method](#input\_public\_ip\_allocation\_method) | Public IP address allocation method for the virtual machine. | `string` | `"Static"` | no |
| <a name="input_private_ip_address"></a> [private\_ip\_address](#input\_private\_ip\_address) | Static private IP address for virtual machine. | `string` | `null` | no |
| <a name="input_enable_ip_forwarding"></a> [enable\_ip\_forwarding](#input\_enable\_ip\_forwarding) | Enable IP forwarding on virtual machine. | `bool` | `false` | no |
| <a name="input_dns_servers"></a> [dns\_servers](#input\_dns\_servers) | DNS servers set on virtual machine primary network interface. | `list(string)` | `null` | no |
| <a name="input_timezone"></a> [timezone](#input\_timezone) | Time zone for the virtual machine. | `string` | `"Eastern Standard Time"` | no |
| <a name="input_custom_data"></a> [custom\_data](#input\_custom\_data) | Custom data for the virtual machine such as a cloud-init script. | `string` | `null` | no |
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
