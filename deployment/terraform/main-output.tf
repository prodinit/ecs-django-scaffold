output "ecr_url" {
  description = "ECR link for app"
  value       = module.resources.ecr_url
}

output "ecs_cluster" {
  description = "ECS Cluster name"
  value       = module.resources.ecs_cluster
}

output "ecs_service" {
  description = "ECS Service name"
  value       = module.resources.ecs_service
}

output "DATABASE_URL" {
  value = module.network.DATABASE_URL
}
