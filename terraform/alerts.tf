resource "azurerm_monitor_action_group" "main" {
  name                = "AG-${local.name_prefix}-email"
  resource_group_name = azurerm_resource_group.main.name
  short_name          = "MonitorAG"

  email_receiver {
    name                    = "CloudAdministrator"
    email_address           = var.administrator_email
    use_common_alert_schema = true
  }

  tags = local.common_tags
}

resource "azurerm_monitor_metric_alert" "high_cpu" {
  name                = "Alert-High-CPU-${local.name_prefix}"
  resource_group_name = azurerm_resource_group.main.name

  scopes = [
    azurerm_windows_virtual_machine.main.id
  ]

  description = "Triggers when average VM CPU exceeds the configured threshold."
  severity    = 2
  enabled     = true

  frequency   = "PT1M"
  window_size = "PT5M"

  auto_mitigate = true

  criteria {
    metric_namespace = "Microsoft.Compute/virtualMachines"
    metric_name      = "Percentage CPU"
    aggregation      = "Average"
    operator         = "GreaterThan"
    threshold        = var.high_cpu_threshold
  }

  action {
    action_group_id = azurerm_monitor_action_group.main.id
  }

  tags = local.common_tags
}

resource "azurerm_monitor_scheduled_query_rules_alert_v2" "low_memory" {
  name                = "Alert-Low-Memory-${local.name_prefix}"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location

  scopes = [
    azurerm_log_analytics_workspace.main.id
  ]

  description          = "Triggers when available memory falls below 500 MB."
  severity             = 2
  enabled              = true
  evaluation_frequency = "PT5M"
  window_duration      = "PT5M"

  criteria {
    query = <<-QUERY
      Perf
      | where Computer == "${azurerm_windows_virtual_machine.main.computer_name}"
      | where ObjectName == "Memory"
      | where CounterName == "Available MBytes"
      | summarize AvailableMemoryMB = avg(CounterValue)
          by bin(TimeGenerated, 5m)
      | where AvailableMemoryMB < 500
    QUERY

    time_aggregation_method = "Count"
    threshold               = 0
    operator                = "GreaterThan"

    failing_periods {
      minimum_failing_periods_to_trigger_alert = 1
      number_of_evaluation_periods             = 1
    }
  }

  action {
    action_groups = [
      azurerm_monitor_action_group.main.id
    ]
  }

  depends_on = [
    azurerm_monitor_data_collection_rule_association.vm
  ]

  tags = local.common_tags
}