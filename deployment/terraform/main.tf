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

module "security" {
  source = "./modules/security"
}

module "network" {
  source = "./modules/network"

  PRIVATE_SUBNET_CIDRS = var.PRIVATE_SUBNET_CIDRS
  DATABASE_PASSWORD    = var.DATABASE_PASSWORD
}

module "resources" {
  source = "./modules/resources"

  depends_on = [
    module.network
  ]

  VPC_ID             = module.network.VPC_ID
  PRIVATE_SUBNET_IDS = module.network.PRIVATE_SUBNET_IDS
  PUBLIC_SUBNET_IDS  = module.network.PUBLIC_SUBNET_IDS
  SECURITY_GROUP_IDS = module.network.SECURITY_GROUP_IDS

  BUILD_ID                    = var.BUILD_ID
  DEBUG                       = var.DEBUG
  DJANGO_SETTINGS_MODULE      = var.DJANGO_SETTINGS_MODULE
  DJANGO_ADMIN_URL            = var.DJANGO_ADMIN_URL
  DJANGO_SECRET_KEY           = var.DJANGO_SECRET_KEY
  ALLOWED_HOSTS               = var.ALLOWED_HOSTS
  TIME_ZONE                   = var.TIME_ZONE
  CORS_ALLOWED_ORIGINS        = var.CORS_ALLOWED_ORIGINS
  DEFAULT_FROM_EMAIL          = var.DEFAULT_FROM_EMAIL
  EMAIL_HOST                  = var.EMAIL_HOST
  EMAIL_HOST_PASSWORD         = var.EMAIL_HOST_PASSWORD
  DOMAIN                      = var.DOMAIN
  AWS_ACCESS_KEY_ID           = var.AWS_ACCESS_KEY_ID
  AWS_SECRET_ACCESS_KEY       = var.AWS_SECRET_ACCESS_KEY
  GOOGLE_OAUTH2_CLIENT_ID     = var.GOOGLE_OAUTH2_CLIENT_ID
  GOOGLE_OAUTH2_CLIENT_SECRET = var.GOOGLE_OAUTH2_CLIENT_SECRET
  GOOGLE_OAUTH2_PROJECT_ID    = var.GOOGLE_OAUTH2_PROJECT_ID
  DATABASE_URL                = module.network.DATABASE_URL
  ecr_task_exec_role_arn      = module.security.ecr_task_execution_arn
}
