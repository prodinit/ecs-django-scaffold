variable "PROJECT_NAME" {
  type        = string
  description = "Name of the project"
  default = "prodinit"
}

variable "PRODUCT_ENVIRONMENT" {
  type        = string
  description = "Product environment"
  default     = "dev"
}

variable "DESIRED_CAPACITY" {
  type = number
  description = "Desired capacity of ECS service"
  default = 1
}

# variable "VPC_ID" {
#   description = "VPC ID"
#   type        = string
# }

variable "AWS_S3_BUCKET" {
  description = "VPC ID"
  type        = string
  default = "prodinit-tf-state"
}

# variable "PUBLIC_SUBNET_IDS" {
#   type        = list(any)
#   description = "List of public subnet ids"
# }

# variable "SECURITY_GROUP_IDS" {
#   type        = list(any)
#   description = "List of security group ids"
# }

# variable "PRIVATE_SUBNET_IDS" {
#   type        = list(any)
#   description = "List of public subnet ids"
# }

variable "AWS_REGION" {
  type        = string
  description = "AWS region"
  default     = "us-east-1"
}