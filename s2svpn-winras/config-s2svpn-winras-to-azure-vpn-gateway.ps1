<#
.SYNOPSIS

Configures a site-to-site (S2S) VPN between Windows and Azure.

.DESCRIPTION

Configures a S2S VPN on a Windows host running Remote Access Services (RAS)
that connects to an Azure Virtual Network Gateway.

.PARAMETER azureVpnGatewayPublicIp
Public IP of the Azure Virtual Network Gateway.

.PARAMETER azureVnetAddressSpace
(Private) address space of the Azure Virtual Network.

.PARAMETER vpnSharedSecret
Shared secret used for both sides of the VPN connection.  Must be set in Azure VPN Gateway before running this script.

.EXAMPLE

config-s2svpn-winras-to-azure-vpn-gateway.ps1 -remoteVpnGatewayPublicIp 20.232.47.230 -remoteVnetAddressSpace 10.0.0.0/24 -vpnSharedSecret "asdfkjb123450hsdg3q45LKGHSDFKJH"

#>
Param(
    [Parameter(Mandatory=$true)][String] $azureVpnGatewayPublicIp,
    [Parameter(Mandatory=$true)][String] $azureVnetAddressSpace,
    [Parameter(Mandatory=$true)][String] $vpnSharedSecret
)

# Install Windows Remote Access Services, including all its sub-features and management tools
Install-WindowsFeature -Name RemoteAccess -IncludeAllSubFeature -IncludeManagementTools

# To facilitate connectivity testing, allow ping requests.
Enable-NetFirewallRule -DisplayName "File and Printer Sharing (Echo Request - ICMPv4-In)"

# The Remote Access service is disabled by default and has to be enabled, or it will fail on start
Set-Service -Name "RemoteAccess" -StartupType Automatic
Start-Service -Name "RemoteAccess"

# Install S2S VPN.  Legacy permits viewing config from the Remote Access and Routing GUI.
Install-RemoteAccess -VpnType VpnS2S -Legacy

# Add the S2S VPN interface.
Add-VpnS2SInterface `
  -Name "Azure S2S VPN" `
  -Protocol IKEv2 `
  -Destination $azureVpnGatewayPublicIp `
  -AuthenticationMethod PSKOnly `
  -SharedSecret $vpnSharedSecret `
  -Persistent `
  -IPv4Subnet "${azureVnetAddressSpace}:100" `
  -PassThru
  #sleep 10

  # Restarting the service automatically re-connects the VPN
  Stop-Service -Name "RemoteAccess"  
  Start-Service -Name "RemoteAccess"

  # Restarting the service automatically re-connects the VPN
  #Connect-VpnS2SInterface -Name "Azure S2S VPN"