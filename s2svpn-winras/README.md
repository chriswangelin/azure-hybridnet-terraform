## Module: s2svpn-winras-azure

Configures a Site-to-Site (S2S) VPN connection in Windows Remote Access Services (RAS) that connects
to an Azure Virtual Network Gateway.
 
## Prerequisites

- Administrator access to a host with Windows Server installed*.
- Azure Virtual Network Gateway configured with a shared key.
- Azure Local Network Gateway configured with the Windows RAS host's public IP and routable address space.
- VPN traffic permitted in both directions by firewall (if any).
- PowerShell Az module (optional; see section on Gathering Configuration Data)

* Tested on Windows 2019 Server.

## Gathering Configuration Data
One can use the PowerShell Az module commands below to gather the configuration parameters for the script.

# Get Azure VPN gateway's public IP
Get-AzPublicIpAddress -ResourceGroupName hub-rg | Where name -like '*vpng-pip' | Select -ExpandProperty ipaddress

# Get address space of VPN gateway
Get-AzVirtualNetwork -ResourceGroupName hub-rg | select -ExpandProperty AddressPrefix 

