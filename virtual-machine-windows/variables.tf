variable resource_group_name {
  type        = string
  description = "The name of the Resource Group in which the Windows Virtual Machine should exist."
}

variable location {
  type        = string
  description = "The Azure location where the Windows Virtual Machine should exist."
}

variable name {
  type        = string
  description = "Virtual machine name."
}

variable admin_username {
  type        = string
  description = "Admin username for the virtual machine."
  default     = "azadmin"
  nullable    = false
}

variable admin_password {
  type        = string
  description = "Admin password for the DNS virtual machine."
}

variable snet_id {
  type        = string
  description = "Name of subnet to which virtual machine will be attached."
}

variable timezone {
  type        = string
  description = "Time zone for the virtual machine."
  default     = "Eastern Standard Time"
}

variable urn {
  type        = string
  description = "Virtual machine URN."
  default     = "MicrosoftWindowsServer:WindowsServer:2019-Datacenter-smalldisk:latest"
  nullable    = false
}

variable plan {
  type        = string
  description = "Virtual machine plan (publisher:product:plan)."
  default     = null
}

variable size {
  type        = string
  description = "Virtual machine size."
  default     = "Standard_DS1_v2"
  nullable    = false
}

variable priority {
  type        = string
  description = "Virtual machine priority. Possible values are Regular and Spot."
  default     = "Regular"
}

variable eviction_policy {
  type        = string
  description = "Virtual Machine eviction policy.  Specifies what happens when a Spot instance is evicted."
#  default     = "Deallocate"
  default     = null
}

variable os_disk_size_gb {
  type        = number
  description = "Virtual machine OS disk size in GB."
  default     = 30
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
  default     = false
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

variable public_ip_allocation_method {
  type        = string
  description = "IP address allocation method for the virtual machine."
  default     = "Static"
}
