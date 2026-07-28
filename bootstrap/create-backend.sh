#!/usr/bin/env bash

set -e

LOCATION="centralindia"
RESOURCE_GROUP="RG-Terraform-State"
STORAGE_ACCOUNT="stadnantfstate2601"
CONTAINER_NAME="tfstate"

echo "Creating Terraform backend resource group..."

az group create \
  --name "$RESOURCE_GROUP" \
  --location "$LOCATION"

echo "Creating Terraform backend storage account..."

az storage account create \
  --name "$STORAGE_ACCOUNT" \
  --resource-group "$RESOURCE_GROUP" \
  --location "$LOCATION" \
  --sku Standard_LRS \
  --kind StorageV2 \
  --min-tls-version TLS1_2 \
  --allow-blob-public-access false

echo "Getting storage account key..."

ACCOUNT_KEY=$(az storage account keys list \
  --resource-group "$RESOURCE_GROUP" \
  --account-name "$STORAGE_ACCOUNT" \
  --query "[0].value" \
  --output tsv)

echo "Creating Blob container..."

az storage container create \
  --name "$CONTAINER_NAME" \
  --account-name "$STORAGE_ACCOUNT" \
  --account-key "$ACCOUNT_KEY"

echo "Terraform backend created successfully."
echo "Resource Group: $RESOURCE_GROUP"
echo "Storage Account: $STORAGE_ACCOUNT"
echo "Container: $CONTAINER_NAME"