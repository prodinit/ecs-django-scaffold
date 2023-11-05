variable "PROJECT_NAME" {
  type        = string
  description = "Name of the project"
  default     = "prodinit"
}

variable "PRODUCT_ENVIRONMENT" {
  type        = string
  description = "Product environment"
  default     = "dev"
}

variable "DESIRED_CAPACITY" {
  type        = number
  description = "Desired capacity of ECS service"
  default     = 1
}

variable "VPC_ID" {
  description = "VPC ID"
  type        = string
}

variable "AWS_S3_BUCKET" {
  description = "S3 Backend Bucket"
  type        = string
  default     = "prodinit-tf-state"
}

variable "PUBLIC_SUBNET_IDS" {
  type        = list(any)
  description = "List of public subnet ids"
}

variable "SECURITY_GROUP_IDS" {
  type        = list(any)
  description = "List of security group ids"
}

variable "PRIVATE_SUBNET_IDS" {
  type        = list(any)
  description = "List of private subnet ids"
}

variable "AWS_REGION" {
  type        = string
  description = "AWS region"
  default     = "us-east-1"
}

variable "BUILD_ID" {
  type        = string
  description = "BUILD ID"
}

variable "DEBUG" {
  type        = string
  description = "Django Debug"
}

variable "DJANGO_SETTINGS_MODULE" {
  type        = string
  description = "Django settings"
}

variable "DJANGO_ADMIN_URL" {
  type        = string
  description = "Django admin url"
}

variable "DJANGO_SECRET_KEY" {
  type        = string
  description = "Django secret key"
}

variable "ALLOWED_HOSTS" {
  type        = list(string)
  description = "Allowed hosts"
}

variable "TIME_ZONE" {
  type        = string
  description = "Timezone"
}

variable "CORS_ALLOWED_ORIGINS" {
  type        = list(string)
  description = "CORS allowed origins"
  default     = []
}

variable "DEFAULT_FROM_EMAIL" {
  type        = string
  description = "Default from email"
}

variable "EMAIL_HOST" {
  type        = string
  description = "Email Host"
  default     = "smtp.gmail.com"
}

variable "EMAIL_HOST_PASSWORD" {
  type        = string
  description = "Email host password"
}

variable "DOMAIN" {
  type        = string
  description = "Domain name"
}

variable "AWS_ACCESS_KEY_ID" {
  type        = string
  description = "Aws access key id"
}

variable "AWS_SECRET_ACCESS_KEY" {
  type        = string
  description = "Aws secret access key"
}

variable "GOOGLE_OAUTH2_CLIENT_ID" {
  type        = string
  description = "Google Oauth client id"
}

variable "GOOGLE_OAUTH2_CLIENT_SECRET" {
  type        = string
  description = "Google Oauth client secret"
}

variable "GOOGLE_OAUTH2_PROJECT_ID" {
  type        = string
  description = "Google Oauth project id"
}

variable "DATABASE_URL" {
  type        = string
  description = "Database url"
}

variable "ecr_task_exec_role_arn" {
  type        = string
  description = "ECR Task exec role arn"
}
