# This vm extension must execute before setting the DNS servers on the onprem vnet.
resource "azurerm_virtual_machine_extension" "dns_vm_001_config_unbound_dns_customscript_vmext" {
  name                 = "dns_vm_001_config_unbound_dns_customscript"
  virtual_machine_id   = module.dns_vm_001.vm_id
  publisher            = "Microsoft.Azure.Extensions"
  type                 = "CustomScript"
  type_handler_version = "2.0"

  settings = <<SETTINGS
  {
     "fileUris": ["https://raw.githubusercontent.com/chriswangelin/azure-lab-jumpstart/develop/onprem/scripts/config-unbound-dns-onprem-rhel.sh"],
    "commandToExecute": "bash ./config-unbound-dns-onprem-rhel.sh"
  }
SETTINGS
}

# After DNS servers are set on the vnet, restart NetworkManager to update /etc/resolv.conf.
resource "azurerm_virtual_machine_extension" "dns_vm_001_restart_network_manager_customscript_vmext" {
  name                 = "dns_vm_001_restart_network_manager_customscript"
  virtual_machine_id   = module.dns_vm_001.vm_id
  publisher            = "Microsoft.Azure.Extensions"
  type                 = "CustomScript"
  type_handler_version = "2.0"

  settings = <<SETTINGS
  {
     "fileUris": ["https://raw.githubusercontent.com/chriswangelin/azure-lab-jumpstart/develop/onprem/scripts/restart-network-manager.sh"],
    "commandToExecute": "bash ./restart-network-manager.sh"
  }
SETTINGS
  depends_on = [
    azurerm_virtual_network_dns_servers.vnet_dns_servers
  ]
}