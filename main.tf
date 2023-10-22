# Terraform providers configuration
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.3.0"
}


# Terraform Backend configuration
terraform {
  backend "s3" {}
}

# AWS configuration
provider "aws" {
  region = var.AWS_REGION
  default_tags {
    tags = {
      purpose     = "Testing"
      product     = "Prodinit Django ECS Scaffold"
      created_by  = "Terraform"
      owner       = "Prodinit"
      environment = var.PRODUCT_ENVIRONMENT
      developers  = var.DEVELOPER_CONTACT_LIST
    }
  }
}

module "network" {
  source = "./modules/network"
}

module "security" {
  source = "./modules/security"
}

module "resources" {
  source = "./modules/resources"
  depends_on = [
    module.network,
    module.security
  ]
}
