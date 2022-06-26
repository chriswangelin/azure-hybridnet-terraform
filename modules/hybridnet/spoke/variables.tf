# Resource group
variable spoke_name {
  type        = string
  description = "Spoke name. Naming prefix for resources in the resource group. Defaults to spoke<vnet_spoke_number> if not specified."
  default     = null
}

variable resource_group_name {
  type        = string
  description = "Resource group name. Defaults to spoke<vnet_spoke_number>-rg if not specified."
  default     = null
}

variable location {
  type        = string
  description = "Location for all resources in the resource group."
  default     = "eastus"
}

# Virtual Network
variable vnet_name {
  type        = string
  description = "Virtual network name. Defaults to spoke<vnet_spoke_number>-vnet if not specified."
  default     = null
}

variable vnet_address_space {
  type        = list(string)
  description = "Virtual network address space."
  default     = null
}

variable vnet_dns_servers {
  type        = list(string)
  description = "Virtual network DNS servers."
  default     = [ "10.0.254.4" ]
}

variable vnet_spoke_number {
  type        = string
  description = "Sets virtual network address space to 10.{vnet_spoke_number}.0.0/24 when vnet_address_space variable is not set."
  default     = null
}

variable vnet_peering_use_remote_gateways {
  type        = bool
  default     = true
}

# Subnet: App
variable app_snet_name {
  type        = string
  description = "Application subnet name. Defaults to spoke<spoke_vnet_number>-app-snet when not specified."
  default     = null
}

variable app_snet_address_prefixes {
  type        = list(string)
  description = "Appplication subnet address prefix."
  default     = null
}

variable app_snet_allow_ip_list {
  type        = string
  description = "List of IP addresses to allow inbound to the application subnet."
  default     = null
}

# Subnet: Management
variable mgmt_snet_name {
  type        = string
  description = "Management subnet name. Defaults to spoke<spoke_vnet_number>-mgmt-snet when not spcified."
  default     = null
}

variable mgmt_snet_address_prefixes {
  type        = list(string)
  description = "Subnet address prefix"
  default     = null
}

variable mgmt_snet_allow_ip_list {
  type        = string
  description = "Group of IP's to allow inbound access to the management subnet.  Typically, this would be an on-premises NAT gateway or router. Default of 'clientip' sets allow list to client IP."
  default     = "clientip"
}

# Virtual Machine: Management
variable mgmt_vm_name {
  type        = string
  description = "Management virtual machine name. Defaults to spoke<spoke_vnet_number>-mgmt-vm when not specified."
  default     = null
}

variable mgmt_vm_urn {
  type        = string
  description = "URN for management virtual machine."
  default     = "OpenLogic:CentOS:7_9:7.9.2022020700"
}

variable mgmt_vm_plan {
  type        = string
  description = "Plan for management virtual machine."
  default     = null
}

variable mgmt_vm_size {
  type        = string
  description = "Size of management virtual machine."
  default     = "Standard_B1s"
}

variable mgmt_vm_admin_username {
  type        = string
  description = "Management virtual machine admin username."
  default     = "azadmin"
}

variable mgmt_vm_enable_public_ip {
  type        = bool
  description = "Enable public IP address on the management VM."
  default     = true
}

variable hub_resource_group_name {
  type        = string
  description = "Name of the resource group containing the hub network."
  default     = "hub-rg"
}

# Hub for peering
variable hub_vnet_name {
  type        = string
  description = "Name of hub virtual network to peer with the spoke."
  default     = "hub-vnet"
}

variable hub_vnet_id {
  type        = string
  description = "ID of hub virtual network to peer with the spoke."
}

# Private DNS registration
variable vmreg_pdnsz_resource_group_name {
  type        = string
  description = "Resource group containing private DNS zone in which to register virtual machines attached to the landing zone vnet."
  default     = "hub-rg"
}

variable vmreg_pdnsz_name {
  type        = string
  description = "Name of private DNS zone in which to register virtual machines attached to the landing zone vnet."
  default     = "foo.net"
}
