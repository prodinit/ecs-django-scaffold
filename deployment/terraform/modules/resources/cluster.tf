resource "aws_ecs_cluster" "ecs" {
  name = "${var.PROJECT_NAME}-cluster-${var.PRODUCT_ENVIRONMENT}"
  setting {
    name  = "containerInsights"
    value = "enabled"
  }
  tags = {
    "resource" : "${var.PROJECT_NAME}-ecs-cluster",
  }
}
