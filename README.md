## azure-lab-builder

Ready-made Terraform modules to jumpstart your Azure experiments.

#### Who is this repo for?
This repo caters to Azure professionals who build solutions for large enterprises that have hybrid networks.

#### What problem does this repo aim to solve?
It takes the headache out of creating a realistic lab or "sandbox" environment for experimenting with Azure resources. 

#### Why solve this problem?
For Azure newbies and seasoned professionals alike, building a lab environment can be a great way to prove out concepts, test new features, practice for Azure certifications, and show off skills.

#### How does it solve the problem?

- Hub network with pre-configured DNS server and connectivity to simluated on-prem network via Site-to-Site VPN or peering.
- On-premises network simulator with pre-configured DNS server and Site-to-Site VPN device.
- Landing zones with pre-configured virtual network routing through hub-based firewall. 
- Future: Configured for monitoring with a central log analytics workspace and 
- Future: Azure DevOps self-hosted agents on Kubernetes.
- Future: Budget alerts and automatic teardown


**CAUTION to Newbies: Azure resources cost money.  Running up a multi-thousand dollar bill in a day is very possible.**

Azure professionals tend to work in large enterprises with hybrid networks.  A primary aim of this repo is hub-and-spoke model with simulated on-premises network. 


