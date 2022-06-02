terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}

provider azurerm {
  skip_provider_registration = true  
  features { }
}

locals {
  mgmt_snet_allow_ip_list  = var.mgmt_snet_allow_ip_list == "clientip" ? chomp(data.http.clientip.body) : var.mgmt_snet_allow_ip_list
  dns_snet_allow_ip_list   = var.dns_snet_allow_ip_list == "clientip" ? chomp(data.http.clientip.body) : var.dns_snet_allow_ip_list
  winra_snet_allow_ip_list = var.winra_snet_allow_ip_list == "clientip" ? chomp(data.http.clientip.body) : var.winra_snet_allow_ip_list
}

data http clientip {
  url = "https://ipv4.icanhazip.com/"
}