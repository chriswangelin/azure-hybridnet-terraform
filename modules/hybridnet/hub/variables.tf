# General variables
variable hub_name {
  type        = string
  description = "Hub name. Used as a name prefix for resources in this module."
  default     = "hub"
}

variable resource_group_name {
  type        = string
  description = "Resource group name. Set to <hub_name>-rg if not specified."
  default     = null
}

variable location {
  type        = string
  description = "Region of hub resources."
  default     = "eastus"
}

# Virtual network
variable vnet_name {
  type        = string
  description = "Virtual network name. Set to <hub_name>-vnet if not specified."
  default     = null
}

variable vnet_address_space {
  type        = list(string)
  description = "Virtual network address space."
  default     = [ "10.0.0.0/16" ]
}

# Subnet: Azure Firewall
variable afw_snet_address_prefixes {
  type        = list(string)
  description = "Firewall subnet address prefix."
  default     = [ "10.0.0.0/26" ]
}

# Subnet: VPN gateway
variable vpng_snet_address_prefixes {
  type        = list(string)
  description = "Gateway subnet address prefix."
  default     = [ "10.0.0.64/27" ]
}

# Subnet: Management
variable mgmt_snet_name {
  type        = string
  description = "Management subnet name. Set to <hub_name>-mgmt-snet if not specified."
  default     = null
}

variable mgmt_snet_address_prefixes {
  type        = list(string)
  description = "Management subnet address prefix."
   default     = [ "10.0.255.0/24" ]
}

variable mgmt_snet_nsg_name {
  type        = string
  description = "Management subnet network security group name. Set to <hub_name>-mgmt-snet if not specified."
  default     = null
}

variable mgmt_snet_allow_ip_list {
  type        = string
  description = "Group of IP's to allow inbound access to the management subnet.  Default of 'clientip' sets allow list to client IP."
  default     = "clientip"
}

# Subnet: DNS
variable dns_snet_name {
  type        = string
  description = "DNS subnet name. Set to <hub_name>-dns-snet if not specified."
  default     = null
}

variable dns_snet_address_prefixes {
  type        = list(string)
  description = "DNS subnet address prefixes."
  default     = [ "10.0.254.0/24" ]
}

variable dns_snet_nsg_name {
  type        = string
  description = "DNS subnet network security group name. Set to <hub_name>-snet-nsg if not specified."
  default     = null
}

variable dns_snet_allow_ip_list {
  type        = string
  description = "Group of IP's to allow inbound access to the DNS subnet.  Default of 'clientip' sets allow list to client IP."
  default     = "clientip"
}

# Azure Firewall
variable afw_enable {
  type        = bool
  description = "Enable Azure firewall."
  default     = false
}

variable afw_name {
  type        = string
  description = "Azure Firewall name. Set to <hub_name>-afw if not specified."
  default     = null
}

# Virtual network gateway (VPN gateway)
variable vpng_enable {
  type        = bool
  description = "Enable VPN gateway."
  default     = false
}

variable vpng_name {
  type        = string
  description = "VPN Gateway name. Set to <hub_name>-vpng if not specified."
  default     = null
}

variable vpng_shared_key {
  type        = string
  description = "VPN Gateway shared key."
  default     = null
}

variable vpng_connection_onprem_enable {
  type        = bool
  description = "Enable VPN gateway connection to simulated on-premises network."
  default     = false
}

# Local gateway
variable lgw_name {
  type        = string
  description = "Local network gateway name. Set to <hub_name>-lgw if not specified."
  default     = null
}

variable lgw_gateway_address {
  type        = string
  description = "Local network gateway address. (Public IP address of remote VPN device.)"
  default     = null
}

variable lgw_address_space {
  type        = list(string)
  description = "Local network gateway address space."
  default     = [ "172.16.0.0/16" ]
}

# On-prem virtual network connectivity
variable onprem_vnet_resource_group_name {
  type        = string
  description = "Resource group containing on-prem simulator virtual network."
  default     = "onprem-rg"
}

variable onprem_vnet_name {
  type        = string
  description = "On-premises simulator virtual network name."
  default     = "onprem-vnet"
}

variable onprem_vnet_id {
  type        = string
  description = "On-premises simulator virtual network ID."
  default     = null
}

# Virtual machine: Management
variable mgmt_vm_name {
  type        = string
  description = "Name of management virtual machine. Set to <hub-name>-mgmt-vm if not specified."
  default     = null
}

variable mgmt_vm_urn {
  type        = string
  description = "URN for management virtual machine"
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

variable mgmt_vm_private_ip_address {
  type        = string
  description = "Private IP address for management virtual machine."
  default     = "10.0.255.4"
}

variable mgmt_vm_enable_public_ip {
  type        = string
  description = "Enable public IP address for management virtual machine."
  default     = true
}

variable mgmt_vm_admin_username {
  type        = string
  description = "Admin username for management virtual machine."
  default     = "azadmin"
}

variable mgmt_vm_admin_password {
  type        = string
  description = "Admin password for management virtual machine."
  default     = null
}

variable mgmt_vm_admin_public_ssh_key_path {
  type        = string
  description = "Admin user public SSH key path for management virtual machine."
  default     = "~/.ssh/id_rsa.pub"
}

# Virtual machine: DNS 001
variable dns_vm_001_name {
  type        = string
  description = "Name of the DNS virtual machine. Set to <hub_name>-dns-vm-001 if not specified."
  default     = null
}

variable dns_vm_001_urn {
  type        = string
  description = "URN for DNS virtual machine."
  default     = "OpenLogic:CentOS:7_9:7.9.2022020700"
}

variable dns_vm_001_plan {
  type        = string
  description = "Plan for the DNS virtual machine."
  default     = null
}

variable dns_vm_001_size {
  type        = string
  description = "Size of DNS virtual machine."
  default     = "Standard_B1s"
}

variable dns_vm_001_private_ip_address {
  type        = string
  description = "Private IP address for the DNS virtual machine."
  default     = "10.0.254.4"
}

variable dns_vm_001_enable_public_ip {
  type        = string
  description = "Enable public IP address for the DNS virtual machine."
  default     = false
}

variable dns_vm_001_admin_username {
  type        = string
  description = "Admin username for the DNS virtual machine."
  default     = "azadmin"
}

variable dns_vm_001_admin_password {
  type        = string
  description = "Admin password or the DNS virtual machine."
  default     = null
}

variable dns_vm_001_admin_public_ssh_key_path {
  type        = string
  description = "Admin user public SSH key path for the DNS virtual machine."
  default     = "~/.ssh/id_rsa.pub"
}

# Private DNS zones
variable vmreg_pdnsz_name {
  type        = string
  description = "Name of DNS zone for registering virtual machines."
  default     = "foo.net"
}

variable pdnsz_list {
  type = list(string)
  default = [
    "privatelink.azure-automation.net",
    "privatelink.database.windows.net",
    "privatelink.sql.azuresynapse.net",
    "privatelink.sql.azuresynapse.net",
    "privatelink.dev.azuresynapse.net",
    "privatelink.azuresynapse.net",
    "privatelink.blob.core.windows.net",
    "privatelink.table.core.windows.net",
    "privatelink.queue.core.windows.net",
    "privatelink.file.core.windows.net",
    "privatelink.web.core.windows.net",
    "privatelink.dfs.core.windows.net",
    "privatelink.documents.azure.com",
    "privatelink.mongo.cosmos.azure.com",
    "privatelink.cassandra.cosmos.azure.com",
    "privatelink.gremlin.cosmos.azure.com",
    "privatelink.table.cosmos.azure.com",
    "privatelink.centralus.batch.azure.com",
    "privatelink.eastus.batch.azure.com",
    "privatelink.westus.batch.azure.com",
    "privatelink.postgres.database.azure.com",
    "privatelink.mysql.database.azure.com",
    "privatelink.mariadb.database.azure.com",
    "privatelink.vaultcore.azure.net",
    "privatelink.managedhsm.azure.net",
    "privatelink.eastus.azmk8s.io",
    "privatelink.search.windows.net",
    "privatelink.azurecr.io",
    "privatelink.azconfig.io",
    "privatelink.centralus.backup.windowsazure.com",
    "privatelink.eastus.backup.windowsazure.com",
    "privatelink.hypervrecoverymanager.windowsazure.com",
    "privatelink.siterecovery.windowsazure.com",
    "privatelink.azure-devices.net",
    "privatelink.servicebus.windows.net",
    "privatelink.eventgrid.azure.net",
    "privatelink.azurewebsites.net",
    "privatelink.api.azureml.ms",
    "privatelink.notebooks.azure.net",
    "privatelink.service.signalr.net",
    "privatelink.monitor.azure.com",
    "privatelink.oms.opinsights.azure.com",
    "privatelink.ods.opinsights.azure.com",
    "privatelink.agentsvc.azure-automation.net",
    "privatelink.cognitiveservices.azure.com",
    "privatelink.afs.azure.net",
    "privatelink.datafactory.azure.net",
    "privatelink.adf.azure.com",
    "privatelink.redis.cache.windows.net",
    "privatelink.redisenterprise.cache.azure.net",
    "privatelink.purview.azure.com",
    "privatelink.purviewstudio.azure.com",
    "privatelink.digitaltwins.azure.net",
    "privatelink.azurehdinsight.net",
    "privatelink.his.arc.azure.com",
    "privatelink.guestconfiguration.azure.com",
    "privatelink.media.azure.net"
  ]
}