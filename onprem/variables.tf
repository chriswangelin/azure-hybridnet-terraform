# General variables
variable resource_group_name {
  type        = string
  description = "Name of the resource group in which to create the resources."
  default     = "onprem-rg"
}

variable location {
  type        = string
  description = "Azure location where the resources exists."
  default     = "eastus"
}

# Virtual network (vNet)
variable vnet_name {
  type        = string
  description = "Name of the virtual network to which resources will be attached."
  default     = "onprem-vnet"
}

variable vnet_address_space {
  type        = list(string)
  description = "Address space of the virtual network to which resources will be attached."
  default     = [ "172.16.0.0/16" ]
}

# Subnet: Windows RAS
variable winra_snet_name {
  type        = string
  description = "Windows Remote Access Services (RAS) subnet name."
  default     = "onprem-winra-snet"
}

variable winra_snet_address_prefixes {
  type        = list(string)
  description = "Windows Remote Access Services (RAS) subnet address prefixes."
  default     = [ "172.16.0.0/24" ]
}

variable winra_snet_nsg_name {
  type        = string
  description = "Windows Remote Access Services (RAS) subnet network security group name."
  default     = "onprem-winra-snet-nsg"
}

variable winra_snet_allow_ip_list {
  type        = string
  description = "Group of IP's to allow inbound access to the Windows Remote Access Services (RAS) subnet. Default of 'clientip' sets allow list to client IP."
  default     = "clientip"
}

# Subnet: DNS
variable dns_snet_name {
  type        = string
  description = "DNS subnet name."
  default     = "onprem-dns-snet"
}

variable dns_snet_address_prefixes {
  type        = list(string)
  description = "DNS subnet address prefixes."
  default     = [ "172.16.254.0/24" ]
}

variable dns_snet_nsg_name {
  type        = string
  description = "DNS subnet network security group name."
  default     = "onprem-dns-snet-nsg"
}

variable dns_snet_allow_ip_list {
  type        = string
  description = "Group of IP's to allow inbound access to the DNS subnet. Default of 'clientip' sets allow list to client IP." 
  default     = "clientip"
}

# Subnet: Management
variable mgmt_snet_name {
  type        = string
  description = "Management subnet name."
  default     = "onprem-mgmt-snet"
}

variable mgmt_snet_address_prefixes {
  type        = list(string)
  description = "Management subnet address prefixes."
  default     = [ "172.16.255.0/24" ]
}

variable mgmt_snet_nsg_name {
  type        = string
  description = "Management subnet Network security group name."
  default     = "onprem-mgmt-snet-nsg"
}

variable mgmt_snet_allow_ip_list {
  type        = string
  description = "Group of IP's to allow inbound access to the management subnet.  Typically, this would be an on-premises NAT gateway or router. Default of 'clientip' sets allow list to client IP."
  default     = "clientip"
}

# Virtual machine: Management
variable mgmt_vm_name {
  type        = string
  description = "Name of management virtual machine name."
  default     = "onprem-mgmt-vm"
}

variable mgmt_vm_urn {
  type        = string
  description = "URN for management virtual machine."
  default     = "RedHat:RHEL:8_6:latest"
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

variable mgmt_vm_private_ip_address {
  type        = string
  description = "Private IP address for management virtual machine."
  default     = "172.16.255.4"
}

variable mgmt_vm_enable_public_ip {
  type        = string
  description = "Enable public IP address for management virtual machine."
  default     = true
}

variable mgmt_vm_admin_username {
  type        = string
  description = "Admin username for the management virtual machine."
  default     = "azadmin"
}

variable mgmt_vm_admin_password {
  type        = string
  description = "Admin password for the management virtual machine."
  default     = null
}

variable mgmt_vm_admin_public_ssh_key_path {
  type        = string
  description = "Admin user public SSH key path for the management virtual machine."
  default     = "~/.ssh/id_rsa.pub"
}

# Virtual Machine: Windows Remote Access (RAS)
variable winra_vm_name {
  type        = string
  description = "Name of the Windows Remote Access Services virtual machine."
  default     = "onprem-winra-vm"
}

variable winra_vm_urn {
  type        = string
  description = "URN for Windows Remote Access Services virtual machine."
  default     = "MicrosoftWindowsServer:WindowsServer:2019-Datacenter-smalldisk:latest"
}

variable winra_vm_plan {
  type        = string
  description = "Plan for Windows Remote Access Services virtual machine."
  default     = null
}

variable winra_vm_size {
  type        = string
  description = "Size of Windows Remote Access Services virtual machine."
  default     = "Standard_DS1_v2"
}

variable winra_vm_private_ip_address {
  type        = string
  description = "Private IP address for the Windows Remote Acess Services virtual machine."
  default     = "172.16.0.4"
}

variable winra_vm_enable_public_ip {
  type        = string
  description = "Enable public IP address on Windows Remote Access Services virtual machine."
  default     = true
}

variable winra_vm_enable_ip_forwarding {
  type        = string
  description = "Enable IP forwarding on the Windows Remote Access Services virtual machine to permit routing traffic to other IP's on the virtual network."
  default     = true
}

variable winra_vm_admin_username {
  type        = string
  description = "Admin username for the Windows Remote Access Services virtual machine."
  default     = "azadmin"
}

variable winra_vm_admin_password {
  type        = string
  description = "Admin password or the Windows Remote Access Services virtual machine."
  default     = null
}

# Virtual machine: DNS 001
variable dns_vm_001_name {
  type        = string
  description = "Name of the Windows Remote Access Services virtual machine."
  default     = "onprem-dns-vm-001"
}

variable dns_vm_001_urn {
  type        = string
  description = "URN for DNS virtual machine."
  default     = "RedHat:RHEL:8_6:latest"
}

variable dns_vm_001_plan {
  type        = string
  description = "Plan for DNS virutal machine."
  default     = null
}

variable dns_vm_001_size {
  type        = string
  description = "Size of DNS virtual machine."
  default     = "Standard_B1s"
}

variable dns_vm_001_private_ip_address {
  type        = string
  description = "Private IP address for DNS virtual machine."
  default     = "172.16.254.4"
}

variable dns_vm_001_enable_public_ip {
  type        = string
  description = "Enable public IP address for DNS virtual machine."
  default     = true
}

variable dns_vm_001_admin_username {
  type        = string
  description = "Admin username for DNS virtual machine."
  default     = "azadmin"
}

variable dns_vm_001_admin_password {
  type        = string
  description = "Admin password for DNS virtual machine."
  default     = null
}

variable dns_vm_001_admin_public_ssh_key_path {
  type        = string
  description = "Admin user public SSH key path for DNS virtual machine."
  default     = "~/.ssh/id_rsa.pub"
}

# Route table
variable route_table_name {
  type        = string
  description = "Route table name."
  default     = "onprem-to-hub-rt"
}

# Local gateway
variable local_gateway_name {
  type        = string
  description = "Local gateway name."
  default     = "onprem-lgw"
}

variable remote_vnet_address_space {
  type        = string
  description = "Address space of remote vnet connected via S2S VPN."
  default     = "10.0.0.0/8"
}
