variable "PROJECT_NAME" {
  type        = string
  description = "Name of the project"
  default     = "prodinit"
}

variable "DEVELOPER_CONTACT_LIST" {
  type        = string
  description = "Comma separated email for developers"
  default     = "dishant@prodinit.com"
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

variable "PRIVATE_SUBNET_CIDRS" {
  type        = list(any)
  description = "List of private subnet cidr"
}

variable "DATABASE_PASSWORD" {
  type        = string
  description = "Password for RDS Postgres database"
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
  default     = "admin"
}

variable "DJANGO_SECRET_KEY" {
  type        = string
  description = "Django secret key"
}

variable "ALLOWED_HOSTS" {
  type        = list(string)
  description = "Allowed hosts"
  default     = ["*"]
}

variable "TIME_ZONE" {
  type        = string
  description = "Timezone"
  default     = "UTC"
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
  default     = "http://127.0.0.1:8000"
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
