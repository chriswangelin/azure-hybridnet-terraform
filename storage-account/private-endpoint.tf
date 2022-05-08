resource "azurerm_private_endpoint" "sa_blob_pe" {
  name                = azurerm_storage_account.sa.name
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.snet_id

  private_service_connection {
    name                           = "${azurerm_storage_account.sa.name}-blob-psc"
    private_connection_resource_id = azurerm_storage_account.sa.id
    is_manual_connection           = false
    subresource_names              = [ "blob" ]
  }
}