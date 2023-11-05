# ------------------ Internet gateway -------------------- #
/* Internet gateway attached to VPC for the public subnet */
resource "aws_internet_gateway" "i_gateway" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    "Name" : "${var.PROJECT_NAME}-internet-gateway",
    "resource" = "${var.PROJECT_NAME}-internet-gateway",
  }
}
