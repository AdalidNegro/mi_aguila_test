resource "aws_vpc" "mi_aguila" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true

  tags = {
    Name = "${var.aws_region}-${var.environment}_mi_aguila_vpc"
  }
}