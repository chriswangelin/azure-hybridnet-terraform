terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0, < 4.0.0"
    }
  }
}

provider azurerm {
  skip_provider_registration = true
  features { }
}

locals {
  mgmt_snet_allow_ip_list = var.mgmt_snet_allow_ip_list == "clientip" ? chomp(data.http.clientip.body) : var.mgmt_snet_allow_ip_list
  dns_snet_allow_ip_list  = var.dns_snet_allow_ip_list == "clientip" ? chomp(data.http.clientip.body) : var.dns_snet_allow_ip_list

  afw_pip_name            = "${var.afw_name}-pip"
  vpng_conn_name          = "onprem-conn"
  vpng_pip_name           = "${var.vpng_name}-pip"
  vmreg_pdnsz_link_name   = "${var.vnet_name}-vmreg-pdnsz-link"
}

data "http" "clientip" {
  url = "https://ipv4.icanhazip.com/"
}
