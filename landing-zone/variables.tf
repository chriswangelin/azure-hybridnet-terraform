# Resource group
variable resource_prefix {
  type        = string
  description = "Prefix for all resources in the resource group."
  default     = null
}

variable resource_group_name {
  type        = string
  description = "Resource group name."
  default     = null
}

variable location {
  type        = string
  description = "Location for all resources in the resource group"
  default     = "eastus"
}

# Virtual Network
variable vnet_name {
  type        = string
  description = "Virtual network name."
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
  description = "Sets virtual network address space to 10.{vnet_spoke_number}.0.0/24 when vnet_address_space variable is not set.)"
  default     = null
}

variable vnet_peering_enable {
  type        = bool
  description = "Enable virtual network peering to hub network"
  default     = true

}

variable vnet_peering_use_remote_gateways {
  type        = bool
  default     = true
}

# Subnet: App
variable app_snet_name {
  type        = string
  description = "Application subnet name"
  default     = null
}

variable app_snet_address_prefixes {
  type        = list(string)
  description = "Appplication subnet address prefix"
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
  description = "Management subnet name"
  default     = null
}

variable mgmt_snet_address_prefixes {
  type        = list(string)
  description = "Subnet address prefix"
  default     = null
}

variable mgmt_snet_allow_ip_list {
  type        = string
  description = "List of IP addresses to allow inbound to the subnet. If 'auto', then set to client ip."
  default     = "auto"
}

# Virtual Machine: Management
variable mgmt_vm_name {
  type        = string
  description = "Management virtual machine name"
  default     = null
}

variable mgmt_vm_size_level {
  type        = string
  description = "Management virtual machine size"  
  default      = 1
}

variable mgmt_vm_admin_username {
  type        = string
  description = "Management virtual machine admin username"
  default     = null
}

variable mgmt_vm_enable_public_ip {
  type        = bool
  description = "Enable public IP address on the management VM"
  default     = true
}

variable hub_resource_group_name {
  type        = string
  description = "Name of the resource group containing the hub network"
  default     = "hub-rg"
}

variable hub_vnet_name {
  type        = string
  description = "Name of hub virtual network"
  default     = "hub-vnet"
}

variable hub_vnet_id {
  type        = string
  description = "Hub virtual network ID"
  default     = null
}

variable vmreg_pdnsz_resource_group_name {
  type        = string
  description = "Resource group containing private DNS zone in which to register virtual machines attached to the landing zone vnet"
  default     = "hub-rg"
}

variable vmreg_pdnsz_name {
  type        = string
  description = "Name of private DNS zone in which to register virtual machines attached to the landing zone vnet"
  default     = "foo.net"
}

/*
variable resource_group {
  default = {
    name     = null
    location = null
  }
}

variable vnet {
  type = object ({
    name                          = string
    address_space                 = list(string)
    mgmt_subnet_name              = string
    mgmt_subnet_address_prefixes  = string
    mgmt_subnet_nsg_allow_ip_list = list(string)
  })
  description = "Virtual network configuration"
}

# Virtual machine
variable vm {
  type = object({
    name                   = string
    size                   = string
    priority               = string
    eviction_policy        = string
    source_image_publisher = string 
    source_image_offer     = string
    source_image_sku       = string
    source_image_version   = string
    admin_username         = string
  })
  description = "Virtual machine configuration"
  default = {
    size                   = "Standard_D2s_v3"
    priority               = "Spot"
    eviction_policy        = "Deallocate"
    source_image_publisher = "Canonical"
    source_image_offer     = "UbuntuServer"
    source_image_sku       = "18.04-LTS"
    source_image_version   = "latest"
  }
}
*/


