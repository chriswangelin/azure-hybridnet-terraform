terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}

provider azurerm {
  features { }
  skip_provider_registration = true
}

# On-premises data sources needed to create S2S VPN connection
# data azurerm_public_ip winra_vm_public_ip_address {
#   resource_group_name = "onprem-rg"
#   name                = "onprem-winra-vm-pip-001"
# }

# data azurerm_virtual_network onprem_vnet {
#   resource_group_name = "onprem-rg"
#   name                = "onprem-vnet"
# }

# data azurerm_virtual_machine onprem_winra_vm {
#   resource_group_name = "onprem-rg"
#   name                = "onprem-winra-vm"
# }

module onprem {
  source = "../../../modules/hybridnet/onprem"

#  mgmt_vm_urn               = "RedHat:rhel-byos:rhel-lvm85-gen2:8.5.20220317"
#  mgmt_vm_plan              = "redhat:rhel-byos:rhel-lvm85-gen2"

#  dns_vm_001_urn            = "RedHat:rhel-byos:rhel-lvm85-gen2:8.5.20220317"
#  dns_vm_001_plan           = "redhat:rhel-byos:rhel-lvm85-gen2"

  winra_vm_admin_password   = var.winra_vm_admin_password
}

module hub {
  source = "../../../modules/hybridnet/hub"

  # mgmt_vm_urn     = "RedHat:rhel-byos:rhel-lvm85-gen2:8.5.20220317"
  # mgmt_vm_plan    = "redhat:rhel-byos:rhel-lvm85-gen2"

  # dns_vm_001_urn  = "RedHat:rhel-byos:rhel-lvm85-gen2:8.5.20220317"
  # dns_vm_001_plan = "redhat:rhel-byos:rhel-lvm85-gen2"

  # Set enable_privatelink_xxx_pdnsz variables to true as needed to enable private DNS zones
  enable_privatelink_blob_core_windows_net_pdnsz = true
  enable_privatelink_vaultcore_azure_net_pdnsz   = true
  enable_privatelink_database_windows_net_pdnsz  = true

  ### Uncomment to add VPN gateway for onprem connectivity via S2S VPN
  vpng_enable                   = true
  vpng_connection_onprem_enable = true
  vpng_shared_key               = var.vpng_shared_key
#  lgw_gateway_address           = data.azurerm_public_ip.winra_vm_public_ip_address.ip_address
#  lgw_address_space             = data.azurerm_virtual_network.onprem_vnet.address_space

  lgw_gateway_address           = module.onprem.winra_vm_public_ip_address
  lgw_address_space             = module.onprem.vnet_address_space

  ### Uncomment to enable Azure firewall
  # afw_name = var.hub_afw_enable
  depends_on = [
    module.onprem
  ]
}

 module s2svpn_onprem_to_hub {
   source                    = "../../../modules/hybridnet/s2svpn-winras-vpng"

   vpng_public_ip_address    = module.hub.vpng_public_ip_address
   vpng_shared_key           = var.vpng_shared_key
   winra_vm_id               = data.azurerm_virtual_machine.onprem_winra_vm.id
   depends_on = [
     module.hub
   ]
 }