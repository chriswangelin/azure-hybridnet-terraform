variable vpng_public_ip_address {
  type        = string
  description = "Virtual network gateway private IP address."
}

variable vpng_shared_key {
  type        = string
  description = "Shared secret for virtual network gateway."
}

variable remote_vnet_address_space {
  type        = list(string)
  description = "Virtual network space to which the Windows Remote Access Services host will route."
  default     = [ "10.0.0.0/8" ]
}

variable winra_vm_id {
  type        = string
  description = "Resource ID for the Windows Remote Access Services host."
}
