resource "aws_security_group" "public-security-group" {
  name        = "${var.PROJECT_NAME}-security-group"
  description = "Security group for public access"
  vpc_id      = aws_vpc.vpc.id

  egress {
    # allow all traffic to private SN
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = "0"
    to_port   = "0"
    protocol  = "-1"
    self      = true
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    description = "Allow SSH"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "TCP"
    description = "worldwide"
    cidr_blocks = ["0.0.0.0/0"]
  }


  tags = {
    Name     = "public security group",
    resource = "public-security-group"
  }
}

resource "aws_security_group" "rds-security-group" {
  name        = "${var.PROJECT_NAME}-rds-security-group"
  description = "Security group for RDS access"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description     = "Allow traffic only from web SG"
    from_port       = 3306
    to_port         = 3306
    protocol        = "TCP"
    security_groups = [aws_security_group.public-security-group.id]
  }
}
