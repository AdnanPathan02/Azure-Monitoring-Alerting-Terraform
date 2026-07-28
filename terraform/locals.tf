locals {
  name_prefix = "${var.project_name}-${var.environment}"

  common_tags = {
    Project     = "Azure Monitoring and Alerting"
    Environment = var.environment
    ManagedBy   = "Terraform"
    Owner       = "Adnan Khan Pathan"
  }
}
