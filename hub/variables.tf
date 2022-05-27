# General variables
variable resource_prefix {
  type        = string
  description = "Prefix for resources in the hub resource group."
  default     = "hub"
}

variable resource_group_name {
  type        = string
  description = "Resource group name."
  default     = null
}

variable location {
  type        = string
  description = "Region of hub resources."
  default     = "eastus"
}

# Virtual network
variable vnet_name {
  type        = string
  description = "Virtual network name."
  default     = null
}

variable vnet_address_space {
  type        = list(string)
  description = "Virtual network address space."
  default     = [ "10.0.0.0/16" ]
}

# Subnet: Azure Firewall
variable afw_snet_address_prefixes {
  type        = list(string)
  description = "Firewall subnet address prefix."
  default     = [ "10.0.0.0/26" ]
}

# Subnet: VPN gateway
variable vpng_snet_address_prefixes {
  type        = list(string)
  description = "Gateway subnet address prefix."
  default     = [ "10.0.0.64/27" ]
}

# Subnet: Management
variable mgmt_snet_name {
  type        = string
  description = "Management subnet name."
  default     = null
}

variable mgmt_snet_address_prefixes {
  type        = list(string)
  description = "Management subnet address prefix."
   default     = [ "10.0.255.0/24" ]
}

variable mgmt_snet_nsg_name {
  type        = string
  description = "Management subnet network security group name."
  default     = null
}

variable mgmt_snet_allow_ip_list {
  type        = string
  description = "List of IP addresses to allow inbound to the management subnet."
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
  default     = [ "10.0.254.0/24" ]
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

# Azure Firewall
variable afw_enable {
  type        = bool
  description = "Enable Azure firewall."
  default     = false
}

variable afw_name {
  type        = string
  description = "Azure Firewall name."
  default     = null
}

# Virtual network gateway (VPN gateway)
variable vpng_enable {
  type        = bool
  description = "Enable VPN gateway."
  default     = false
}

variable vpng_name {
  type        = string
  description = "VPN Gateway name."
  default     = null
}

variable vpng_shared_key {
  type        = string
  description = "VPN Gateway shared key."
  default     = null
}

variable vpng_connection_onprem_enable {
  type        = bool
  description = "Enable VPN gateway connection to simulated on-premises network."
  default     = false
}

# Local gateway
variable lgw_name {
  type        = string
  description = "Local network gateway name."
  default     = null
}

variable lgw_gateway_address {
  type        = string
  description = "Local network gateway address."
  default     = null
}

variable lgw_address_space {
  type        = list(string)
  description = "Local network gateway address space."
  default     = [ "172.16.0.0/16" ]
}

# On-prem virtual network connectivity
variable onprem_vnet_resource_group_name {
  type        = string
  description = "Resource group containing on-prem simulator virtual network."
  default     = null
}

variable onprem_vnet_name {
  type        = string
  description = "On-prem simulator virtual network name."
  default     = null
}

variable onprem_vnet_id {
  type        = string
  description = "On-prem simulator virtual network ID."
  default     = null
}

# Virtual machine: Management
variable mgmt_vm_name {
  type        = string
  description = "Name of management virtual machine."
  default     = null
}

variable mgmt_vm_urn {
  type        = string
  description = "URN for management virtual machine"
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
  default     = "10.0.255.4"
}

variable mgmt_vm_enable_public_ip {
  type        = string
  description = "Enable public IP address for management virtual machine."
  default     = true
}

variable mgmt_vm_admin_username {
  type        = string
  description = "Admin username for management virtual machine."
  default     = null
}

variable mgmt_vm_admin_password {
  type        = string
  description = "Admin password for management virtual machine."
  default     = null
}

variable mgmt_vm_admin_public_ssh_key_path {
  type        = string
  description = "Admin user public SSH key path for management virtual machine."
  default     = null
}

# Virtual machine: DNS 001
variable dns_vm_001_name {
  type        = string
  description = "Name of the DNS virtual machine."
  default     = null
}

variable dns_vm_001_urn {
  type        = string
  description = "URN for the DNS virtual machine."
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
  description = "Private IP address for the DNS virtual machine."
  default     = "10.0.254.4"
}

variable dns_vm_001_enable_public_ip {
  type        = string
  description = "Enable public IP address for the DNS virtual machine."
  default     = false
}

variable dns_vm_001_admin_username {
  type        = string
  description = "Admin username for the DNS virtual machine."
  default     = "azadmin"
}

variable dns_vm_001_admin_password {
  type        = string
  description = "Admin password or the DNS virtual machine."
  default     = null
}

variable dns_vm_001_admin_public_ssh_key_path {
  type        = string
  description = "Admin user public SSH key path for the DNS virtual machine."
  default     = null
}
