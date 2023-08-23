terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.54.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "2.38.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.20.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "arch3-state"
    storage_account_name = "arch3teststate"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
    access_key           = "aX4mSAuwEG4X1ryLljJg743IqqdX/bq46tMFQMjk6IREhasuvolk8xd8cOm5bQdNVRndbrD6NwWx+AStpWYtMg=="
  }
  required_version = ">= 1.3.9"
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
}

provider "azuread" {
  tenant_id     = var.tenant_id
  client_id     = var.client_id
  client_secret = var.client_secret
}