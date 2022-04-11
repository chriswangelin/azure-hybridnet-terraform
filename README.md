## azure-terraform-jumpstart

Ready-made Terraform modules for jumpstarting Azure projects.
 
## Prerequisites

- [Azure account](https://docs.microsoft.com/en-us/dotnet/azure/create-azure-account) 
- [Terraform](https://www.terraform.io/downloads)
- [git](https://git-scm.com/downloads)

## Modules

Note: All modules include an optional management VM.

|Name|Description
|-|-|
|hub|Hub network with DNS, optional VPN gateway and Firewall.  Often used with 'onprem' module.
|onprem|Simulated on-premises network with DNS and connectivity to hub via pre-configured Site-to-Site (VPN) or peering.
|landing-zone| Foundation on which to build a new app. Includes storage account, key vault, virtual network with optional routing through hub network.
