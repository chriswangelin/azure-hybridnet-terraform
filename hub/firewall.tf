resource "azurerm_public_ip" "afw_pip" {
  count               = var.afw_enable ? 1 : 0
  name                = local.afw_pip_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_firewall" "afw" {
  count               = var.afw_enable ? 1 : 0
  name                = local.afw_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku_name            = "AZFW_VNet"
  sku_tier            = "Standard"

  ip_configuration {
    name                 = "afw-ipconfig"
    subnet_id            = azurerm_subnet.afw_snet.id
    public_ip_address_id = azurerm_public_ip.afw_pip[0].id
  }
}

