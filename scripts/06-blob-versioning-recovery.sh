#!/bin/bash

# SCSA Company - Project 3
# Blob Versioning and Recovery Demonstration

# Create Version 1
echo "SCSA Company - Project 3 - Version 1" > scsa-appdata.txt

az storage blob upload \
  --account-name stscsadata01 \
  --container-name appdata \
  --name scsa-appdata.txt \
  --file scsa-appdata.txt \
  --auth-mode login \
  --overwrite

# Create Version 2
echo "SCSA Company - Project 3 - Version 2" > scsa-appdata.txt

az storage blob upload \
  --account-name stscsadata01 \
  --container-name appdata \
  --name scsa-appdata.txt \
  --file scsa-appdata.txt \
  --auth-mode login \
  --overwrite

# Display available versions
az storage blob list \
  --account-name stscsadata01 \
  --container-name appdata \
  --include v \
  --auth-mode login \
  --query "[].{Name:name,VersionId:versionId,Current:isCurrentVersion}" \
  --output table
