locals {
  resource_group_name      = coalesce(var.resource_group_name, "${var.onprem_name}-rg")

  vnet_name                = coalesce(var.vnet_name, "${var.onprem_name}-vnet")

  mgmt_snet_name           = coalesce(var.mgmt_snet_name, "${var.onprem_name}-mgmt-snet")
  mgmt_snet_nsg_name       = coalesce(var.mgmt_snet_nsg_name, "${var.onprem_name}-mgmt-snet-nsg")
  mgmt_snet_allow_ip_list  = var.mgmt_snet_allow_ip_list == "clientip" ? chomp(data.http.clientip.body) : var.mgmt_snet_allow_ip_list

  dns_snet_name            = coalesce(var.dns_snet_name, "${var.onprem_name}-dns-snet")
  dns_snet_nsg_name        = coalesce(var.dns_snet_nsg_name, "${var.onprem_name}-dns-snet-nsg")
  dns_snet_allow_ip_list   = var.dns_snet_allow_ip_list == "clientip" ? chomp(data.http.clientip.body) : var.dns_snet_allow_ip_list

  winra_snet_name          = coalesce(var.winra_snet_name, "${var.onprem_name}-winra-snet")
  winra_snet_nsg_name      = coalesce(var.winra_snet_nsg_name, "${var.onprem_name}-winra-snet-nsg")
  winra_snet_allow_ip_list = var.winra_snet_allow_ip_list == "clientip" ? chomp(data.http.clientip.body) : var.winra_snet_allow_ip_list

  mgmt_vm_name             = coalesce(var.mgmt_vm_name, "${var.onprem_name}-mgmt-vm")
  winra_vm_name            = coalesce(var.winra_vm_name, "${var.onprem_name}-winra-vm")
  dns_vm_001_name          = coalesce(var.dns_vm_001_name, "${var.onprem_name}-dns-vm-001")

  route_table_name         = coalesce(var.route_table_name, "${var.onprem_name}-to-hub-rt")
}

data http clientip {
  url = "https://ipv4.icanhazip.com/"
}

resource azurerm_resource_group rg {
  name     = local.resource_group_name
  location = var.location
}
