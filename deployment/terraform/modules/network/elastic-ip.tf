# ------------------ Elastic IP for NAT -------------------- #
resource "aws_eip" "elastic_ip" {
  vpc        = true
  depends_on = [aws_internet_gateway.i_gateway]

  tags = {
    "Name" : "${var.PROJECT_NAME}-elastic-ip",
    "resource" = "${var.PROJECT_NAME}-elastic-ip",
  }
}
