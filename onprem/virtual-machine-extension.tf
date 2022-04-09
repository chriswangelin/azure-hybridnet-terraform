# See https://docs.microsoft.com/en-us/azure/virtual-machines/extensions/custom-script-linux
# Run "base64" command on "install-docker.sh" to get encoded value for script parameter
resource "azurerm_virtual_machine_extension" "dns_vm_001_customscript_vmext" {
  name                 = "dns_vm_001_customscript"
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
