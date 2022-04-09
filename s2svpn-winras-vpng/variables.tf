variable "vpng_public_ip_address" {
  type        = string
  description = "Virtual network gateway private IP address"
}

variable "vpng_shared_key" {
  type        = string
  description = "Shared secret for the VPN gateway"
}

variable "vnet_address_space" {
  type        = list(string)
  description = "Virtual network space to which the RAS host will route"
}

variable "winra_vm_id" {
  type        = string
  description = "Resource ID for the Windows Remote Access Services host"
}
