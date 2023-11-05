# Deploy Infra for Django based application on AWS using Terraform and circleci

## Env variables to add in circle project settings
- ALLOWED_HOSTS
- AWS_ACCESS_KEY_ID
- AWS_REGION
- AWS_S3_BUCKET
- AWS_SECRET_ACCESS_KEY
- CORS_ALLOWED_ORIGINS
- DATABASE_PASSWORD
- DEBUG
- DEFAULT_FROM_EMAIL
- DJANGO_SECRET_KEY
- DJANGO_SETTINGS_MODULE
- EMAIL_HOST_PASSWORD
- GOOGLE_OAUTH2_CLIENT_ID
- GOOGLE_OAUTH2_CLIENT_ID
- GOOGLE_OAUTH2_PROJECT_ID
- PRIVATE_SUBNET_CIDRS
- PRODUCT_ENVIRONMENT
- PROJECT_NAME

## Resources to be launched via terraform
- 1 Private VPC
- 2 Private Subnet
- 2 Public Subnet
- 1 Security Group for public access
- 1 Security Group for RDS
- 1 Private Route Table and association with Private subnet
- 1 Public Route Table and association with Public subnet
- 1 RDS
- 1 NAT Gateway
- 1 Internet Gateway
- 1 Elastic IP
- ECR
- ECS Cluster
- Task definitions
- Target Group
- Cloudwatch logs
- Application Load Balancer

Learn more about VPC and other associated services: https://blogs.prodinit.com/aws/all-about-vpc-and-other-related-services

## CircleCI Flow
![circle ci](https://raw.githubusercontent.com/prodinit/ecs-django-scaffold/master/.github/circleci.png)