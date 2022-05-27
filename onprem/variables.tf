# General variables
variable resource_prefix {
  type        = string
  description = "Prefix for resources in the resource group."
  default     = "onprem"
}

variable resource_group_name {
  type        = string
  description = "Name of the resource group in which to create the resources."
  default     = null
}

variable location {
  type        = string
  description = "Azure location where the resources exists."
  default     = "eastus"
}

# Virtual network (vNet)
variable vnet_name {
  type        = string
  description = "Name of the virtual network to which resources will be attached."
  default     = null
}

variable vnet_address_space {
  type        = list(string)
  description = "Address space of the virtual network to which resources will be attached."
  default     = [ "172.16.0.0/16" ]
}

# Subnet: Windows RAS
variable winra_snet_name {
  type        = string
  description = "Windows Remote Access Services (RAS) subnet name."
  default     = null
}

variable winra_snet_address_prefixes {
  type        = list(string)
  description = "Windows Remote Access Services (RAS) subnet address prefixes."
  default     = [ "172.16.0.0/24" ]
}

variable winra_snet_nsg_name {
  type        = string
  description = "Windows Remote Access Services (RAS) subnet network security group name."
  default     = null
}

variable winra_snet_allow_ip_list {
  type        = string
  description = "Group of IP's to allow inbound access to the Windows Remote Access Services (RAS) subnet."
  default     = "auto"
}

# Subnet: DNS
variable dns_snet_name {
  type        = string
  description = "DNS subnet name."
  default     = null
}

variable dns_snet_address_prefixes {
  type        = list(string)
  description = "DNS subnet address prefixes."
  default     = [ "172.16.254.0/24" ]
}

variable dns_snet_nsg_name {
  type        = string
  description = "DNS subnet network security group name."
  default     = null
}

variable dns_snet_allow_ip_list {
  type        = string
  description = "Group of IP's to allow inbound access to the DNS subnet."
  default     = "auto"
}

# Subnet: Management
variable mgmt_snet_name {
  type        = string
  description = "Management subnet name."
  default     = null
}

variable mgmt_snet_address_prefixes {
  type        = list(string)
  description = "Management subnet address prefixes."
  default     = [ "172.16.255.0/24" ]
}

variable mgmt_snet_nsg_name {
  type        = string
  description = "Management subnet Network security group name."
  default     = null
}

variable mgmt_snet_allow_ip_list {
  type        = string
  description = "Group of IP's to allow inbound access to the management subnet.  Typically, this would be an on-premises NAT gateway or router."
  default     = "auto"
}

# Virtual machine: Management
variable mgmt_vm_name {
  type        = string
  description = "Name of management virtual machine name."
  default     = null
}

variable mgmt_vm_urn {
  type        = string
  description = "URN for management virtual machine."
  default     = null
}

variable mgmt_vm_plan_publisher {
  type        = string
  description = "Plan publisher for management virtual machine."
  default     = null
}

variable mgmt_vm_plan_product {
  type        = string
  description = "Plan product for management virtual machine."
  default     = null
}

variable mgmt_vm_plan_name {
  type        = string
  description = "Plan name for management virtual machine."
  default     = null
}

variable mgmt_vm_size {
  type        = string
  description = "Size of management virtual machine."
  default     = "Standard_B1s"
}

variable mgmt_vm_private_ip_address {
  type        = string
  description = "Private IP address for management virtual machine."
  default     = "172.16.255.4"
}

variable mgmt_vm_enable_public_ip {
  type        = string
  description = "Enable public IP address for management virtual machine."
  default     = true
}

variable mgmt_vm_admin_username {
  type        = string
  description = "Admin username for the management virtual machine."
  default     = null
}

variable mgmt_vm_admin_password {
  type        = string
  description = "Admin password for the management virtual machine."
  default     = null
}

variable mgmt_vm_admin_public_ssh_key_path {
  type        = string
  description = "Admin user public SSH key path for the management virtual machine."
  default     = null
}

# Virtual Machine: Windows Remote Access (RAS)
variable winra_vm_name {
  type        = string
  description = "Name of the Windows Remote Access Services virtual machine."
  default     = null
}

variable winra_vm_urn {
  type        = string
  description = "URN for Windows Remote Access Services virtual machine."
  default     = null
}

variable winra_vm_plan_publisher {
  type        = string
  description = "Plan publisher for Windows Remote Access Services virtual machine."
  default     = null
}

variable winra_vm_plan_product {
  type        = string
  description = "Plan product for Windows Remote Access Services virtual machine."
  default     = null
}

variable winra_vm_plan_name {
  type        = string
  description = "Plan name for Windows Remote Access Services virtual machine."
  default     = null
}

variable winra_vm_size {
  type        = string
  description = "Size of Windows Remote Access Services virtual machine."
  default     = "Standard_DS1_v2"
}

variable winra_vm_private_ip_address {
  type        = string
  description = "Private IP address for the Windows Remote Acess Services virtual machine."
  default     = "172.16.0.4"
}

variable winra_vm_enable_public_ip {
  type        = string
  description = "Enable public IP address on Windows Remote Access Services virtual machine."
  default     = true
}

variable winra_vm_enable_ip_forwarding {
  type        = string
  description = "Enable IP forwarding on the Windows Remote Access Services virtual machine to permit routing traffic to other IP's on the virtual network."
  default     = true
}

variable winra_vm_admin_username {
  type        = string
  description = "Admin username for the Windows Remote Access Services virtual machine."
  default     = null
}

variable winra_vm_admin_password {
  type        = string
  description = "Admin password or the Windows Remote Access Services virtual machine."
  default     = null
}

# Virtual machine: DNS 001
variable dns_vm_001_name {
  type        = string
  description = "Name of the Windows Remote Access Services virtual machine."
  default     = null
}

variable dns_vm_001_urn {
  type        = string
  description = "URN for DNS virtual machine."
  default     = null
}

variable dns_vm_001_plan_publisher {
  type        = string
  description = "Plan publisher for DNS virtual machine."
  default     = null
}

variable dns_vm_001_plan_product {
  type        = string
  description = "Plan product for DNS virtual machine."
  default     = null
}

variable dns_vm_001_plan_name {
  type        = string
  description = "Plan name for DNS virtual machine."
  default     = null
}

variable dns_vm_001_size {
  type        = string
  description = "Size of DNS virtual machine."
  default     = "Standard_B1s"
}

variable dns_vm_001_private_ip_address {
  type        = string
  description = "Private IP address for DNS virtual machine."
  default     = "172.16.254.4"
}

variable dns_vm_001_enable_public_ip {
  type        = string
  description = "Enable public IP address for DNS virtual machine."
  default     = true
}

variable dns_vm_001_admin_username {
  type        = string
  description = "Admin username for DNS virtual machine."
  default     = null
}

variable dns_vm_001_admin_password {
  type        = string
  description = "Admin password for DNS virtual machine."
  default     = null
}

variable dns_vm_001_admin_public_ssh_key_path {
  type        = string
  description = "Admin user public SSH key path for DNS virtual machine."
  default     = null
}

# Route table
variable route_table_name {
  type        = string
  description = "Route table name."
  default     = null
}

# Local gateway
variable local_gateway_name {
  type        = string
  description = "Local gateway name."
  default     = null
}

variable remote_vnet_address_space {
  type        = string
  description = "Address space of remote vnet connected via S2S VPN."
  default     = "10.0.0.0/8"
}
