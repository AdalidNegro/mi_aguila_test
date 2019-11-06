resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.mi_aguila.id

  tags = {
    Name = "${var.environment} VPC Internet Gateway"
  }
}