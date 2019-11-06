resource "aws_security_group" "mi_aguila_public_security_group" {
  name        = "${var.aws_region}_${var.environment}_mi_aguila_public_security_group"
  description = "Allow incoming HTTP connections & SSH access"

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  vpc_id = aws_vpc.mi_aguila.id

  tags = {
    Name = "${var.aws_region} ${var.environment} Mi Aguila Public Security Group"
  }
}

resource "aws_security_group" "mi_aguila_private_security_group" {
  name        = "${var.aws_region}_${var.environment}_mi_aguila_private_security_group"
  description = "Allow traffic from public subnet"

  ingress {
    from_port = -1
    to_port   = -1
    protocol  = "icmp"
    cidr_blocks = [
      var.public_subnet_cidr_a]
  }

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    cidr_blocks = [
      var.public_subnet_cidr_a]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  vpc_id = aws_vpc.mi_aguila.id

  tags = {
    Name = "${var.aws_region} ${var.environment} Mi Aguila Private Security Group"
  }
}