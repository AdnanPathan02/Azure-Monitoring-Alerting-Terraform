resource "azurerm_windows_virtual_machine" "main" {
  name                = "VM-${local.name_prefix}-01"
  computer_name       = "MONITORVM01"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  size                = var.vm_size

  admin_username = var.admin_username
  admin_password = var.admin_password

  network_interface_ids = [
    azurerm_network_interface.vm.id
  ]

  provision_vm_agent        = true
  automatic_updates_enabled = true

  patch_assessment_mode = "AutomaticByPlatform"
  patch_mode            = "AutomaticByPlatform"
  reboot_setting        = "IfRequired"

  bypass_platform_safety_checks_on_user_schedule_enabled = false

  os_disk {
    name                 = "OSDisk-${local.name_prefix}-01"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2025-datacenter-azure-edition"
    version   = "latest"
  }

  boot_diagnostics {}

  identity {
    type = "SystemAssigned"
  }

  tags = local.common_tags
}