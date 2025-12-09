terraform {

  required_providers {
    hcp = {
      source  = "hashicorp/hcp"
      version = "0.110.0"
    }
    tfe = {
      source  = "hashicorp/tfe"
      version = "~>0.70"
    }
  }

  required_version = ">= 1.13.0"

}