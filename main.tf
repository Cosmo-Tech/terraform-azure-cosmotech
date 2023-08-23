locals {
  cluster_name   = var.cluster_name != "" ? var.cluster_name : "phoenix${var.dns_record}"
  resource_group = var.resource_group != "" ? var.resource_group : var.dns_record
}

module "cosmotech-prerequisites" {
  source           = "Cosmo-Tech/cosmotech-prerequisites/azure"
  version          = "1.1.36"
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

module "cosmotech-platform" {
  source                    = "Cosmo-Tech/cosmotech-platform/azure"
  version                   = "1.0.37"
  subscription_id           = var.subscription_id
  tenant_id                 = var.tenant_id
  client_id                 = var.client_id
  client_secret             = var.client_secret
  cluster_issuer_email      = var.cluster_issuer_email
  cluster_issuer_name       = var.cluster_issuer_name
  tls_secret_name           = var.tls_secret_name
  namespace                 = var.namespace
  monitoring_namespace      = var.monitoring_namespace
  api_dns_name              = module.cosmotech-prerequisites.out_fqdn
  resource_group            = module.cosmotech-prerequisites.out_ip_resource_group
  platform_sp_client_id     = module.cosmotech-prerequisites.out_platform_sp_client_id
  platform_sp_client_secret = module.cosmotech-prerequisites.out_platform_sp_client_secret
  storage_account_key       = module.cosmotech-prerequisites.out_storage_account_key
  storage_account_name      = module.cosmotech-prerequisites.out_storage_account_name
  acr_login_password        = module.cosmotech-prerequisites.out_acr_login_password
  acr_login_server          = module.cosmotech-prerequisites.out_acr_login_server
  acr_login_username        = module.cosmotech-prerequisites.out_acr_login_username
  loadbalancer_ip           = module.cosmotech-prerequisites.out_public_ip
  adx_ingestion_uri         = module.cosmotech-prerequisites.out_adx_ingestion_uri
  adx_uri                   = module.cosmotech-prerequisites.out_adx_uri
  cosmos_uri                = module.cosmotech-prerequisites.out_cosmos_uri
  cosmos_key                = module.cosmotech-prerequisites.out_cosmos_key
  eventbus_uri              = module.cosmotech-prerequisites.out_eventbus_uri
  network_adt_clientid      = module.cosmotech-prerequisites.out_networkadt_clientid
  network_adt_password      = module.cosmotech-prerequisites.out_network_adt_password
  managed_disk_id           = module.cosmotech-prerequisites.managed_disk_id
  kube_config               = module.cosmotech-prerequisites.out_aks_phoenix_config
}