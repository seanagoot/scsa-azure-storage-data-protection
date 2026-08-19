#!/bin/bash

# SCSA Company - Project 3
# Blob and File Share Data Protection

# Enable Blob soft delete and versioning
az storage account blob-service-properties update \
  --account-name stscsadata01 \
  --resource-group rg-scsa-storage-sea \
  --enable-delete-retention true \
  --delete-retention-days 14 \
  --enable-versioning true

# Enable container soft delete
az storage account blob-service-properties update \
  --account-name stscsadata01 \
  --resource-group rg-scsa-storage-sea \
  --enable-container-delete-retention true \
  --container-delete-retention-days 14

# Enable Azure Files soft delete
az storage account file-service-properties update \
  --account-name stscsadata01 \
  --resource-group rg-scsa-storage-sea \
  --enable-delete-retention true \
  --delete-retention-days 14
