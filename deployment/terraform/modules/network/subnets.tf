# ------------------ Subnets -------------------- #
resource "aws_subnet" "private_subnets" {
  count             = length(var.PRIVATE_SUBNET_CIDRS)
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = element(var.PRIVATE_SUBNET_CIDRS, count.index)
  availability_zone = data.aws_availability_zones.available.names[count.index]

  tags = {
    "Name" : "${var.PROJECT_NAME}-private-subnet",
    "resource" : "${var.PROJECT_NAME}-private-subnet ${count.index + 1}",
  }
}

resource "aws_subnet" "public_subnets" {
  count                   = length(var.PUBLIC_SUBNET_CIDRS)
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = element(var.PUBLIC_SUBNET_CIDRS, count.index)
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = "true"

  tags = {
    "Name" : "${var.PROJECT_NAME}-public-subnet",
    "resource" = "${var.PROJECT_NAME}-public-subnet ${count.index + 1}",
  }
}
