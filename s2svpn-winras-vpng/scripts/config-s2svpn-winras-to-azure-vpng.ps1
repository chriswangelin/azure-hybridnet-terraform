<#
.SYNOPSIS

Configures a site-to-site (S2S) VPN connection between a Windows Server host and an Azure Virtual Network Gateway.

.DESCRIPTION

Installs Windows Remote Access Services (RAS) on a Windows server host and configures a S2S VPN tunnel to an Azure
virtual network gateway.  IP forwarding must be enabled on the RAS host's NIC in order to route traffic through the tunnel.
Also, traffic bound for the the tunnel must be explicitly routed to the RAS server.  If the RAS server is on an Azure
virtual network (as opposed to an on-prem network), an Azure route table can be used for routing to the RAS server.

.PARAMETER azureVpnGatewayPublicIp
Public IP of the Azure Virtual Network Gateway.

.PARAMETER azureVnetAddressSpace
(Private) address space of the Azure Virtual Network.

.PARAMETER vpnSharedSecret
Shared secret used for both sides of the VPN connection.  Must be set in Azure VPN Gateway before running this script.

.EXAMPLE

config-s2svpn-winras-to-azure-vpn-gateway.ps1 `
  -azureVpnGatewayPublicIp 20.232.47.230 `
  -azureVnetAddressSpace 10.0.0.0/24 `
  -vpnSharedSecret "asdfkjb123450hsdg3q45LKGHSDFKJH"

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

  # Alternatively, the command below may be run to start the VPN.
  #Connect-VpnS2SInterface -Name "Azure S2S VPN"