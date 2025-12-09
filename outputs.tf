output "vault_private_endpoint_url" {
  description = "The private endpoint URL of the HCP Vault cluster."
  value       = hcp_vault_cluster.this.vault_private_endpoint_url
}

output "vault_public_endpoint_url" {
  description = "The public endpoint URL of the HCP Vault cluster."
  value       = hcp_vault_cluster.this.vault_public_endpoint_url
}

output "vault_version" {
  description = "The Vault version of the HCP Vault cluster."
  value       = hcp_vault_cluster.this.vault_version
}