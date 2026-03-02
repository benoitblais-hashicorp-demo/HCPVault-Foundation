terraform {

  required_providers {
    hcp = {
      source  = "hashicorp/hcp"
      version = "0.111.0"
    }
    tfe = {
      source  = "hashicorp/tfe"
      version = "~> 0.74"
    }
  }

  required_version = ">= 1.13.0"

}
