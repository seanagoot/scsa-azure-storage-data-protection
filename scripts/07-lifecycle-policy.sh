#!/bin/bash

# SCSA Company - Project 3
# Blob Lifecycle Management Policy

cat > lifecycle-policy.json <<'EOF'
{
  "rules": [
    {
      "enabled": true,
      "name": "scsa-appdata-lifecycle",
      "type": "Lifecycle",
      "definition": {
        "actions": {
          "baseBlob": {
            "tierToCool": {
              "daysAfterModificationGreaterThan": 30
            },
            "delete": {
              "daysAfterModificationGreaterThan": 365
            }
          }
        },
        "filters": {
          "blobTypes": [
            "blockBlob"
          ],
          "prefixMatch": [
            "appdata/"
          ]
        }
      }
    }
  ]
}
EOF

az storage account management-policy create \
  --account-name stscsadata01 \
  --resource-group rg-scsa-storage-sea \
  --policy @lifecycle-policy.json
