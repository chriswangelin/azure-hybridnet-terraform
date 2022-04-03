## azure-lab-jumpstart

For newbies and professionals alike, building an Azure lab or "sandbox" environment can be a great way to prove out concepts, test new features, practice for Azure certifications, and showcase skills.

This repo provides ready-made Terraform modules for jumpstarting lab projects.
 
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
