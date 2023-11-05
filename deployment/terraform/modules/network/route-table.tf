# ------------------ Route Table -------------------- #
resource "aws_route_table" "rtb_private" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id
  }
  tags = {
    "Name" : "${var.PROJECT_NAME}-private-rt",
    "resource" = "Private Route Table"
  }
}

resource "aws_route_table" "rtb_public" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.i_gateway.id
  }

  tags = {
    "Name" : "${var.PROJECT_NAME}-public-rt",
    "resource" = "Public Route Table"
  }
}

