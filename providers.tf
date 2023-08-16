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
  # backend "azurerm" {
  #   resource_group_name  = "terraform-state"
  #   storage_account_name = "csmterraformstate"
  #   container_name       = "${var.dns_record}-tfstate"
  #   key                  = "terraform.tfstate"
  # }
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