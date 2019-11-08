resource "aws_elasticache_subnet_group" "mi_aguila_subnet_group" {
  name = "${var.aws_region}-${var.environment}-mi-aguila-cache-subnet-group"
  subnet_ids = [
    aws_subnet.private_subnet_a.id,
    aws_subnet.private_subnet_b.id]
}