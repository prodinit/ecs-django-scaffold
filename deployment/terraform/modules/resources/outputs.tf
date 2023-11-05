output "ecr_url" {
  value = aws_ecr_repository.ecr.repository_url
}

output "ecs_cluster" {
  value = aws_ecs_cluster.ecs.name
}

output "ecs_service" {
  value = aws_ecs_service.web-service.name
}
