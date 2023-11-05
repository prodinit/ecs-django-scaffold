resource "aws_lb_target_group" "target-group" {
  name        = "${var.PROJECT_NAME}-target-group"
  port        = "80"
  protocol    = "HTTP"
  vpc_id      = var.VPC_ID
  target_type = "ip"

  stickiness {
    enabled = false
    type    = "lb_cookie"
  }

  health_check {
    healthy_threshold   = "7" # The number of consecutive health checks successes
    unhealthy_threshold = "2" # The number of consecutive health checks failures
    interval            = "120"
    timeout             = "110"
    port                = "traffic-port"
    protocol            = "HTTP"
    path                = "/health"
    matcher             = "200-205"
  }

  tags = {
    "Name" = "${var.PROJECT_NAME}-target-group",
    "resource" : "${var.PROJECT_NAME}-target-group",
  }
}
