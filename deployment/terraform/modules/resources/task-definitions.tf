
resource "aws_ecs_task_definition" "web-task" {
  family = "${var.PROJECT_NAME}-web-task-definition"
  container_definitions = templatefile("${path.module}/task-definitions/web.tf.json", {
    aws_logs_region             = var.AWS_REGION
    backend_image_repo_url      = "${aws_ecr_repository.ecr.repository_url}:web"
    nginx_image_repo_url        = "${aws_ecr_repository.ecr.repository_url}:nginx"
    build_id                    = var.BUILD_ID
    DJANGO_DEBUG                = var.DEBUG
    DJANGO_SETTINGS_MODULE      = var.DJANGO_SETTINGS_MODULE
    DJANGO_ADMIN_URL            = var.DJANGO_ADMIN_URL
    DJANGO_SECRET_KEY           = var.DJANGO_SECRET_KEY
    ALLOWED_HOSTS               = jsonencode(var.ALLOWED_HOSTS)
    TIME_ZONE                   = var.TIME_ZONE
    CORS_ALLOWED_ORIGINS        = jsonencode(var.CORS_ALLOWED_ORIGINS)
    DEFAULT_FROM_EMAIL          = var.DEFAULT_FROM_EMAIL
    EMAIL_HOST                  = var.EMAIL_HOST
    EMAIL_HOST_PASSWORD         = var.EMAIL_HOST_PASSWORD
    DOMAIN                      = var.DOMAIN
    AWS_ACCESS_KEY_ID           = var.AWS_ACCESS_KEY_ID
    AWS_SECRET_ACCESS_KEY       = var.AWS_SECRET_ACCESS_KEY
    AWS_DEFAULT_REGION          = var.AWS_REGION
    GOOGLE_OAUTH2_CLIENT_ID     = var.GOOGLE_OAUTH2_CLIENT_ID
    GOOGLE_OAUTH2_CLIENT_SECRET = var.GOOGLE_OAUTH2_CLIENT_SECRET
    GOOGLE_OAUTH2_PROJECT_ID    = var.GOOGLE_OAUTH2_PROJECT_ID
    DATABASE_URL                = var.DATABASE_URL
    PRODUCT_ENVIRONMENT         = var.PRODUCT_ENVIRONMENT
  })

  execution_role_arn       = var.ecr_task_exec_role_arn
  task_role_arn            = var.ecr_task_exec_role_arn
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"

  tags = {
    Name = "Web Task"
    "resource" : "${var.PROJECT_NAME}-web-task",
  }
}
