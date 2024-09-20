resource "aws_eip" "nat_eip" {
  # Allocate an Elastic IP for the NAT Gateway
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = var.public_subnet_id

  tags = {
    Name = "MyNATGateway"
  }
}
