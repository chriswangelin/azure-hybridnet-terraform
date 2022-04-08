#### Module: s2svpn-winras-vpng

Configures a site-to-site (S2S) VPN  between a Windows Server* host and an Azure Virtual Network Gateway.

This module is intended for use with the 'hub' and 'onprem' (on-premises simulator) Terraform modules in this repo
but can be used in any scenario that meets the prerequisites.

* Tested on Windows 2019 Server virtual machine running in Azure.  
 
##### Prerequisites

- Administrator access to Windows Server host with Internet connectivity.
- IP forwarding enabled on Windows host's network interface card.
- Azure Virtual Network Gateway configured with a shared key.
- Azure Local Network Gateway configured with the Windows RAS host's public IP and virtual network.
- Traffic allowed between RAS host and Azure VPN gateway.

##### Optional setup
- PowerShell Core and Az module for gathering input parameter values.
- 'onprem' Terraform module deployed (with Windows RAS VM).
- 'hub' Terraform module with Azure VPN gateway option enabled.

##### Configuration Procedure

###### Terraform module

###### Manual setup
1. Log in to the Windows RAS host with an administrator account.
2. Optional: Install Powershell Core and Az module, and run commands in the section below.
3. Run the config-s2svon-winras-to-azure.ps1 script with the appropriate parameters.  Run the command
   below to see examples.

   Get-Help config-s2svpn-winras-to-azure-vpng.ps1

# Gathering Configuration Data
PowerShell Az module commands like the ones below can be used gather information about the Azure VPN gateway to pass
as input parameters to the script. The example parameters are based on the default values for the resource group in 
the 'hub' Terraform module. Adjust the parameter values to your specific scenario.

`# Get Azure VPN gateway's public IP`
`Get-AzPublicIpAddress -ResourceGroupName hub-rg | Where name -like '*vpng-pip' | Select -ExpandProperty ipaddress`

 `# Get address space of VPN gateway`
 `Get-AzVirtualNetwork -ResourceGroupName hub-rg | select -ExpandProperty AddressPrefix`
