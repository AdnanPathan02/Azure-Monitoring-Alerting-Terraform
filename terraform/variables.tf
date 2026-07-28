variable "subscription_id" {
  description = "Azure subscription ID."
  type        = string
  sensitive   = true
}

variable "location" {
  description = "Azure region used for project resources."
  type        = string
  default     = "Central India"
}

variable "resource_group_name" {
  description = "Name of the project resource group."
  type        = string
  default     = "RG-Azure-Monitoring-Terraform"
}

variable "project_name" {
  description = "Short project name used in Azure resource names."
  type        = string
  default     = "monitoring"
}

variable "environment" {
  description = "Deployment environment."
  type        = string
  default     = "lab"

  validation {
    condition = contains(
      ["dev", "test", "lab", "prod"],
      var.environment
    )

    error_message = "Environment must be dev, test, lab, or prod."
  }
}

variable "admin_username" {
  description = "Administrator username for the Windows virtual machine."
  type        = string
  default     = "azureadmin"
}

variable "admin_password" {
  description = "Administrator password for the Windows virtual machine."
  type        = string
  sensitive   = true
}

variable "administrator_email" {
  description = "Email address used by the Azure Monitor Action Group."
  type        = string
  sensitive   = true
}

variable "allowed_rdp_source" {
  description = "Public IPv4 address or CIDR permitted to access RDP."
  type        = string
  default     = "0.0.0.0/0"
}

variable "vm_size" {
  description = "Azure virtual machine size."
  type        = string
  default     = "Standard_B1s"
}

variable "high_cpu_threshold" {
  description = "CPU percentage at which the metric alert fires."
  type        = number
  default     = 80

  validation {
    condition = (
      var.high_cpu_threshold > 0 &&
      var.high_cpu_threshold <= 100
    )

    error_message = "CPU threshold must be between 1 and 100."
  }
}