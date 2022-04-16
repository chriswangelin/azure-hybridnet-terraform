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

variable spoke_number {
  type        = string
  description = "Suffix for the resource group name (e.g. 001)"
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
}

# Virtual Network: Management Subnet
variable mgmt_snet_name {
  type        = string
  description = "Management subnet name"
  default     = null
}

variable mgmt_snet_address_prefixes {
  type        = list(string)
  description = "Subnet address prefix"
}

variable mgmt_snet_allow_ip_list {
  type        = string
  description = "List of IP addresses to allow inbound to the subnet"
  default     = null
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
  default     = null
}

variable hub_vnet_name {
  type        = string
  description = "Name of hub virtual network"
  default     = null
}

variable hub_vnet_id {
  type        = string
  description = "ID of hub virtual network"
  default     = null
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


