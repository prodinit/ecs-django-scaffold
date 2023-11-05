resource "aws_vpc" "vpc" {
  cidr_block           = var.VPC_CIDR_BLOCK
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = "true"

  tags = {
    "Name" : "${var.PROJECT_NAME}-vpc",
    "resource" : "${var.PROJECT_NAME}-vpc-network",
  }
}

