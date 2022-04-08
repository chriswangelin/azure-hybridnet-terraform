# Required variables
variable snet_id {
  type        = string
  description = "Name of subnet to which virtual machine will be attached"
}

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
  description = "The name of the Windows Virtual Machine."
}

variable admin_username {
  type        = string
  description = "The username of the local administrator used for the Virtual Machine."
}

variable admin_password {
  type        = string
  description = "The Password which should be used for the local-administrator on this Virtual Machine."
}

# Optional variables
variable timezone {
  type        = string
  description = "Specifies the Time Zone which should be used by the Virtual Machine"
  default     = "Eastern Standard Time"
}
variable size {
  type        = string
  description = "The SKU which should be used for this Virtual Machine, such as Standard_F2."
  default     = "Standard_B2s"
}

variable priority {
  type        = string
  description = "Specifies the priority of this Virtual Machine. Possible values are Regular and Spot."
  default     = "Regular"
#  default     = "Spot"
}

variable eviction_policy {
  type        = string
  description = "Specifies what should happen when the Virtual Machine is evicted for price reasons when using a Spot instance."
  default     = null
#  default     = "Deallocate"
}

variable source_image_publisher {
  type        = string
  description = "Virtual machine source image publisher"
#  default     = "Canonical"
  default     = "RedHat"
}

variable source_image_offer {
  type        = string
  description = "Virtual machine source image offer"
  #default     = "UbuntuServer"
  default     = "RHEL"
}

variable source_image_sku {
  type        = string
  description = "Virtual machine source image sku"
  #default     = "18.04-LTS"
  default     = "8_5"
}

variable source_image_version {
  type        = string
  description = "Virtual machine source image version"
  default     = "latest"
  #default    = "8.5.2022032201" # RHEL 8
}

variable os_disk_size_gb {
  type        = number
  description = "The Size of the Internal OS Disk in GB, if you wish to vary from the size used in the image this Virtual Machine is sourced from."
  default     = 64
  #default     = 30
}

variable os_disk_storage_account_type {
  type        = string
  description = "The Type of Storage Account which should back this the Internal OS Disk. Possible values are Standard_LRS, StandardSSD_LRS, Premium_LRS, StandardSSD_ZRS and Premium_ZRS."
  default     = "Standard_LRS"
}

variable os_disk_caching {
  type        = string
  description = "The Type of Caching which should be used for the Internal OS Disk. Possible values are None, ReadOnly and ReadWrite."
  default     = "ReadWrite"
}

variable enable_public_ip {
  type        = bool
  description = "Enable public IP address on the VM's network interface"
  default     = false
}

variable private_ip_address {
  type        = string
  description = "Static private IP address for the virtual machine"
  default     = null
}

variable enable_ip_forwarding {
  type        = bool
  description = "Enable IP forwarding - required when VM is acting as a router"
  default     = false
}

variable shutdown_enabled {
  type        = bool
  description = "Auto-shutdown enabled"
  default     = true
}

variable shutdown_daily_recurrence_time {
  type        = string
  description = "Daily auto-shutdown time"
  default     = "0300"
}

variable shutdown_timezone {
  type        = string
  description = "Daily auto-shutdown timezone"
  default     = "Eastern Standard Time"
}

variable shutdown_notification_enabled {
  type        = bool
  description = "Whether to enable pre-shutdown notifications."
  default     = false
}

variable shutdown_notification_email {
  type        = string
  description = "E-mail address to which the notification will be sent."
  default     = null
}

variable shutdown_notification_time_in_minutes {
  type        = number
  description = "Time in minutes between 15 and 120 before a shutdown event at which a notification will be sent."
  default     = 30
}

variable public_ip_allocation_method {
  type        = string
  description = "Defines the allocation method for this IP address. Possible values are Static or Dynamic."
  default     = "Static"
}

variable custom_data {
  type        = string
  description = "Custom data"
  default     = null
}