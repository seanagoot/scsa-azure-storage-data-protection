#!/bin/bash

# SCSA Company - Project 3
# Storage Account Deployment

az storage account create \
  --name stscsadata01 \
  --resource-group rg-scsa-storage-sea \
  --location southeastasia \
  --sku Standard_LRS \
  --kind StorageV2
