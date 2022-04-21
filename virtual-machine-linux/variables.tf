# Resource group and location
variable resource_group_name {
  type        = string
  description = "Name of the Resource Group in which to create the virtual machine."
  default     = null
}

variable location {
  type        = string
  description = "The Azure location in which to create the virtual machine."
  default     = "eastus"
}

# Virtual network
variable snet_id {
  type        = string
  description = "Name of subnet to which virtual machine will be attached."
  default     = null
}

variable vnet_address_space {
  type        = list(string)
  description = "Address space for the virtual network to which virtual machine NIC is attached."
  default     = null
}

variable mgmt_snet_allow_ip_list {
  type        = string
  description = "List of IP addresses to allow inbound to the management subnet."
  default     = "auto"
}

# Virtual machine
variable name {
  type        = string
  description = "Name of the virtual machine."
  default     = null
}

variable admin_username {
  type        = string
  description = "Admin username for the virtual machine."
  default     = "azadmin"
  nullable    = false
}

variable admin_password {
  type        = string
  description = "Admin password for the virtual machine."
  default     = null
}

variable admin_ssh_public_key_path {
  type        = string
  description = "Admin user public SSH key path for the virtual machine."
  default     = "~/.ssh/id_rsa.pub"
}

variable disable_password_authentication {
  type        = string
  description = "Disable password authentication."
  default     = true
}

variable timezone {
  type        = string
  description = "Time zone for the virtual machine."
  default     = "Eastern Standard Time"
}

variable size {
  type        = string
  description = "Virtual machine SKU, such as Standard_F2."
  default     = "Standard_B2s"
}

variable size_level {
  type        = number
  description = "Virtual machine level - 1, 2, or 3 - with 1 having the lowest hardware specs of the 3 and level 3 having the highest. See locals.tf for translation of level to size."
  default     = null
}

variable priority {
  type        = string
  description = "Virtual machine priority. Possible values are Regular and Spot."
  default     = "Regular"
}

variable eviction_policy {
  type        = string
  description = "Virtual Machine eviction policy.  Specifies what happens when a Spot instance is evicted."
  default     = null
}

variable source_image_publisher {
  type        = string
  description = "Virtual machine source image publisher."
  default     = "RedHat"
}

variable source_image_offer {
  type        = string
  description = "Virtual machine source image offer."
  default     = "RHEL"
}

variable source_image_sku {
  type        = string
  description = "Virtual machine source image sku."
  default     = "8_5"
}

variable source_image_version {
  type        = string
  description = "Virtual machine source image version."
  default     = "latest"
}

variable os_disk_size_gb {
  type        = number
  description = "Virtual machine OS disk size in GB."
  default     = 64
}

variable os_disk_storage_account_type {
  type        = string
  description = "Storage account type for virtual machine OS disk."
  default     = "Standard_LRS"
}

variable os_disk_caching {
  type        = string
  description = "Caching type for virtual machine OS disk."
  default     = "ReadWrite"
}

variable enable_public_ip {
  type        = bool
  description = "Enable public IP address on virtual machine network interface."
  default     = true
}

variable public_ip_allocation_method {
  type        = string
  description = "IP address allocation method for the virtual machine."
  default     = "Static"
}

variable private_ip_address {
  type        = string
  description = "Static private IP address for virtual machine."
  default     = null
}

variable enable_ip_forwarding {
  type        = bool
  description = "Enable IP forwarding on virtual machine. Required when VM is acting as a router."
  default     = false
}

variable dns_servers {
  type        = list(string)
  description = "DNS servers set on virtual machine primary network interface."
  default     = null
}

variable custom_data {
  type        = string
  description = "Custom data for the virtual machine such as a cloud-init script."
  default     = null
}

variable shutdown_enabled {
  type        = bool
  description = "Enable auto-shutdown for virtual machine."
  default     = true
}

variable shutdown_daily_recurrence_time {
  type        = string
  description = "Daily auto-shutdown time for virtual machine."
  default     = "0300"
}

variable shutdown_timezone {
  type        = string
  description = "Daily auto-shutdown timezone for virtual machine."
  default     = "Eastern Standard Time"
}

variable shutdown_notification_enabled {
  type        = bool
  description = "Whether to enable pre-shutdown notifications for virtual machine."
  default     = false
}

variable shutdown_notification_email {
  type        = string
  description = "E-mail address for virtual machine shutdown notifications."
  default     = null
}

variable shutdown_notification_time_in_minutes {
  type        = number
  description = "Time in minutes between 15 and 120 before a virtual machine shutdown event at which a notification will be sent."
  default     = 30
}

