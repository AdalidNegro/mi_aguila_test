resource "aws_nat_gateway" "mi_aguila_nat_gateway" {
  allocation_id = aws_eip.nat_ip.id
  subnet_id     = aws_subnet.public_subnet_a.id

  tags = {
    Name = "Mi Aguila gateway NAT"
  }
}