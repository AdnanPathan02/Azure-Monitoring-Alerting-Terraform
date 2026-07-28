resource "azurerm_log_analytics_workspace" "main" {
  name                = "LAW-${local.name_prefix}"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  sku               = "PerGB2018"
  retention_in_days = 30

  tags = local.common_tags
}

resource "azurerm_virtual_machine_extension" "azure_monitor_agent" {
  name                       = "AzureMonitorWindowsAgent"
  virtual_machine_id         = azurerm_windows_virtual_machine.main.id
  publisher                  = "Microsoft.Azure.Monitor"
  type                       = "AzureMonitorWindowsAgent"
  type_handler_version       = "1.0"
  automatic_upgrade_enabled  = true
  auto_upgrade_minor_version = true

  tags = local.common_tags

  depends_on = [
    azurerm_windows_virtual_machine.main
  ]
}

resource "azurerm_monitor_data_collection_rule" "main" {
  name                = "DCR-${local.name_prefix}"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  kind        = "Windows"
  description = "Collects Windows VM performance counters."

  destinations {
    log_analytics {
      workspace_resource_id = azurerm_log_analytics_workspace.main.id
      name                  = "log-analytics-destination"
    }
  }

  data_sources {
    performance_counter {
      name = "windows-performance-counters"

      streams = [
        "Microsoft-Perf"
      ]

      sampling_frequency_in_seconds = 60

      counter_specifiers = [
        "\\Processor(_Total)\\% Processor Time",
        "\\Memory\\Available MBytes",
        "\\LogicalDisk(_Total)\\% Free Space",
        "\\LogicalDisk(_Total)\\Free Megabytes",
        "\\Network Interface(*)\\Bytes Total/sec"
      ]
    }
  }

  data_flow {
    streams = [
      "Microsoft-Perf"
    ]

    destinations = [
      "log-analytics-destination"
    ]
  }

  tags = local.common_tags
}

resource "azurerm_monitor_data_collection_rule_association" "vm" {
  name                    = "DCRA-${local.name_prefix}-vm"
  target_resource_id      = azurerm_windows_virtual_machine.main.id
  data_collection_rule_id = azurerm_monitor_data_collection_rule.main.id

  description = "Associates the monitoring DCR with the Windows VM."

  depends_on = [
    azurerm_virtual_machine_extension.azure_monitor_agent
  ]
}

resource "azurerm_monitor_diagnostic_setting" "vm" {
  name                       = "Diagnostic-${local.name_prefix}-vm"
  target_resource_id         = azurerm_windows_virtual_machine.main.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.main.id

  enabled_metric {
    category = "AllMetrics"
  }

  depends_on = [
    azurerm_windows_virtual_machine.main,
    azurerm_log_analytics_workspace.main
  ]
}