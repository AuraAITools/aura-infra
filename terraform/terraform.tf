terraform {
  required_version = ">= 1.8.5"

cloud {
    organization = "aura-organisation"

    workspaces {
      name = "aura-infra"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0.0"
    }
  }
}