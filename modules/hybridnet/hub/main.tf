locals {
  resource_group_name     = coalesce(var.resource_group_name, "${var.hub_name}-rg")

  vnet_name               = coalesce(var.vnet_name, "${var.hub_name}-vnet")

  mgmt_snet_name          = coalesce(var.mgmt_snet_name, "${var.hub_name}-mgmt-snet")
  mgmt_snet_nsg_name      = coalesce(var.mgmt_snet_nsg_name, "${var.hub_name}-mgmt-snet-nsg")
  mgmt_snet_allow_ip_list = var.mgmt_snet_allow_ip_list == "clientip" ? chomp(data.http.clientip.body) : var.mgmt_snet_allow_ip_list
  
  dns_snet_name           = coalesce(var.dns_snet_name, "${var.hub_name}-dns-snet")
  dns_snet_nsg_name       = coalesce(var.dns_snet_nsg_name, "${var.hub_name}-dns-snet-nsg")
  dns_snet_allow_ip_list  = var.dns_snet_allow_ip_list == "clientip" ? chomp(data.http.clientip.body) : var.dns_snet_allow_ip_list

  mgmt_vm_name            = coalesce(var.mgmt_vm_name, "${var.hub_name}-mgmt-vm")
  dns_vm_001_name         = coalesce(var.dns_vm_001_name, "${var.hub_name}-dns-vm-001")
  dns_vm_001_size         = "Standard_DS1_v2"

  afw_name                = coalesce(var.afw_name, "${var.hub_name}-afw")
  afw_pip_name            = "${local.afw_name}-pip"

  vpng_name               = coalesce(var.vpng_name, "${var.hub_name}-vpng")
  vpng_conn_name          = "${var.hub_name}-to-onprem-conn"
  vpng_pip_name           = "${local.vpng_name}-pip"

  lgw_name                = coalesce(var.lgw_name, "${var.hub_name}-lgw")

  vmreg_pdnsz_link_name   = "${local.vnet_name}-vmreg-pdnsz-link"
}

data http clientip {
  url = "https://ipv4.icanhazip.com/"
}

resource azurerm_resource_group rg {
  name      = local.resource_group_name
  location  = var.location
} 