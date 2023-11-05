output "PRIVATE_SUBNET_IDS" {
  value = [for k, v in aws_subnet.private_subnets : aws_subnet.private_subnets[k].id]
}
output "PUBLIC_SUBNET_IDS" {
  value = [for k, v in aws_subnet.public_subnets : aws_subnet.public_subnets[k].id]
}

output "VPC_ID" {
  value = aws_vpc.vpc.id
}

output "SECURITY_GROUP_IDS" {
  value = [aws_security_group.public-security-group.id, ]
}

output "DATABASE_URL" {
  value = aws_db_instance.rds.address
}
