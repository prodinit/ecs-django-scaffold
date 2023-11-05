variable "VPC_CIDR_BLOCK" {
  type        = string
  description = "CIDR block for VPC"
  default     = "15.0.0.0/16"
}

variable "PROJECT_NAME" {
  type        = string
  description = "Name of the project"
  default     = "prodinit"
}

variable "PUBLIC_SUBNET_CIDRS" {
  type        = list(any)
  description = "List of public subnet cidr"
  default     = ["15.0.0.0/20", "15.0.16.0/20"]
}

variable "PRIVATE_SUBNET_CIDRS" {
  type        = list(any)
  description = "List of private subnet cidr"
}

variable "AWS_REGION" {
  type        = string
  description = "AWS region"
  default     = "us-east-1"
}

variable "DATABASE_PASSWORD" {
  type        = string
  description = "Password for RDS Postgres database"
}
