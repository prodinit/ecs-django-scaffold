variable "PROJECT_NAME" {
  type        = string
  description = "Name of the project"
  default = "prodinit"
}

variable "DEVELOPER_CONTACT_LIST" {
  type        = string
  description = "Comma separated email for developers"
  default = "dishant@prodinit.com"
}

variable "AWS_REGION" {
  type        = string
  description = "AWS region"
  default     = "us-east-1"
}

variable "PRODUCT_ENVIRONMENT" {
  type        = string
  description = "Product environment"
  default     = "dev"
}