resource "aws_cloudwatch_log_group" "logs" {
  name = "${var.PROJECT_NAME}-logs-${var.PRODUCT_ENVIRONMENT}"


  tags = {
    "resource" : "${var.PROJECT_NAME}-cloudwatch-logs",
  }
}
