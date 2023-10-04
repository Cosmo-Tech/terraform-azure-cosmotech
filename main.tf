locals {
  cluster_name   = var.cluster_name != "" ? var.cluster_name : "phoenix${var.dns_record}"
  resource_group = var.resource_group != "" ? var.resource_group : var.dns_record
}

module "cosmotech-common" {
  source               = "Cosmo-Tech/cosmotech-common/azure"
  version              = "0.2.1"
  client_id            = var.client_id
  client_secret        = var.client_secret
  dns_record           = var.dns_record
  owner_list           = var.owner_list
  project_name         = var.project_name
  subscription_id      = var.subscription_id
  tenant_id            = var.tenant_id
  namespace            = var.namespace
  vault_addr           = var.vault_addr
  vault_token          = var.vault_token
}

# data "terraform_remote_state" "state" {
#   backend = "azurerm"
#   config = {
#     resource_group_name  = "${var.tf_resource_group_name}"
#     storage_account_name = "${var.tf_storage_account_name}"
#     container_name       = "${var.tf_container_name}"
#     key                  = "${var.tf_blob_name}"
#     access_key           = "${var.tf_access_key}"
#   }
# }