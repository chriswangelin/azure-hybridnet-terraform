## azure-lab-builder

For newbies and seasoned professionals alike, building an Azure lab or "sandbox" environment can be a great way to prove out concepts, test new features, practice for Azure certifications, and showcase skills.

This repo provides ready-made Terraform modules for jumpstarting lab projects.
 
## Getting started

### Prerequisites

Azure account, local Terraform installation, git

## Modules

Note: All modules include an optional management VM.

| Name           |Description                                                                                                               |
|----------------|--------------------------------------------------------------------------------------------------------------------------|
| hub            | Hub network with DNS, optional VPN gateway and Firewall.  Often used with 'onprem' module.                               |
| onprem         | Simulated on-premises network with DNS and connectivity to hub via pre-configured Site-to-Site (VPN) or peering.         |
| landing-zone   | Foundation on which to build a new app. Includes storage account, key vault, virtual network with optional routing through hub network.|
