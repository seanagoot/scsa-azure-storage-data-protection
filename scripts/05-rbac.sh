#!/bin/bash

# SCSA Company - Project 3
# Storage Blob RBAC Assignment

# Automatically retrieve the signed-in user's Entra object ID.
USER_OBJECT_ID=$(az ad signed-in-user show \
  --query id \
  --output tsv)

# Retrieve the storage account resource ID.
STORAGE_SCOPE=$(az storage account show \
  --name stscsadata01 \
  --resource-group rg-scsa-storage-sea \
  --query id \
  --output tsv)

# Assign Blob data-plane permissions.
az role assignment create \
  --assignee-object-id "$USER_OBJECT_ID" \
  --assignee-principal-type User \
  --role "Storage Blob Data Contributor" \
  --scope "$STORAGE_SCOPE"
