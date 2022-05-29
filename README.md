# azure-hybridnet-terraform

# Overview

Do you want to level up your understanding of hybrid networking with Azure?  Have you mastered Terraform basics?

**If you answered "yes" and "yes", then this repo is for you.**

Designing a hybrid network architecture that seamlessly integrates on-premises networks with Azure can be a big obstacle for enterprises moving to the cloud.  Even after a working architecture is in place, software engineers and IT professionals who aren't steeped in Azure networking can struggle to understand fundamental concepts.  Add to that, even those who are passionate about learning usually don't have a data center in their home basements or hardware-based VPN appliances sitting under their desks.  So, experimenting with the on-premises components of the hybrid network can be a little tricky.

This repo aims to create a lab or sandbox environment for experimenting with hybrid networks in Azure. It contains Terraform modules for building a basic hub-and-spoke network with a *simulated* on-premises network.  The Architecture section explains the simulated network and details about the setup.



# A Word of Caution

**RUNNING THE TERRAFORM MODULES IN THIS REPO WILL DEPLOY AZURE RESOURCES THAT COST REAL MONEY. BE ESPECIALLY MINDFUL OF THE AZURE FIREWALL RESOURCE IF IT IS ENABLED, AS IT COSTS $1.25 (USD) PER HOUR PLUS DATA TRANSFER COST AS OF WHEN THIS SENTENCE WAS TYPED. SETTING A SUBSCRIPTION LEVEL BUDGET AND EMAIL NOTIFICATION IS STRONGLY ADVISED WHEN USING THE MODULES IN THIS REPOSITORY.**



# Prerequisites

- [Azure account](https://docs.microsoft.com/en-us/dotnet/azure/create-azure-account) 
- [Terraform](https://www.terraform.io/downloads)
- [git](https://git-scm.com/downloads)
- [terraform-docs](https://terraform-docs.io/)  (required only for contributors)



# Modules

Note: Many modules include a management VM for easy SSH access.

| Name | Description |
| ---- | ----------- |
|```hub```|Hub network, private DNS zones, DNS forwarder VM, optional VPN gateway, and optional Firewall *(coming soon)*.  Integrates with ```onprem``` module.
|```landing-zone```|Foundation on which to deploy an application workload. Includes resource group, spoke vnet, subnets configured with NSG's, and management VM.
|```onprem```|Simulated on-premises network with DNS VM and Windows Remote Access VM for configuring Site-to-Site (VPN) to hub network. Integrates with ```hub``` and ```s2s-winras-vpn``` modules.
|```s2s-winras-vpn```|Virtual machine extension intended for Windows Remote Access Services VM in ```onprem``` module. Executes PowerShell script that configures S2S VPN connection to Azure VPN gateway in ```hub``` module.
|```virtual-machine-linux```|Simplifies creating a vnet-connected Linux virtual machine by requiring only a resource group name and subnet id as input parameters.
|```virtual-machine-windows```|Simplifies creating a vnet-connected Windows virtual machine by requiring only a resource group name, subnet id, and admin password as input parameters.



# Architecture

The diagram below depicts the deployed ```hub```, ```onprem```, and ```s2s-winras-vpn``` modules.  Landing zones will be added later.

![Architecture Diagram](images/hub-spoke.png)

## Virtual Networks

The architecture has several virtual networks:

| Virtual network | Address Space| Description |
| --------------- | -------------| ----------- |
|```onprem-vnet```|```172.16.0.0/16```|Simulated on-premises network.  
|```hub-vnet```|```10.0.0.0/16```|Hub virtual network.
|```lzN-vnet```|```10.N.0.0/16```|Landing zone spoke virtual networks. (N = spoke number)

 The simulated on-premises virtual network (```onprem-vnet```) uses a disinctly different IP range from the hub (```hub-vnet```) to simplify distinguishing the networks. For spoke networks, the second octet of the IP space corresponds to the landing zone spoke number "N", which can be specified as an input parameter for the [```landing-zone```](/landing-zone/) Terraform module.


### Subnets

Several subnets reside in the onprem and hub virtual networks:

|Subnet (onprem-vnet)|Address Prefix|Description|
|-|-|-|
|```onprem-winra-snet```|```172.16.0.0/24```|On-premises Windows Remote Access & Routing Services subnet.
|```onprem-dns-snet```|```172.16.254.0/24```|On-premises DNS server subnet.
|```onprem-mgmt-snet```|```172.16.255.0/24```|On-premises management server subnet.

|Subnet (hub-vnet)|Address Prefix|Description|
|-|-|-|
|```AzureFirewallSubnet```*|```10.0.0.0/26```*|Azure Firewall subnet.
|```GatewaySubnet```*|```10.0.0.64/27```*|Azure VPN Gateway subnet.
|```hub-dns-snet```|```10.0.254.0/24```|Hub DNS server subnet.
|```hub-mgmt-snet```|```10.0.255.0/24```|Hub management server subnet.

###### *Microsoft requires these names and sizes for the firewall and VPN gateway subnets.


 For convenience, DNS subnets (both hub and onprem) follow a ```x.x.254.0/24``` pattern, so it's easy to remember that DNS servers are on the 254 subnet. Similarly the ```x.x.255.0/24``` subnets are for "management", and each has an attached management VM that's intended mostly for connectivity testing between vnets.

### Network Security Groups (NSG's)

All subnets are associated with an NSG that allows traffic from the public IP address or NAT gateway of the the client machine running the Terraform modules. 



## Site-to-Site (S2S) VPN

The core components of the S2S VPN connection are as follows:

|Resource|Private IP Address|Description
|-|-|-|
|```onprem-winra-vm```|```172.16.0.4```|On-premises S2S VPN gateway (Windows RAS).
|```hub-vpng```|(system-generated)|Hub VPN Gateway (Azure Virtual Network Gateway).
|```hub-lgw```|(system-generated)|Hub local gateway.
|```onprem-conn```|(n/a)|Connection from hub VPN gateway to on-prem gateway.

### On-premises side

Unlike typical connections between Azure vnets that use network peering, the on-premises network (```onprem-vnet```) connects to the hub (```hub-vnet```) via a Site-to-Site (S2S) VPN connection, which mimcs how many enterprise data centers connect to Azure.  The on-premises side of the S2S setup uses a Windows virtual machine (```onprem-winra-vm```) that's running Remote Access and Routing Services (RAS), which is one of few software VPN's that Microsoft [officially supports](https://docs.microsoft.com/en-us/azure/vpn-gateway/vpn-gateway-about-vpn-devices) for creating connections to Azure Virtual Network Gateway.  **IP forwarding is enabled on the Windows machine so that it can route traffic to and from the VPN.**  The repository includes a [PowerShell script](/s2svpn-winras-vpng/scripts/config-s2svpn-winras-to-azure-vpng.ps1) for configuring the on-premises side of the VPN connecting in RAS, and the script is executed through a [Terraform module](/s2svpn-winras-vpng/virtual-machine-extension.tf) that invokes a virtual machine extension on the Windows RAS machine.

All on-premises subnets are associated with a route table (```onprem-to-hub-rt```) that routes traffic bound for the hub-and-spoke to the Windows RAS machine.  The destination route is 10.0.0.0/8 because it includes both the addresses in the hub (10.0.0.0/16) and the spokes (10.N.0.0/16, 0 < N <= 255).  Without this route table, traffic intended for the hub would be routed to the Internet, which is the default route for all traffic not destined for the virtual network.

### Azure Side
The Azure side of the VPN connection consists of an Azure Virtual Network Gateway (```hub-vpng```), and a Local Gateway (```hub-lgw```). The local gateway is a logical representation of the on-premises VPN gateway (the Windows RAS machine).  The Windows RAS machine's public IP address and the on-premises virtual network address space is set in the the local gateway's resource configuration.  The connection from the Azure Virtual Network Gateway to the on-premises Windows machine is made by creating a VPN connection (```onprem-conn```) in the Virtual Network Gateway resource.  This connection associates the Virtual Network Gateway with the local gateway (which represents the on-premises Windows machine).



## Private Link Services & Private Endpoints

A *private link-enabled* Azure service is one that supports *private endpoints* - a mechanism for assigning private IP addresses to specific types of Platform-as-a-Service (PaaS) resources, such as a storage accounts or key vaults.  The private IP's, however,  are *endpoints*, meaning that they only permit inbound traffic.  As a side note, Network Security Groups (NSG's) have historically not applied to private endpoints, but a [public preview feature](https://azure.microsoft.com/en-us/updates/public-preview-of-private-link-network-security-group-support/) now supports this functionality.  DNS resolution for private endpoints happens through Azure's DNS resolver and *Private DNS Zones*, which is covered in the next section.



## DNS

The DNS setup for hybrid networking in Azure can be quite elaborate.  There are four key components:

|Resource|Private IP Address|Public IP Address|Description
|-|-|-|-|
|```onprem-dns-vm```|```172.16.254.4```|(system-generated)|On-premises DNS server VM
|```hub-dns-vm```|```10.0.254.4```|(system-generated)|Private DNS Server VM
|(n/a)|(n/a)|```168.63.129.16```|Azure DNS resolver
|Private DNS Zones*|(n/a)|(n/a)|Private DNS Zones

###### *Private DNS Zone examples: privatelink.blob.core.windows.net, privatelink.vaultcore.azure.net


### DNS Software & Configuration

Both the on-premises DNS server and the private DNS server in the hub network are run the Unbound DNS server software.  A [virtual machine extension](/onprem/virtual-machine-extension.tf) in the [onprem](/onprem/) module and [another](/hub/scripts/config-unbound-dns-hub-rhel.sh) in the [hub](/hub/) module execute a bash script that deploys and configures Unbound on the DNS hosts.  Both configuration scripts specify which IP ranges are allowed to query the DNS servers and configure logging to ```/var/log/unbound.log```.  The on-premises configuration script has both a local zone for on-premises virtual machines and conditional forwarders that send private link FQDN lookups to the private DNS VM in the hub network.  All other traffic is routed to the Azure DNS resolver.


### Lookups originating from on-premises

In our architecture, DNS lookups for on-premises hostnames originating from on-premises hosts are resolved via the on-premises DNS server (```onprem-dns-vm```), as would be typical in a real on-premises network.  Lookups for Fully Qualified Domain Names (FQDN's) associated with private link-enabled Azure services originating from the on-premises network (```onprem-vnet```) are forwarded to the private DNS server in the hub network (```hub-dns-vm```), which in turn forwards the request to Azure's DNS resolver (```168.63.129.16```).  The resolver determines if the request is originating from a network that has a private DNS zone corresponding to the requested DNS record.  For example, if the lookup is for foo.blob.core.windows.net (storage account blob endpoint), then it determines if the originating network (```hub-vnet```) has a link to a private DNS zone named ```privatelink.blob.core.windows.net```. If a private DNS zone exists (which it does in our setup), then the resolver attempts to find the requested DNS record in that zone and sends it in a reply to the originating DNS server (```hub-dns-vm```), which then passes it back to the on-premises DNS server (```onprem-dns-vm```).  The "link" between a virtual network and a privte DNS zone is not a network link - it's just a logical association made in the vnet resource, much like assocating an NSG with a subnet.

### Lookups originating from the hub and spokes

In our setup, the hub vnet (```hub-vnet```) and all spoke vnets are configured to use our private DNS server (```hub-dns-vm```) for lookups.  Lookups for Azure resources originating from hub or spoke networks follow the same logic as lookups forwarded to our private DNS server (```hub-dns-vm```) from on-premises.  The private server forwards lookups for on-premises originiating from the hub or spokes to the on-premises server (```onnprem-dns-vm```), which resolves the request.

### Private DNS Zone Records

For specific types of PaaS services, a *deploy if not exists* policy has been configured in Azure Policy to automatically create private DNS zone records when a private endpoint for the service is deployed.  These policies are created in the [policy-pdnsz](/policy-pdnsz) module.

## Other Resources

All virtual networks, including the on-premises one contain a low-powered management VM for connectivity testing.  These VM's can be configured with or without a public IP address.  Login via SSH key is configured by default. 

More to come...