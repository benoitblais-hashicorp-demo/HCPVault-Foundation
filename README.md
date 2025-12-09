<!-- BEGIN_TF_DOCS -->
# HCP Vault Foundation

Code which manages configuration and life-cycle of all the HCP Vault foundation. It is designed to be used from a dedicated VCS-Driven Terraform workspace that would provision and manage the configuration using Terraform code (IaC).

## Permissions

### HCP Permissions

To manage the resources from that code, provide a Client ID and a Client Secret from a service principal key with `admin` permissions.

### HCP Terraform Permissions

To manage the resources from that code, provide a token from an account with
`owner` permissions. Alternatively, you can use a token from the `owner` team
instead of a user token.

## Authentication

### HCP Authentication

The HCP provider requires a `Client ID` and a `Client Secret` from a service principal key in order to manage resources.

There are several ways to provide the required informations:

* Set the `client_id` and `client_secret` argument in the provider configuration. Use input variables.
* Set the `HCP_CLIENT_ID` and `HCP_CLIENT_SECRET` environment variables.

### HCP Terraform Authentication

The HCP Terraform provider requires a HCP Terraform/Terraform Enterprise API token in
order to manage resources.

There are several ways to provide the required token:

* Set the `token` argument in the provider configuration. You can set the token argument in the provider configuration. Use an
input variable for the token.
* Set the `TFE_TOKEN` environment variable. The provider can read the TFE\\_TOKEN environment variable and the token stored there
to authenticate.

## Features

* HCP Virtual Network
* HCP Vault Cluster
  * Aadmin Token
* HCP Terraform Variables

## Prerequisite

In order to deploy the configuration from this code, you must first create a HCP Terraform
Project which will contain all workspaces used to managed Vault.

You must then create a variable set which will contain all the required variable to
authenticate to Vault.

## Documentation

## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (>= 1.13.0)

- <a name="requirement_hcp"></a> [hcp](#requirement\_hcp) (0.110.0)

- <a name="requirement_tfe"></a> [tfe](#requirement\_tfe) (~>0.70)

## Modules

No modules.

## Required Inputs

No required inputs.

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_cidr_block"></a> [cidr\_block](#input\_cidr\_block)

Description: (Optional) The CIDR range of the HVN. If this is not provided, the service will provide a default value.

Type: `string`

Default: `"172.25.16.0/20"`

### <a name="input_cloud_provider"></a> [cloud\_provider](#input\_cloud\_provider)

Description: (Optional) The provider where the HVN is located. The provider 'aws' is generally available and 'azure' is in public beta..

Type: `string`

Default: `"aws"`

### <a name="input_cluster_id"></a> [cluster\_id](#input\_cluster\_id)

Description: (Optional) The ID of the HCP Vault cluster.

Type: `string`

Default: `"vault-cluster"`

### <a name="input_hvn_id"></a> [hvn\_id](#input\_hvn\_id)

Description: (Optional) The ID of the HashiCorp Virtual Network (HVN).

Type: `string`

Default: `"hvn"`

### <a name="input_maintenance_window_day"></a> [maintenance\_window\_day](#input\_maintenance\_window\_day)

Description: (Optional) The maintenance day of the week for scheduled upgrades. Valid options for maintenance window day - `monday`, `tuesday`, `wednesday`, `thursday`, `friday`, `saturday`, `sunday`

Type: `string`

Default: `null`

### <a name="input_maintenance_window_time"></a> [maintenance\_window\_time](#input\_maintenance\_window\_time)

Description: (Optional) The maintenance time frame for scheduled upgrades. Valid options for maintenance window time - WINDOW\_12AM\_4AM, WINDOW\_6AM\_10AM, WINDOW\_12PM\_4PM, WINDOW\_6PM\_10PM.

Type: `string`

Default: `null`

### <a name="input_min_vault_version"></a> [min\_vault\_version](#input\_min\_vault\_version)

Description: (Optional) The minimum Vault version to use when creating the cluster. If not specified, it is defaulted to the version that is currently recommended by HCP.

Type: `string`

Default: `null`

### <a name="input_organization"></a> [organization](#input\_organization)

Description: (Optional) Name of the organization.

Type: `string`

Default: `null`

### <a name="input_public_endpoint"></a> [public\_endpoint](#input\_public\_endpoint)

Description: (Optional) Whether the Vault cluster should have a public endpoint.

Type: `bool`

Default: `true`

### <a name="input_region"></a> [region](#input\_region)

Description: (Optional) The region where the HVN is located.

Type: `string`

Default: `"ca-central-1"`

### <a name="input_tier"></a> [tier](#input\_tier)

Description: (Optional) Tier of the HCP Vault cluster. Valid options for tiers - `dev`, `standard_small`, `standard_medium`, `standard_large`, `plus_small`, `plus_medium`, `plus_large`.

Type: `string`

Default: `"dev"`

### <a name="input_upgrade_type"></a> [upgrade\_type](#input\_upgrade\_type)

Description: (Optional) The type of major version upgrade to perform. Valid options are `AUTOMATIC`, `SCHEDULED`, and `MANUAL`.

Type: `string`

Default: `null`

### <a name="input_variable_set_name"></a> [variable\_set\_name](#input\_variable\_set\_name)

Description: (Optional) Name of the HCP Terraformvariable set.

Type: `string`

Default: `"hcp-vault-hcp"`

## Resources

The following resources are used by this module:

- [hcp_hvn.this](https://registry.terraform.io/providers/hashicorp/hcp/0.110.0/docs/resources/hvn) (resource)
- [hcp_vault_cluster.this](https://registry.terraform.io/providers/hashicorp/hcp/0.110.0/docs/resources/vault_cluster) (resource)
- [hcp_vault_cluster_admin_token.this](https://registry.terraform.io/providers/hashicorp/hcp/0.110.0/docs/resources/vault_cluster_admin_token) (resource)
- [tfe_variable.vault_addr](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable) (resource)
- [tfe_variable.vault_token](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable) (resource)
- [tfe_variable_set.this](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/data-sources/variable_set) (data source)

## Outputs

The following outputs are exported:

### <a name="output_vault_private_endpoint_url"></a> [vault\_private\_endpoint\_url](#output\_vault\_private\_endpoint\_url)

Description: The private endpoint URL of the HCP Vault cluster.

### <a name="output_vault_public_endpoint_url"></a> [vault\_public\_endpoint\_url](#output\_vault\_public\_endpoint\_url)

Description: The public endpoint URL of the HCP Vault cluster.

### <a name="output_vault_version"></a> [vault\_version](#output\_vault\_version)

Description: The Vault version of the HCP Vault cluster.

<!-- markdownlint-enable -->
<!-- END_TF_DOCS -->