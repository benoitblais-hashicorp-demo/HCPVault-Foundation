variable "bootstrap_workspace_name" {
  description = "(Optional) Name of workspace used to bootstrap the HCP Vault dedicated."
  type        = string
  nullable    = true
  default     = "HCPVault-Bootstrap"
}

variable "cidr_block" {
  description = "(Optional) The CIDR range of the HVN. If this is not provided, the service will provide a default value."
  type        = string
  nullable    = true
  default     = "172.25.16.0/20"

  validation {
    condition     = var.cidr_block == null || can(cidrhost(var.cidr_block, 0))
    error_message = "Value must be a valid CIDR block."
  }
}

variable "cloud_provider" {
  description = "(Optional) The provider where the HVN is located. The provider 'aws' is generally available and 'azure' is in public beta.."
  type        = string
  nullable    = false
  default     = "aws"

  validation {
    condition     = contains(["aws", "azure"], var.cloud_provider)
    error_message = "Value must be either 'aws' or 'azure'"
  }
}

variable "cluster_id" {
  description = "(Optional) The ID of the HCP Vault cluster."
  type        = string
  nullable    = false
  default     = "vault-cluster"
}

variable "hvn_id" {
  description = "(Optional) The ID of the HashiCorp Virtual Network (HVN)."
  type        = string
  nullable    = false
  default     = "hvn"
}

variable "maintenance_window_day" {
  description = "(Optional) The maintenance day of the week for scheduled upgrades. Valid options for maintenance window day - `monday`, `tuesday`, `wednesday`, `thursday`, `friday`, `saturday`, `sunday`"
  type        = string
  nullable    = true
  default     = null

  validation {
    condition     = var.maintenance_window_day == null || contains(["SUNDAY", "MONDAY", "TUESDAY", "WEDNESDAY", "THURSDAY", "FRIDAY", "SATURDAY"], upper(var.maintenance_window_day))
    error_message = "Valid options for maintenance_window_day are \"SUNDAY\", \"MONDAY\", \"TUESDAY\", \"WEDNESDAY\", \"THURSDAY\", \"FRIDAY\", and \"SATURDAY\"."
  }
  validation {
    condition     = var.maintenance_window_day != null || var.upgrade_type != "scheduled"
    error_message = "Required if `upgrade_type` is set to `scheduled`."
  }
}

variable "maintenance_window_time" {
  description = "(Optional) The maintenance time frame for scheduled upgrades. Valid options for maintenance window time - WINDOW_12AM_4AM, WINDOW_6AM_10AM, WINDOW_12PM_4PM, WINDOW_6PM_10PM."
  type        = string
  nullable    = true
  default     = null

  validation {
    condition     = var.maintenance_window_time == null || contains(["WINDOW_12AM_4AM", "WINDOW_6AM_10AM", "WINDOW_12PM_4PM", "WINDOW_6PM_10PM"], upper(var.maintenance_window_time))
    error_message = "Valid options for maintenance_window_time are \"WINDOW_12AM_4AM\", \"WINDOW_6AM_10AM\", \"WINDOW_12PM_4PM\", and \"WINDOW_6PM_10PM\"."
  }
  validation {
    condition     = var.maintenance_window_time != null || var.upgrade_type != "scheduled"
    error_message = "Required if `upgrade_type` is set to `scheduled`."
  }
}

variable "min_vault_version" {
  description = "(Optional) The minimum Vault version to use when creating the cluster. If not specified, it is defaulted to the version that is currently recommended by HCP."
  type        = string
  nullable    = true
  default     = null

  validation {
    condition     = var.min_vault_version == null || can(regex("^\\d+\\.\\d+(\\.\\d+)?$", var.min_vault_version))
    error_message = "Value must be a valid Vault version in the format 'X.Y.Z'."
  }
}

variable "organization" {
  description = "(Optional) Name of the organization."
  type        = string
  nullable    = true
  default     = null
}

variable "public_endpoint" {
  description = "(Optional) Whether the Vault cluster should have a public endpoint."
  type        = bool
  default     = true
}

variable "region" {
  description = "(Optional) The region where the HVN is located."
  type        = string
  nullable    = false
  default     = "ca-central-1"
}

variable "tier" {
  description = "(Optional) Tier of the HCP Vault cluster. Valid options for tiers - `dev`, `standard_small`, `standard_medium`, `standard_large`, `plus_small`, `plus_medium`, `plus_large`."
  type        = string
  nullable    = false
  default     = "dev"

  validation {
    condition     = contains(["dev", "standard_small", "standard_medium", "standard_large", "plus_small", "plus_medium", "plus_large"], lower(var.tier))
    error_message = "Valid options for tiers are \"dev\", \"standard_small\", \"standard_medium\", \"standard_large\", \"plus_small\", \"plus_medium\", \"plus_large\"."
  }
}

variable "upgrade_type" {
  description = "(Optional) The type of major version upgrade to perform. Valid options are `AUTOMATIC`, `SCHEDULED`, and `MANUAL`."
  type        = string
  nullable    = true
  default     = null

  validation {
    condition     = var.upgrade_type == null || contains(["AUTOMATIC", "SCHEDULED", "MANUAL"], upper(var.upgrade_type))
    error_message = "Valid options for upgrade_type are \"automatic\", \"scheduled\", and \"manual\"."
  }
}

