#!/bin/bash

# SCSA Company - Project 3
# Blob Container and Azure File Share

# Create private Blob container
az storage container create \
  --account-name stscsadata01 \
  --name appdata \
  --auth-mode login

# Create Azure File Share
az storage share-rm create \
  --resource-group rg-scsa-storage-sea \
  --storage-account stscsadata01 \
  --name scsa-shared \
  --quota 10
