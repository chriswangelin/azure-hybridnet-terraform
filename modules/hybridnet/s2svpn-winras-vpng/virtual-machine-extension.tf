resource azurerm_virtual_machine_extension s2svpn_winras_vpng_vmext {
  name                 = "s2svpn_winras_customscript"
  virtual_machine_id   = var.winra_vm_id
  publisher            = "Microsoft.Compute"
  type                 = "CustomScriptExtension"
  type_handler_version = "1.10"

  settings = <<SETTINGS
  {
    "fileUris": ["https://raw.githubusercontent.com/chriswangelin/azure-terraform-modules/develop/modules/hybridnet/s2svpn-winras-vpng/scripts/config-s2svpn-winras-to-azure-vpng.ps1"],
    "commandToExecute": "powershell.exe ./config-s2svpn-winras-to-azure-vpng.ps1 -azureVpnGatewayPublicIp ${var.vpng_public_ip_address} -azureVnetAddressSpace ${var.remote_vnet_address_space[0]} -vpnSharedSecret ${var.vpng_shared_key}"
  }
SETTINGS
}
