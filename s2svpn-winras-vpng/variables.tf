variable "vpng_public_ip_address" {
  type        = string
  description = "Virtual network gateway private IP address"
}

variable "remote_address_space" {
  type        = string
  description = "Virtual network space to which the RAS host will route"
}