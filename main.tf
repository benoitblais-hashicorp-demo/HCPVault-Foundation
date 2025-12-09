resource "hcp_hvn" "this" {
  hvn_id         = var.hvn_id
  cloud_provider = var.cloud_provider
  region         = var.region
  cidr_block     = var.cidr_block
}

resource "hcp_vault_cluster" "this" {
  cluster_id        = var.cluster_id
  hvn_id            = hcp_hvn.this.hvn_id
  min_vault_version = var.min_vault_version
  public_endpoint   = var.public_endpoint
  tier              = lower(var.tier)

  major_version_upgrade_config {
    upgrade_type            = upper(var.upgrade_type)
    maintenance_window_day  = var.maintenance_window_day != null ? upper(var.maintenance_window_day) : null
    maintenance_window_time = var.maintenance_window_time != null ? upper(var.maintenance_window_time) : null
  }
  # lifecycle {
  #   prevent_destroy = true
  # }
}

resource "hcp_vault_cluster_admin_token" "this" {
  cluster_id = hcp_vault_cluster.this.cluster_id
}

data "tfe_variable_set" "this" {
  count        = var.variable_set_name != null ? 1 : 0
  name         = var.variable_set_name
  organization = var.organization
}

resource "tfe_variable" "vault_addr" {
  count           = length(data.tfe_variable_set.this) > 0 ? 1 : 0
  key             = "VAULT_ADDR"
  value           = hcp_vault_cluster.this.vault_public_endpoint_url
  category        = "env"
  variable_set_id = data.tfe_variable_set.this[0].id
}

resource "tfe_variable" "vault_token" {
  count           = length(data.tfe_variable_set.this) > 0 ? 1 : 0
  key             = "VAULT_TOKEN"
  value           = hcp_vault_cluster_admin_token.this.token
  category        = "env"
  sensitive       = true
  variable_set_id = data.tfe_variable_set.this[0].id
}