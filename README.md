## azure-terraform-modules

Ready-made Terraform modules for jumpstarting Azure projects.
 
## Prerequisites

- [Azure account](https://docs.microsoft.com/en-us/dotnet/azure/create-azure-account) 
- [Terraform](https://www.terraform.io/downloads)
- [git](https://git-scm.com/downloads)

## Modules

Note: Many modules include a management VM for easy SSH access.

|Name|Description
|-|-|
|hub|Hub network with private DNS zones, DNS forwarder VM, optional VPN gateway, and optional Firewall.  Integrates with 'onprem' module.
|onprem|Simulated on-premises network with DNS VM and Windows Remote Access VM for configuring Site-to-Site (VPN) to hub network. Integrates with 'hub' module.
|landing-zone|Foundation on which to build a new app. Includes resource group, vnet, subnets configured with NSG's, and management VM.
