terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}

provider azurerm {
  features { }
  skip_provider_registration = true
}

resource azurerm_resource_group rg {
  name     = "linuxvm-rg"
  location = "eastus"
}

resource azurerm_virtual_network vnet {
  name                = "linuxvm-vnet"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  address_space       = [ "10.1.0.0/28" ]
}

resource azurerm_subnet snet {
  name                 = "linuxvm-snet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [ "10.1.0.0/29" ]
}

module linux_vm {
  source = "../../modules/core/virtual-machine-linux"

  resource_group_name = azurerm_resource_group.rg.name
  snet_id             = azurerm_subnet.snet.id

  # Uncomment to enable public IP
  #enable_public_ip    = false
}

output linux_vm_public_ip_address {
  value = module.linux_vm.public_ip_address
}
