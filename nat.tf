resource "aws_eip" "eip-1" {
  domain = "vpc"
  tags = {
    Name = "eip-1"
  }
}

resource "aws_nat_gateway" "Nat-1" {
  allocation_id = aws_eip.eip-1.id
  subnet_id     = aws_subnet.public-1.id

  tags = {
    Name = "gw NAT"
  }
}