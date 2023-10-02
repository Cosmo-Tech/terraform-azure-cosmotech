locals {
  cluster_name   = var.cluster_name != "" ? var.cluster_name : "phoenix${var.dns_record}"
  resource_group = var.resource_group != "" ? var.resource_group : var.dns_record
}

module "cosmotech-prerequisites" {
  source           = "Cosmo-Tech/cosmotech-prerequisites/azure"
  version          = "1.1.37"
  client_id        = var.client_id
  client_secret    = var.client_secret
  tenant_id        = var.tenant_id
  subscription_id  = var.subscription_id
  platform_url     = var.platform_url
  identifier_uri   = var.identifier_uri
  project_stage    = var.project_stage
  customer_name    = var.customer_name
  project_name     = var.project_name
  owner_list       = var.owner_list
  audience         = var.audience
  webapp_url       = var.webapp_url
  dns_zone_name    = var.dns_zone_name
  dns_zone_rg      = var.dns_zone_rg
  dns_record       = var.dns_record
  vnet_iprange     = var.vnet_iprange
  api_version_path = var.api_version_path
  resource_group   = local.resource_group
  image_path       = var.image_path
  cluster_name     = local.cluster_name
  create_cosmosdb  = var.create_cosmosdb
}

module "cosmotech-common" {
  source               = "Cosmo-Tech/cosmotech-common/azure"
  version              = "0.2.0"
  client_id            = var.client_id
  client_secret        = var.client_secret
  dns_record           = var.dns_record
  owner_list           = var.owner_list
  subscription_id      = var.subscription_id
  tenant_id            = var.tenant_id
  cluster_issuer_email = var.cluster_issuer_email
  cluster_issuer_name  = var.cluster_issuer_name
  tls_secret_name      = var.tls_secret_name
  namespace            = var.namespace
  project_name         = var.project_name
  vault_addr           = var.vault_addr
  vault_token          = var.vault_token
}

data "terraform_remote_state" "state" {
  backend = "azurerm"
  config = {
    resource_group_name  = "${var.tf_resource_group_name}"
    storage_account_name = "${var.tf_storage_account_name}"
    container_name       = "${var.tf_container_name}"
    key                  = "${var.tf_blob_name}"
    access_key           = "${var.tf_access_key}"
  }
}