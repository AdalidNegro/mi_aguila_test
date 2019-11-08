resource "aws_subnet" "public_subnet_a" {
  vpc_id            = aws_vpc.mi_aguila.id
  cidr_block        = var.public_subnet_cidr_a
  availability_zone = "${var.aws_region}a"

  tags = {
    Name = "${var.environment} Public Subnet Zone A"
  }
}

resource "aws_subnet" "public_subnet_b" {
  vpc_id            = aws_vpc.mi_aguila.id
  cidr_block        = var.public_subnet_cidr_b
  availability_zone = "${var.aws_region}b"

  tags = {
    Name = "${var.environment} Public Subnet Zone B"
  }
}

resource "aws_subnet" "private_subnet_a" {
  vpc_id            = aws_vpc.mi_aguila.id
  cidr_block        = var.private_subnet_cidr_a
  availability_zone = "${var.aws_region}a"

  tags = {
    Name = "${var.environment} Private Subnet Zone A"
  }
}

resource "aws_subnet" "private_subnet_b" {
  vpc_id            = aws_vpc.mi_aguila.id
  cidr_block        = var.private_subnet_cidr_b
  availability_zone = "${var.aws_region}b"

  tags = {
    Name = "${var.environment} Private Subnet Zone B"
  }
}