resource "azurerm_virtual_machine_extension" "s2svpn_winras_vpng_vmext" {
  name                 = "s2svpn_winras_customscript"
  virtual_machine_id   = var.winra_vm_id
  publisher            = "Microsoft.Azure.Extensions"
  type                 = "CustomScript"
  type_handler_version = "2.0"

  settings = <<SETTINGS
  {
    "fileUris": ["https://raw.githubusercontent.com/chriswangelin/azure-lab-jumpstart/develop/s2svpn-winras/config-s2svpn-winras-to-azure-vpng.ps1"],
    "commandToExecute": "config-s2svpn-winras-to-azure.ps1 -azureVpnGatewayPublicIp ${var.vpng_public_ip_address} -azureVnetAddressSpace ${var.vnet_address_space[0]} -vpnSharedSecret ${var.vpng_shared_key}"
  }
SETTINGS
}
