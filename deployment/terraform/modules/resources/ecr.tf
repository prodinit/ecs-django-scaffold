resource "aws_ecr_repository" "ecr" {
  name                 = "${var.PROJECT_NAME}-ecr-${var.PRODUCT_ENVIRONMENT}"
  image_tag_mutability = "MUTABLE"
  force_delete         = true
  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    "resource" : "${var.PROJECT_NAME}-ecr-repository",
  }
}

resource "aws_ecr_lifecycle_policy" "ecr_lifecycle_policy" {
  repository = aws_ecr_repository.ecr.name

  policy = <<EOF
{
  "rules": [
    {
      "rulePriority": 1,
      "description": "Keep latest 6 images",
      "selection": {
        "tagStatus": "tagged",
        "tagPrefixList": [
          "web",
          "nginx"
        ],
        "countType": "imageCountMoreThan",
        "countNumber": 6
      },
      "action": {
        "type": "expire"
      }
    },
    {
      "rulePriority": 2,
      "description": "Remove images pushed before 15 days.",
      "selection": {
        "tagStatus": "any",
        "countType": "sinceImagePushed",
        "countUnit": "days",
        "countNumber": 15
      },
      "action": {
        "type": "expire"
      }
    }
  ]
}
EOF
}
