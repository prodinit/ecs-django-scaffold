resource "aws_ecs_service" "web-service" {
  name            = "${var.PROJECT_NAME}-web-service"
  cluster         = aws_ecs_cluster.ecs.id
  task_definition = aws_ecs_task_definition.web-task.family
  desired_count   = var.DESIRED_CAPACITY
  launch_type     = "FARGATE"
  network_configuration {
    security_groups = var.SECURITY_GROUP_IDS
    subnets         = var.PRIVATE_SUBNET_IDS
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.target-group.arn
    container_port   = 80
    container_name   = "nginx"
  }
  propagate_tags = "TASK_DEFINITION"
  depends_on     = [aws_lb.load-balancer]

  tags = {
    "Name" = "Web Service"
    "resource" : "${var.PROJECT_NAME}-web-service",
  }
}
