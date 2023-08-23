#!/bin/bash

RESOURCE_GROUP_NAME="arch3-state"
STORAGE_ACCOUNT_NAME="arch3teststate"
CONTAINER_NAME="tfstate"
LOCATION="westeurope"

az group create --name $RESOURCE_GROUP_NAME --location $LOCATION

az storage account create --resource-group $RESOURCE_GROUP_NAME --name $STORAGE_ACCOUNT_NAME --sku Standard_LRS --encryption-services blob

ACCOUNT_KEY=$(az storage account keys list --resource-group $RESOURCE_GROUP_NAME --account-name $STORAGE_ACCOUNT_NAME --query "[0].value" -o tsv)

az storage container create --name $CONTAINER_NAME --account-name $STORAGE_ACCOUNT_NAME --account-key $ACCOUNT_KEY

echo "resource_group_name: $RESOURCE_GROUP_NAME"

echo "storage_account_name: $STORAGE_ACCOUNT_NAME"

echo "container_name: $CONTAINER_NAME"

echo “access_key: $ACCOUNT_KEY”