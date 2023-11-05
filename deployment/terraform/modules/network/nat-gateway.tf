# ------------------ NAT -------------------- #
resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.elastic_ip.id
  subnet_id     = aws_subnet.public_subnets[0].id

  depends_on = [aws_internet_gateway.i_gateway]
  tags = {
    "Name" : "${var.PROJECT_NAME}-nat",
    "resource" = "${var.PROJECT_NAME}-nat",
  }
}
