terraform {
  backend "azurerm" {
    resource_group_name  = "RG-Terraform-State"
    storage_account_name = "stadnantfstate2601"
    container_name       = "tfstate"
    key                  = "azure-monitoring.tfstate"
    use_azuread_auth     = true
  }
}