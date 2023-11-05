# ------------------ Route Table Association -------------------- #
resource "aws_route_table_association" "public_subnet_asso" {
  count          = length(var.PUBLIC_SUBNET_CIDRS)
  subnet_id      = element(aws_subnet.public_subnets[*].id, count.index)
  route_table_id = aws_route_table.rtb_public.id
}

resource "aws_route_table_association" "private_subnet_asso" {
  count          = length(var.PRIVATE_SUBNET_CIDRS)
  subnet_id      = element(aws_subnet.private_subnets[*].id, count.index)
  route_table_id = aws_route_table.rtb_private.id
}
