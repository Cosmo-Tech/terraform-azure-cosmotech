variable "resource_group" {
  type    = string
  default = ""
}

variable "cluster_name" {
  type    = string
  default = ""
}

variable "client_id" {
  type        = string
  description = "The client id"
}

variable "client_secret" {
  type        = string
  description = "The client secret"
}

variable "namespace" {
  type    = string
  default = "phoenix"
}

variable "monitoring_namespace" {
  type    = string
  default = "phoenix-monitoring"
}

variable "loadbalancer_ip" {
  type    = string
  default = ""
}

variable "tls_secret_name" {
  type    = string
  default = ""
}

variable "api_dns_name" {
  type    = string
  default = ""
}

variable "cluster_issuer_email" {
  type    = string
  default = "platform@cosmotech.com"
}

variable "cluster_issuer_name" {
  type    = string
  default = ""
}

variable "ingress_nginx_version" {
  type    = string
  default = "4.2.1"
}

variable "acr_login_password" {
  type    = string
  default = ""
}

variable "acr_login_server" {
  type    = string
  default = ""
}

variable "argo_minio_access_key" {
  type    = string
  default = ""
}

variable "acr_login_username" {
  type    = string
  default = ""
}

variable "cosmos_key" {
  type    = string
  default = "default"
}

variable "chart_package_version" {
  type    = string
  default = "2.3.9-rc"
}

variable "cosmos_uri" {
  type    = string
  default = "default"
}

variable "adx_uri" {
  type    = string
  default = ""
}

variable "adx_ingestion_uri" {
  type    = string
  default = ""
}

variable "eventbus_uri" {
  type    = string
  default = ""
}

variable "storage_account_key" {
  type    = string
  default = ""
}

variable "storage_account_name" {
  type    = string
  default = ""
}

variable "disk_size_gb" {
  type    = string
  default = "64"
}

variable "disk_sku" {
  type    = string
  default = "Premium_LRS"
}

variable "disk_tier" {
  type    = string
  default = "P6"
}

variable "kubernetes_version" {
  type    = string
  default = "1.25.6"
}

variable "tenant_id" {
  description = "The tenant id"
  type        = string
}

variable "subscription_id" {
  description = "The subscription id"
  type        = string
}

variable "platform_url" {
  description = "The platform url"
  type        = string
  default     = ""
}

variable "identifier_uri" {
  description = "The platform identifier uri"
  type        = string
  default     = ""
}

variable "project_stage" {
  description = "The Project stage"
  type        = string
  default     = "Dev"
  validation {
    condition = contains([
      "OnBoarding",
      "Dev",
      "QA",
      "IA",
      "EA",
      "Doc",
      "Support",
      "Demo",
      "Prod",
      "PreProd"
    ], var.project_stage)
    error_message = "Stage must be either: OnBoarding, Dev, QA, IA, EA, Demo, Prod, PreProd, Doc, Support."
  }
}

variable "customer_name" {
  description = "The customer name"
  type        = string
  default     = "cosmotech"
}

variable "project_name" {
  description = "The project name"
  type        = string
}

variable "owner_list" {
  description = "List of mail addresses for App Registration owners"
  type        = list(string)
}

variable "audience" {
  description = "The App Registration audience type"
  type        = string
  validation {
    condition = contains([
      "AzureADMyOrg",
      "AzureADMultipleOrgs"
    ], var.audience)
    error_message = "Only AzureADMyOrg and AzureADMultipleOrgs are supported for audience."
  }
  default = "AzureADMultipleOrgs"
}

variable "location" {
  description = "The Azure location"
  default     = "West Europe"
}

variable "webapp_url" {
  description = "The Web Application URL"
  type        = string
  default     = ""
}

variable "create_restish" {
  description = "Create the Azure Active Directory Application for Restish"
  type        = bool
  default     = true
}

variable "create_powerbi" {
  description = "Create the Azure Active Directory Application for PowerBI"
  type        = bool
  default     = true
}

variable "create_webapp" {
  description = "Create the Azure Active Directory Application for WebApp"
  type        = bool
  default     = true
}

variable "create_publicip" {
  description = "Create the public IP for the platform"
  type        = bool
  default     = true
}

variable "create_dnsrecord" {
  description = "Create the DNS record"
  type        = bool
  default     = true
}

variable "create_vnet" {
  description = "Create the Virtual Network for AKS"
  type        = bool
  default     = true
}

variable "create_secrets" {
  description = "Create secret for application registrtations"
  type        = bool
  default     = true
}

variable "dns_zone_name" {
  description = "The DNS zone name to create platform subdomain. Example: api.cosmotech.com"
  type        = string
  default     = "api.cosmotech.com"
}

variable "dns_zone_rg" {
  description = "The DNS zone resource group"
  type        = string
  default     = "phoenix"
}

variable "dns_record" {
  description = "The DNS zone name to create platform subdomain. Example: myplatform"
  type        = string
}

variable "vnet_iprange" {
  description = "The Virtual Network IP range. Minimum /26 NetMaskLength"
  type        = string
  default     = ""
}

variable "api_version_path" {
  description = "The API version path"
  type        = string
  default     = "/"
}

variable "image_path" {
  type    = string
  default = "./cosmotech.png"
}

variable "managed_disk_name" {
  type    = string
  default = ""
}

variable "network_adt_clientid" {
  type    = string
  default = ""
}

variable "network_adt_password" {
  type    = string
  default = ""
}

variable "create_cosmosdb" {
  type    = bool
  default = false
}

variable "vault_addr" {
  type = string
}

variable "vault_token" {
  type = string
}

variable "tf_resource_group_name" {
  type    = string
  default = ""
}

variable "tf_storage_account_name" {
  type    = string
  default = ""
}

variable "tf_container_name" {
  type    = string
  default = ""
}

variable "tf_blob_name" {
  type    = string
  default = ""
}

variable "tf_access_key" {
  type    = string
  default = ""
}

variable "deployment_type" {
  type = string
}

variable "subnet_id" {
  type = string
}
