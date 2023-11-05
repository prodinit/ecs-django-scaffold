resource "aws_db_subnet_group" "db-subnet-group" {
  name       = "${var.PROJECT_NAME}-db-subnet-group"
  subnet_ids = [for subnet in aws_subnet.private_subnets : subnet.id]
}

resource "aws_db_instance" "rds" {
  allocated_storage      = 20
  engine                 = "postgres"
  engine_version         = "15.3"
  identifier             = "${var.PROJECT_NAME}-postgres-db"
  instance_class         = "db.t3.micro"
  username               = "postgres"
  password               = var.DATABASE_PASSWORD
  db_subnet_group_name   = aws_db_subnet_group.db-subnet-group.id
  vpc_security_group_ids = [aws_security_group.rds-security-group.id]
  skip_final_snapshot    = true
  storage_encrypted      = false
}
