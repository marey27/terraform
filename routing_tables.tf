resource "aws_default_route_table" "default_route_table" {
  default_route_table_id = aws_vpc.vpc-1.default_route_table_id
  tags = {
    Name = "default_route_table"
  }
}


resource "aws_route" "default_route" {
  route_table_id         = aws_default_route_table.default_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw-1.id

}

resource "aws_route_table_association" "public-1" {
  subnet_id      = aws_subnet.public-1.id
  route_table_id = aws_default_route_table.default_route_table.id
}

resource "aws_route_table_association" "public-2" {
  subnet_id      = aws_subnet.public-2.id
  route_table_id = aws_default_route_table.default_route_table.id
}

### create route table for private subnets

resource "aws_route_table" "private_routing_table" {
  vpc_id = aws_vpc.vpc-1.id

  tags = {
    Name = "private_table"
  }
}
resource "aws_route" "private_route" {

  route_table_id         = aws_route_table.private_routing_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_nat_gateway.Nat-1.id


}
resource "aws_route_table_association" "private-1" {
  subnet_id      = aws_subnet.private-1.id
  route_table_id = aws_route_table.private_routing_table.id
}

resource "aws_route_table_association" "private-2" {
  subnet_id      = aws_subnet.private-2.id
  route_table_id = aws_route_table.private_routing_table.id
}



