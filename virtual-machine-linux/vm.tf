resource azurerm_public_ip pip_001 {
  count               = var.enable_public_ip ? 1 : 0
  name                = local.pip_name_001
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = var.public_ip_allocation_method
}

resource azurerm_network_interface nic_001 {
  name                 = local.nic_name_001
  resource_group_name  = var.resource_group_name
  location             = var.location
  enable_ip_forwarding = var.enable_ip_forwarding
  dns_servers          = var.dns_servers

  ip_configuration {
    name                          = local.ipconfig_name_001
    subnet_id                     = var.snet_id
    private_ip_address_allocation = var.private_ip_address == null ? "Dynamic" : "Static"
    private_ip_address            = var.private_ip_address == null ? null : var.private_ip_address   
    public_ip_address_id          = var.enable_public_ip ? azurerm_public_ip.pip_001[0].id : null
  }
}

resource azurerm_linux_virtual_machine vm {
  name                  = local.name
  resource_group_name   = var.resource_group_name
  location              = var.location
  network_interface_ids = [ azurerm_network_interface.nic_001.id ]
  size                  = var.size
  priority              = var.priority
  eviction_policy       = var.eviction_policy  
  admin_username        = var.admin_username
  admin_password        = var.admin_password
  custom_data           = try(base64encode(var.custom_data), null)

  disable_password_authentication = var.disable_password_authentication
  admin_ssh_key {
    username   = var.admin_username
    public_key = file(var.admin_ssh_public_key_path)
  }

  source_image_reference {
    publisher = local.source_image_publisher
    offer     = local.source_image_offer
    sku       = local.source_image_sku
    version   = local.source_image_version
  }

  dynamic "plan" {
    for_each = var.plan != null ? [1] : []

    content {
      publisher = local.plan_publisher
      product   = local.plan_product
      name      = local.plan_name
    }
  }

  os_disk {
    name                 = local.os_disk_name
    caching              = var.os_disk_caching
    storage_account_type = var.os_disk_storage_account_type
    disk_size_gb         = var.os_disk_size_gb
  }
}

resource azurerm_dev_test_global_vm_shutdown_schedule shutdown {
  virtual_machine_id    = azurerm_linux_virtual_machine.vm.id
  location              = var.location
  enabled               = var.shutdown_enabled
  daily_recurrence_time = var.shutdown_daily_recurrence_time
  timezone              = var.shutdown_timezone

  notification_settings {
    enabled         = var.shutdown_notification_enabled
    email           = var.shutdown_notification_email
    time_in_minutes = var.shutdown_notification_time_in_minutes   
  }
}