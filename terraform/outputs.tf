output "resource_group_name" {
  description = "Name of the deployed resource group."
  value       = azurerm_resource_group.main.name
}

output "virtual_machine_name" {
  description = "Name of the Windows virtual machine."
  value       = azurerm_windows_virtual_machine.main.name
}

output "virtual_machine_private_ip" {
  description = "Private IP address assigned to the VM."
  value       = azurerm_network_interface.vm.private_ip_address
}

output "virtual_machine_public_ip" {
  description = "Public IP address assigned to the VM."
  value       = azurerm_public_ip.vm.ip_address
}

output "log_analytics_workspace_name" {
  description = "Name of the Log Analytics Workspace."
  value       = azurerm_log_analytics_workspace.main.name
}

output "action_group_name" {
  description = "Azure Monitor Action Group name."
  value       = azurerm_monitor_action_group.main.name
}

output "high_cpu_alert_name" {
  description = "Name of the high CPU metric alert."
  value       = azurerm_monitor_metric_alert.high_cpu.name
}