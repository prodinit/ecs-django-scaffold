resource "aws_lb" "load-balancer" {
  name               = "${var.PROJECT_NAME}-load-balancer-${var.PRODUCT_ENVIRONMENT}"
  subnets            = var.PUBLIC_SUBNET_IDS
  security_groups    = var.SECURITY_GROUP_IDS
  load_balancer_type = "application"
  idle_timeout       = 4000
  # internal           = true
  access_logs {
    bucket  = var.AWS_S3_BUCKET
    prefix  = "loadbalancer-lb-logs"
    enabled = true
  }
  tags = {
    "Name" : "${var.PROJECT_NAME}-load-balancer",
    "resource" : "${var.PROJECT_NAME}-load-balancer",
  }
}

resource "aws_lb_listener" "alb-listener" {
  load_balancer_arn = aws_lb.load-balancer.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    target_group_arn = aws_lb_target_group.target-group.arn
    type             = "forward"
  }
}
